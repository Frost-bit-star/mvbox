# MovieBox OTA updates

The patched app contains an updater (`updater-src/UpdateChecker.smali`) that runs
on launch and fetches:

```
https://raw.githubusercontent.com/frost-bit-star/mvbox/main/update.json
```

It compares `versionCode` with the installed app. If the remote one is higher it
shows a dialog, downloads `apkUrl`, and launches the Android installer. Because
the package name and signing key stay the same, the app updates **in place** — no
uninstall/reinstall.

## How it works

```
moviebox.apk (LFS) --push--> GitHub Actions --release--> moviebox.apk asset
                                        \--> update.json on main
                                                    |
User device --> raw.githubusercontent.com/.../update.json --> download release --> install
```

## Repository files

| File | Purpose |
| --- | --- |
| `moviebox.apk` | Current signed build, stored with **Git LFS** (pointer in git, ~77 MB blob in LFS) |
| `update.json` | OTA manifest polled by the app |
| `.github/workflows/deploy.yml` | Builds the release and refreshes `update.json` |
| `updater-src/` | Reference copy of the injected updater smali + manifest entries |
| `.gitattributes` | Marks `moviebox.apk` as an LFS file |

## `update.json` format

```json
{
  "versionCode": 50020133,
  "versionName": "4.0.02.0903.04",
  "apkUrl": "https://github.com/frost-bit-star/mvbox/releases/latest/download/moviebox.apk",
  "title": "frostbitstar",
  "message": "A new version of MovieBox is available.",
  "changelog": "• Bug fixes and improvements",
  "force": false
}
```

`force: true` hides the "Later" button.

## Releasing an update

1. Build and sign the new APK with the **same signing key** as the installed app
   (currently the debug key in `debug.keystore`).
   **A different key gives "App not installed" — users would have to uninstall.**
2. Bump `versionCode` (and normally `versionName`). It must be **greater** than
   the value in `update.json`, otherwise devices will not see the update.
3. Replace the APK and push:

   ```bash
   export PATH="$HOME/.local/bin:$PATH"   # git-lfs lives here
   cp /path/to/new/signed.apk moviebox.apk
   git add moviebox.apk
   git commit -m "release: <versionName>"
   git push
   ```

4. GitHub Actions (`.github/workflows/deploy.yml`) then:
   - reads `versionCode` / `versionName` from the APK,
   - fails if `versionCode` is lower than `update.json` (equal is allowed with a
     warning, so the first publish of the current build works),
   - creates/updates the release tagged `v<versionName>` with asset
     `moviebox.apk` and makes it the latest release,
   - rewrites `update.json` on `main` and commits it.

You can also trigger it manually from **Actions → Deploy MovieBox Update → Run
workflow** to set a custom `changelog`, `message`, or `force` flag.

## First deploy / after changing this workflow

Run the workflow manually from the **Actions** tab on `main`. Do **not** use
"Re-run" on an old failed run — it uses the old workflow definition.

## Git LFS

The APK is tracked with Git LFS via this `.gitattributes` rule:

```
moviebox.apk filter=lfs diff=lfs merge=lfs -text
```

The deploy workflow checks the repo out with `lfs: true`, so it gets the real
APK, not the pointer.

Install the local hook once per machine:

```bash
git lfs install
```

If `git lfs` is not on your `PATH` after a fresh install (common when it lives in
`~/.local/bin`), run `export PATH="$HOME/.local/bin:$PATH"` before Git commands,
or you will see `moviebox.apk` as modified and commits can get confused.

Verify what is tracked:

```bash
git lfs ls-files          # 90346d2be6 * moviebox.apk
git cat-file -p HEAD:moviebox.apk   # should show "version https://git-lfs.github.com/spec/v1"
```

**Quotas:** GitHub's free LFS tier is ~1 GB storage and ~1 GB/month bandwidth.
Each release adds ~77 MB to storage, and CI checkout downloads it. Fine for a few
releases; prune old versions if you approach the limit.

## Required repo settings

- Default branch must be `main` (the updater also tries `master`).
- **Settings → Actions → General → Workflow permissions → Read and write** (so
  the workflow can push `update.json` and create releases).
- Keep `moviebox.apk` under GitHub's 100 MB per-file limit (it is ~77 MB).

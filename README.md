# MovieBox OTA updates

The patched app contains an updater (`updater-src/UpdateChecker.smali`) that on
launch fetches:

```
https://raw.githubusercontent.com/frost-bit-star/mvbox/main/update.json
```

If `versionCode` is greater than the installed version, it shows a dialog, then
downloads `apkUrl` and launches the Android installer. Because the package name
and signing key stay the same, the app updates in place (no uninstall needed).

## Releasing an update

1. Build and sign the new APK with the **same signing key** used for the version
   your users already have (currently the debug key in `debug.keystore`).
   **Different key = "App not installed" and users must uninstall.**
2. Bump `versionCode` (and usually `versionName`) in the build. It must be
   higher than the current value in `update.json`.
3. Replace `moviebox.apk` in this repo with the new signed APK, commit and push.
4. GitHub Actions (`.github/workflows/deploy.yml`) automatically:
   - reads versionCode/versionName from the APK,
   - refuses to publish if versionCode did not increase,
   - creates/updates the `moviebox.apk` release asset,
   - regenerates `update.json` on `main`.

You can also run the workflow manually from the Actions tab to set a custom
changelog / message / force flag.

## Required repo settings

- Default branch must be `main` (the updater also tries `master`).
- Settings → Actions → General → Workflow permissions → **Read and write**.
- Keep `moviebox.apk` under the 100 MB GitHub file limit (it is ~77 MB).

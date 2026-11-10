.class public final Lcom/community/oneroom/updater/UpdateChecker;
.super Ljava/lang/Object;
.source "UpdateChecker.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "MvboxUpdater"

.field private static final UPDATE_URLS:[Ljava/lang/String;

.field private static volatile running:Z

.field private static snoozedVersion:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "https://raw.githubusercontent.com/frost-bit-star/mvbox/main/update.json"

    const-string v1, "https://raw.githubusercontent.com/frost-bit-star/mvbox/master/update.json"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/community/oneroom/updater/UpdateChecker;->UPDATE_URLS:[Ljava/lang/String;

    const/4 v0, 0x0

    sput-boolean v0, Lcom/community/oneroom/updater/UpdateChecker;->running:Z

    const-wide/16 v0, -0x1

    sput-wide v0, Lcom/community/oneroom/updater/UpdateChecker;->snoozedVersion:J

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()[Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/community/oneroom/updater/UpdateChecker;->UPDATE_URLS:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 0

    invoke-static {v0}, Lcom/community/oneroom/updater/UpdateChecker;->fetchJson(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Landroid/content/Context;)J
    .locals 2

    invoke-static {v2}, Lcom/community/oneroom/updater/UpdateChecker;->currentVersionCode(Landroid/content/Context;)J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$300()J
    .locals 2

    sget-wide v0, Lcom/community/oneroom/updater/UpdateChecker;->snoozedVersion:J

    return-wide v0
.end method

.method static synthetic access$302(J)J
    .locals 0

    sput-wide v0, Lcom/community/oneroom/updater/UpdateChecker;->snoozedVersion:J

    return-wide v0
.end method

.method static synthetic access$400(Landroid/app/Activity;Lorg/json/JSONObject;J)V
    .locals 0

    invoke-static {v0, v1, v2, v3}, Lcom/community/oneroom/updater/UpdateChecker;->showDialog(Landroid/app/Activity;Lorg/json/JSONObject;J)V

    return-void
.end method

.method static synthetic access$502(Z)Z
    .locals 0

    sput-boolean v0, Lcom/community/oneroom/updater/UpdateChecker;->running:Z

    return v0
.end method

.method static synthetic access$600(Landroid/app/Activity;Ljava/lang/String;J)V
    .locals 0

    invoke-static {v0, v1, v2, v3}, Lcom/community/oneroom/updater/UpdateChecker;->downloadAndInstall(Landroid/app/Activity;Ljava/lang/String;J)V

    return-void
.end method

.method static synthetic access$700(Ljava/lang/String;Ljava/io/File;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-static {v0, v1}, Lcom/community/oneroom/updater/UpdateChecker;->download(Ljava/lang/String;Ljava/io/File;)V

    return-void
.end method

.method static synthetic access$800(Landroid/content/Context;Ljava/io/File;)Landroid/net/Uri;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-static {v0, v1}, Lcom/community/oneroom/updater/UpdateChecker;->fileUri(Landroid/content/Context;Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$900(Landroid/content/Context;Landroid/net/Uri;)V
    .locals 0

    invoke-static {v0, v1}, Lcom/community/oneroom/updater/UpdateChecker;->install(Landroid/content/Context;Landroid/net/Uri;)V

    return-void
.end method

.method public static checkOnLaunch(Landroid/app/Activity;)V
    .locals 4

    sget-boolean v0, Lcom/community/oneroom/updater/UpdateChecker;->running:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    sput-boolean v0, Lcom/community/oneroom/updater/UpdateChecker;->running:Z

    const-string v1, "MvboxUpdater"

    const-string v2, "check start"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v4}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lcom/community/oneroom/updater/UpdateChecker$1;

    invoke-direct {v3, v1, v4}, Lcom/community/oneroom/updater/UpdateChecker$1;-><init>(Landroid/content/Context;Landroid/app/Activity;)V

    const-string v4, "mvbox-update-check"

    invoke-direct {v2, v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/Thread;->setDaemon(Z)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method private static currentVersionCode(Landroid/content/Context;)J
    .locals 2

    :try_start_0
    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const/4 v1, 0x0

    invoke-virtual {v0, v2, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    iget v2, v2, Landroid/content/pm/PackageInfo;->versionCode:I
    :try_end_f
    .catchall {:try_start_0 .. :try_end_f} :catchall_11

    int-to-long v0, v2

    return-wide v0

    :catchall_11
    move-exception v2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method private static download(Ljava/lang/String;Ljava/io/File;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    nop

    nop

    nop

    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".part"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x0

    :try_start_20
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, v8}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v8

    check-cast v8, Ljava/net/HttpURLConnection;
    :try_end_2b
    .catchall {:try_start_20 .. :try_end_2b} :catchall_c5

    const/16 v2, 0x4e20

    :try_start_2d
    invoke-virtual {v8, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    const v2, 0xea60

    invoke-virtual {v8, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const/4 v2, 0x1

    invoke-virtual {v8, v2}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    const-string v2, "User-Agent"

    const-string v3, "MovieBox-Updater"

    invoke-virtual {v8, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v2

    const/16 v3, 0xc8

    if-lt v2, v3, :cond_a7

    const/16 v3, 0x12c

    if-ge v2, v3, :cond_a7

    invoke-virtual {v8}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v2
    :try_end_51
    .catchall {:try_start_2d .. :try_end_51} :catchall_c0

    :try_start_51
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_56
    .catchall {:try_start_51 .. :try_end_56} :catchall_a2

    const/16 v4, 0x4000

    :try_start_58
    new-array v4, v4, [B

    :goto_5a
    invoke-virtual {v2, v4}, Ljava/io/InputStream;->read([B)I

    move-result v5

    if-lez v5, :cond_65

    const/4 v6, 0x0

    invoke-virtual {v3, v4, v6, v5}, Ljava/io/FileOutputStream;->write([BII)V

    goto :goto_5a

    :cond_65
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->flush()V

    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_6b
    .catchall {:try_start_58 .. :try_end_6b} :catchall_a0

    nop

    :try_start_6c
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_75

    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    :cond_75
    invoke-virtual {v0, v9}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v3
    :try_end_79
    .catchall {:try_start_6c .. :try_end_79} :catchall_a2

    if-eqz v3, :cond_98

    nop

    if-eqz v2, :cond_83

    :try_start_7e
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_81
    .catchall {:try_start_7e .. :try_end_81} :catchall_82

    goto :goto_83

    :catchall_82
    move-exception v1

    :cond_83
    :goto_83
    if-eqz v8, :cond_88

    invoke-virtual {v8}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_88
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_97

    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v8

    if-nez v8, :cond_97

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    :cond_97
    return-void

    :cond_98
    :try_start_98
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "rename failed"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_a0
    .catchall {:try_start_98 .. :try_end_a0} :catchall_a2

    :catchall_a0
    move-exception v1

    goto :goto_ca

    :catchall_a2
    move-exception v3

    move-object v7, v3

    move-object v3, v1

    move-object v1, v7

    goto :goto_ca

    :cond_a7
    :try_start_a7
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "HTTP "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_c0
    .catchall {:try_start_a7 .. :try_end_c0} :catchall_c0

    :catchall_c0
    move-exception v2

    move-object v3, v1

    move-object v1, v2

    move-object v2, v3

    goto :goto_ca

    :catchall_c5
    move-exception v8

    move-object v2, v1

    move-object v3, v2

    move-object v1, v8

    move-object v8, v3

    :goto_ca
    if-eqz v3, :cond_d1

    :try_start_cc
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_cf
    .catchall {:try_start_cc .. :try_end_cf} :catchall_d0

    goto :goto_d1

    :catchall_d0
    move-exception v3

    :cond_d1
    :goto_d1
    if-eqz v2, :cond_d8

    :try_start_d3
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_d6
    .catchall {:try_start_d3 .. :try_end_d6} :catchall_d7

    goto :goto_d8

    :catchall_d7
    move-exception v2

    :cond_d8
    :goto_d8
    if-eqz v8, :cond_dd

    invoke-virtual {v8}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_dd
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_ec

    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v8

    if-nez v8, :cond_ec

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    :cond_ec
    throw v1
.end method

.method private static downloadAndInstall(Landroid/app/Activity;Ljava/lang/String;J)V
    .locals 2

    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-string v0, "Downloading update..."

    const/4 v1, 0x0

    invoke-static {v2, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/community/oneroom/updater/UpdateChecker$4;

    invoke-direct {v1, v2, v4, v5, v3}, Lcom/community/oneroom/updater/UpdateChecker$4;-><init>(Landroid/content/Context;JLjava/lang/String;)V

    const-string v2, "mvbox-update-download"

    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/Thread;->setDaemon(Z)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method private static fetchJson(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 8

    const-string v0, "MvboxUpdater"

    nop

    const/4 v1, 0x0

    :try_start_4
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, v8}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    check-cast v2, Ljava/net/HttpURLConnection;
    :try_end_f
    .catchall {:try_start_4 .. :try_end_f} :catchall_95

    const/16 v3, 0x3a98

    :try_start_11
    invoke-virtual {v2, v3}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    const/16 v3, 0x4e20

    invoke-virtual {v2, v3}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    const-string v3, "User-Agent"

    const-string v4, "MovieBox-Updater"

    invoke-virtual {v2, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "Accept"

    const-string v4, "application/json"

    invoke-virtual {v2, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v3

    const/16 v4, 0xc8

    if-lt v3, v4, :cond_6a

    const/16 v4, 0x12c

    if-lt v3, v4, :cond_38

    goto :goto_6a

    :cond_38
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v3
    :try_end_3c
    .catchall {:try_start_11 .. :try_end_3c} :catchall_92

    :try_start_3c
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v5, 0x1000

    new-array v5, v5, [B

    :goto_45
    invoke-virtual {v3, v5}, Ljava/io/InputStream;->read([B)I

    move-result v6

    if-lez v6, :cond_50

    const/4 v7, 0x0

    invoke-virtual {v4, v5, v7, v6}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_45

    :cond_50
    new-instance v5, Lorg/json/JSONObject;

    const-string v6, "UTF-8"

    invoke-virtual {v4, v6}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v5, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_5b
    .catchall {:try_start_3c .. :try_end_5b} :catchall_68

    if-eqz v3, :cond_62

    :try_start_5d
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_60
    .catchall {:try_start_5d .. :try_end_60} :catchall_61

    goto :goto_62

    :catchall_61
    move-exception v8

    :cond_62
    :goto_62
    if-eqz v2, :cond_67

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_67
    return-object v5

    :catchall_68
    move-exception v4

    goto :goto_98

    :cond_6a
    :goto_6a
    :try_start_6a
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "update json http "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_8a
    .catchall {:try_start_6a .. :try_end_8a} :catchall_92

    nop

    nop

    if-eqz v2, :cond_91

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_91
    return-object v1

    :catchall_92
    move-exception v4

    move-object v3, v1

    goto :goto_98

    :catchall_95
    move-exception v4

    move-object v2, v1

    move-object v3, v2

    :goto_98
    :try_start_98
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "update json failed "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v5, ": "

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v0, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_b8
    .catchall {:try_start_98 .. :try_end_b8} :catchall_c6

    nop

    if-eqz v3, :cond_c0

    :try_start_bb
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_be
    .catchall {:try_start_bb .. :try_end_be} :catchall_bf

    goto :goto_c0

    :catchall_bf
    move-exception v8

    :cond_c0
    :goto_c0
    if-eqz v2, :cond_c5

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_c5
    return-object v1

    :catchall_c6
    move-exception v8

    if-eqz v3, :cond_ce

    :try_start_c9
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_cc
    .catchall {:try_start_c9 .. :try_end_cc} :catchall_cd

    goto :goto_ce

    :catchall_cd
    move-exception v0

    :cond_ce
    :goto_ce
    if-eqz v2, :cond_d3

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_d3
    throw v8
.end method

.method private static fileUri(Landroid/content/Context;Ljava/io/File;)Landroid/net/Uri;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".download.fileprovider"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "androidx.core.content.FileProvider"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x3

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Landroid/content/Context;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-class v4, Ljava/lang/String;

    const/4 v6, 0x1

    aput-object v4, v3, v6

    const-class v4, Ljava/io/File;

    const/4 v7, 0x2

    aput-object v4, v3, v7

    const-string v4, "getUriForFile"

    invoke-virtual {v1, v4, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v8, v2, v5

    aput-object v0, v2, v6

    aput-object v9, v2, v7

    const/4 v8, 0x0

    invoke-virtual {v1, v8, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/net/Uri;

    return-object v8
.end method

.method private static install(Landroid/content/Context;Landroid/net/Uri;)V
    .locals 3

    const/4 v0, 0x1

    :try_start_1
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "application/vnd.android.package-archive"

    invoke-virtual {v1, v4, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const/high16 v4, 0x10000000

    invoke-virtual {v1, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v3, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_18
    .catchall {:try_start_1 .. :try_end_18} :catchall_19

    goto :goto_2a

    :catchall_19
    move-exception v4

    const-string v1, "MvboxUpdater"

    const-string v2, "install intent failed"

    invoke-static {v1, v2, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const-string v4, "Could not open the installer"

    invoke-static {v3, v4, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    :goto_2a
    return-void
.end method

.method private static showDialog(Landroid/app/Activity;Lorg/json/JSONObject;J)V
    .locals 5

    invoke-virtual {v5}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    const-string v0, "apkUrl"

    const-string v1, ""

    invoke-virtual {v6, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_16

    return-void

    :cond_16
    const-string v2, "title"

    const-string v3, "frostbitstar"

    invoke-virtual {v6, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "message"

    const-string v4, "A new version is available."

    invoke-virtual {v6, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "changelog"

    invoke-virtual {v6, v4, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_49

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\n\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :cond_49
    const-string v1, "force"

    const/4 v4, 0x0

    invoke-virtual {v6, v1, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v6

    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, v5}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    xor-int/lit8 v2, v6, 0x1

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    new-instance v2, Lcom/community/oneroom/updater/UpdateChecker$2;

    invoke-direct {v2, v5, v0, v7, v8}, Lcom/community/oneroom/updater/UpdateChecker$2;-><init>(Landroid/app/Activity;Ljava/lang/String;J)V

    const-string v5, "Update"

    invoke-virtual {v1, v5, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    if-nez v6, :cond_76

    new-instance v5, Lcom/community/oneroom/updater/UpdateChecker$3;

    invoke-direct {v5, v7, v8}, Lcom/community/oneroom/updater/UpdateChecker$3;-><init>(J)V

    const-string v6, "Later"

    invoke-virtual {v1, v6, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    :cond_76
    :try_start_76
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    :try_end_79
    .catchall {:try_start_76 .. :try_end_79} :catchall_7a

    goto :goto_82

    :catchall_7a
    move-exception v5

    const-string v6, "MvboxUpdater"

    const-string v7, "dialog failed"

    invoke-static {v6, v7, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_82
    return-void
.end method

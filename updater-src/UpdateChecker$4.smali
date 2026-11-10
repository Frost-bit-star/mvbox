.class Lcom/community/oneroom/updater/UpdateChecker$4;
.super Ljava/lang/Object;
.source "UpdateChecker.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/community/oneroom/updater/UpdateChecker;->downloadAndInstall(Landroid/app/Activity;Ljava/lang/String;J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$apkUrl:Ljava/lang/String;

.field final synthetic val$ctx:Landroid/content/Context;

.field final synthetic val$remote:J


# direct methods
.method constructor <init>(Landroid/content/Context;JLjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object v1, v0, Lcom/community/oneroom/updater/UpdateChecker$4;->val$ctx:Landroid/content/Context;

    iput-wide v2, v0, Lcom/community/oneroom/updater/UpdateChecker$4;->val$remote:J

    iput-object v4, v0, Lcom/community/oneroom/updater/UpdateChecker$4;->val$apkUrl:Ljava/lang/String;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    const-string v0, ".apk"

    const-string v1, "update-"

    :try_start_4
    iget-object v2, v8, Lcom/community/oneroom/updater/UpdateChecker$4;->val$ctx:Landroid/content/Context;

    const-string v3, "updates"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    if-nez v2, :cond_14

    iget-object v2, v8, Lcom/community/oneroom/updater/UpdateChecker$4;->val$ctx:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    :cond_14
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_1d

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    :cond_1d
    new-instance v3, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v5, v8, Lcom/community/oneroom/updater/UpdateChecker$4;->val$remote:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v2, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    if-eqz v2, :cond_65

    array-length v4, v2

    const/4 v5, 0x0

    :goto_41
    if-ge v5, v4, :cond_65

    aget-object v6, v2, v5

    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_62

    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_62

    invoke-virtual {v6, v3}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_62

    invoke-virtual {v6}, Ljava/io/File;->delete()Z

    :cond_62
    add-int/lit8 v5, v5, 0x1

    goto :goto_41

    :cond_65
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_75

    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v0

    const-wide/16 v4, 0x0

    cmp-long v0, v0, v4

    if-nez v0, :cond_7a

    :cond_75
    iget-object v0, v8, Lcom/community/oneroom/updater/UpdateChecker$4;->val$apkUrl:Ljava/lang/String;

    invoke-static {v0, v3}, Lcom/community/oneroom/updater/UpdateChecker;->access$700(Ljava/lang/String;Ljava/io/File;)V

    :cond_7a
    iget-object v0, v8, Lcom/community/oneroom/updater/UpdateChecker$4;->val$ctx:Landroid/content/Context;

    invoke-static {v0, v3}, Lcom/community/oneroom/updater/UpdateChecker;->access$800(Landroid/content/Context;Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v2, Lcom/community/oneroom/updater/UpdateChecker$4$1;

    invoke-direct {v2, v8, v0}, Lcom/community/oneroom/updater/UpdateChecker$4$1;-><init>(Lcom/community/oneroom/updater/UpdateChecker$4;Landroid/net/Uri;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_91
    .catchall {:try_start_4 .. :try_end_91} :catchall_92

    goto :goto_ab

    :catchall_92
    move-exception v0

    const-string v1, "MvboxUpdater"

    const-string v2, "update download failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/community/oneroom/updater/UpdateChecker$4$2;

    invoke-direct {v1, v8}, Lcom/community/oneroom/updater/UpdateChecker$4$2;-><init>(Lcom/community/oneroom/updater/UpdateChecker$4;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_ab
    return-void
.end method

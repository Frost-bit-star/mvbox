.class Lcom/community/oneroom/updater/UpdateChecker$1;
.super Ljava/lang/Object;
.source "UpdateChecker.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/community/oneroom/updater/UpdateChecker;->checkOnLaunch(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$ctx:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/app/Activity;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object v1, v0, Lcom/community/oneroom/updater/UpdateChecker$1;->val$ctx:Landroid/content/Context;

    iput-object v2, v0, Lcom/community/oneroom/updater/UpdateChecker$1;->val$activity:Landroid/app/Activity;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    const-string v0, "MvboxUpdater"

    const/4 v1, 0x0

    :try_start_3
    invoke-static {}, Lcom/community/oneroom/updater/UpdateChecker;->access$000()[Ljava/lang/String;

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x0

    move v5, v1

    :goto_a
    if-ge v5, v3, :cond_18

    aget-object v4, v2, v5

    invoke-static {v4}, Lcom/community/oneroom/updater/UpdateChecker;->access$100(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_76

    if-eqz v4, :cond_15

    goto :goto_18

    :cond_15
    add-int/lit8 v5, v5, 0x1

    goto :goto_a

    :cond_18
    :goto_18
    if-nez v4, :cond_1e

    invoke-static {v1}, Lcom/community/oneroom/updater/UpdateChecker;->access$502(Z)Z

    return-void

    :cond_1e
    :try_start_1e
    const-string v2, "versionCode"

    const-wide/16 v5, 0x0

    invoke-virtual {v4, v2, v5, v6}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v2

    iget-object v5, v9, Lcom/community/oneroom/updater/UpdateChecker$1;->val$ctx:Landroid/content/Context;

    invoke-static {v5}, Lcom/community/oneroom/updater/UpdateChecker;->access$200(Landroid/content/Context;)J

    move-result-wide v5

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "remote="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " current="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v0, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    cmp-long v5, v2, v5

    if-lez v5, :cond_70

    invoke-static {}, Lcom/community/oneroom/updater/UpdateChecker;->access$300()J

    move-result-wide v5

    cmp-long v5, v2, v5

    if-eqz v5, :cond_70

    const-string v5, "update available"

    invoke-static {v0, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    nop

    new-instance v5, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v6

    invoke-direct {v5, v6}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v6, Lcom/community/oneroom/updater/UpdateChecker$1$1;

    invoke-direct {v6, v9, v4, v2, v3}, Lcom/community/oneroom/updater/UpdateChecker$1$1;-><init>(Lcom/community/oneroom/updater/UpdateChecker$1;Lorg/json/JSONObject;J)V

    invoke-virtual {v5, v6}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_7c

    :cond_70
    const-string v2, "up to date"

    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_75
    .catchall {:try_start_1e .. :try_end_75} :catchall_76

    goto :goto_7c

    :catchall_76
    move-exception v2

    :try_start_77
    const-string v3, "update check failed"

    invoke-static {v0, v3, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_7c
    .catchall {:try_start_77 .. :try_end_7c} :catchall_81

    :goto_7c
    invoke-static {v1}, Lcom/community/oneroom/updater/UpdateChecker;->access$502(Z)Z

    nop

    return-void

    :catchall_81
    move-exception v0

    invoke-static {v1}, Lcom/community/oneroom/updater/UpdateChecker;->access$502(Z)Z

    throw v0
.end method

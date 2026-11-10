.class Lcom/community/oneroom/updater/UpdateInitProvider$Tracker$1;
.super Ljava/lang/Object;
.source "UpdateInitProvider.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/community/oneroom/updater/UpdateInitProvider$Tracker;->onActivityResumed(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/community/oneroom/updater/UpdateInitProvider$Tracker;


# direct methods
.method constructor <init>(Lcom/community/oneroom/updater/UpdateInitProvider$Tracker;)V
    .locals 0

    iput-object v1, v0, Lcom/community/oneroom/updater/UpdateInitProvider$Tracker$1;->this$0:Lcom/community/oneroom/updater/UpdateInitProvider$Tracker;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    invoke-static {}, Lcom/community/oneroom/updater/UpdateInitProvider;->access$000()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "MvboxUpdater"

    if-eqz v0, :cond_31

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v2

    if-eqz v2, :cond_f

    goto :goto_31

    :cond_f
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "checking from "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v0}, Lcom/community/oneroom/updater/UpdateChecker;->checkOnLaunch(Landroid/app/Activity;)V

    return-void

    :cond_31
    :goto_31
    const-string v0, "target finishing, will retry"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    invoke-static {v0}, Lcom/community/oneroom/updater/UpdateInitProvider;->access$102(Z)Z

    return-void
.end method

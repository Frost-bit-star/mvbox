.class Lcom/community/oneroom/updater/UpdateChecker$4$1;
.super Ljava/lang/Object;
.source "UpdateChecker.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/community/oneroom/updater/UpdateChecker$4;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/community/oneroom/updater/UpdateChecker$4;

.field final synthetic val$uri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Lcom/community/oneroom/updater/UpdateChecker$4;Landroid/net/Uri;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object v1, v0, Lcom/community/oneroom/updater/UpdateChecker$4$1;->this$0:Lcom/community/oneroom/updater/UpdateChecker$4;

    iput-object v2, v0, Lcom/community/oneroom/updater/UpdateChecker$4$1;->val$uri:Landroid/net/Uri;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, v2, Lcom/community/oneroom/updater/UpdateChecker$4$1;->this$0:Lcom/community/oneroom/updater/UpdateChecker$4;

    iget-object v0, v0, Lcom/community/oneroom/updater/UpdateChecker$4;->val$ctx:Landroid/content/Context;

    iget-object v1, v2, Lcom/community/oneroom/updater/UpdateChecker$4$1;->val$uri:Landroid/net/Uri;

    invoke-static {v0, v1}, Lcom/community/oneroom/updater/UpdateChecker;->access$900(Landroid/content/Context;Landroid/net/Uri;)V

    return-void
.end method

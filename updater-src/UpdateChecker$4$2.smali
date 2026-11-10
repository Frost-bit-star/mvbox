.class Lcom/community/oneroom/updater/UpdateChecker$4$2;
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


# direct methods
.method constructor <init>(Lcom/community/oneroom/updater/UpdateChecker$4;)V
    .locals 0

    iput-object v1, v0, Lcom/community/oneroom/updater/UpdateChecker$4$2;->this$0:Lcom/community/oneroom/updater/UpdateChecker$4;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, v3, Lcom/community/oneroom/updater/UpdateChecker$4$2;->this$0:Lcom/community/oneroom/updater/UpdateChecker$4;

    iget-object v0, v0, Lcom/community/oneroom/updater/UpdateChecker$4;->val$ctx:Landroid/content/Context;

    const-string v1, "Update download failed"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

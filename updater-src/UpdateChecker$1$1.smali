.class Lcom/community/oneroom/updater/UpdateChecker$1$1;
.super Ljava/lang/Object;
.source "UpdateChecker.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/community/oneroom/updater/UpdateChecker$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/community/oneroom/updater/UpdateChecker$1;

.field final synthetic val$payload:Lorg/json/JSONObject;

.field final synthetic val$remote:J


# direct methods
.method constructor <init>(Lcom/community/oneroom/updater/UpdateChecker$1;Lorg/json/JSONObject;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object v1, v0, Lcom/community/oneroom/updater/UpdateChecker$1$1;->this$0:Lcom/community/oneroom/updater/UpdateChecker$1;

    iput-object v2, v0, Lcom/community/oneroom/updater/UpdateChecker$1$1;->val$payload:Lorg/json/JSONObject;

    iput-wide v3, v0, Lcom/community/oneroom/updater/UpdateChecker$1$1;->val$remote:J

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, v4, Lcom/community/oneroom/updater/UpdateChecker$1$1;->this$0:Lcom/community/oneroom/updater/UpdateChecker$1;

    iget-object v0, v0, Lcom/community/oneroom/updater/UpdateChecker$1;->val$activity:Landroid/app/Activity;

    iget-object v1, v4, Lcom/community/oneroom/updater/UpdateChecker$1$1;->val$payload:Lorg/json/JSONObject;

    iget-wide v2, v4, Lcom/community/oneroom/updater/UpdateChecker$1$1;->val$remote:J

    invoke-static {v0, v1, v2, v3}, Lcom/community/oneroom/updater/UpdateChecker;->access$400(Landroid/app/Activity;Lorg/json/JSONObject;J)V

    return-void
.end method

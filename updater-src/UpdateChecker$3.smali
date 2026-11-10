.class Lcom/community/oneroom/updater/UpdateChecker$3;
.super Ljava/lang/Object;
.source "UpdateChecker.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/community/oneroom/updater/UpdateChecker;->showDialog(Landroid/app/Activity;Lorg/json/JSONObject;J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$remote:J


# direct methods
.method constructor <init>(J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-wide v1, v0, Lcom/community/oneroom/updater/UpdateChecker$3;->val$remote:J

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    iget-wide v1, v0, Lcom/community/oneroom/updater/UpdateChecker$3;->val$remote:J

    invoke-static {v1, v2}, Lcom/community/oneroom/updater/UpdateChecker;->access$302(J)J

    return-void
.end method

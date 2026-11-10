.class Lcom/community/oneroom/updater/UpdateChecker$2;
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
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$apkUrl:Ljava/lang/String;

.field final synthetic val$remote:J


# direct methods
.method constructor <init>(Landroid/app/Activity;Ljava/lang/String;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object v1, v0, Lcom/community/oneroom/updater/UpdateChecker$2;->val$activity:Landroid/app/Activity;

    iput-object v2, v0, Lcom/community/oneroom/updater/UpdateChecker$2;->val$apkUrl:Ljava/lang/String;

    iput-wide v3, v0, Lcom/community/oneroom/updater/UpdateChecker$2;->val$remote:J

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    iget-object v3, v2, Lcom/community/oneroom/updater/UpdateChecker$2;->val$activity:Landroid/app/Activity;

    iget-object v4, v2, Lcom/community/oneroom/updater/UpdateChecker$2;->val$apkUrl:Ljava/lang/String;

    iget-wide v0, v2, Lcom/community/oneroom/updater/UpdateChecker$2;->val$remote:J

    invoke-static {v3, v4, v0, v1}, Lcom/community/oneroom/updater/UpdateChecker;->access$600(Landroid/app/Activity;Ljava/lang/String;J)V

    return-void
.end method

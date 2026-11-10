.class public Lcom/community/oneroom/updater/UpdateInitProvider;
.super Landroid/content/ContentProvider;
.source "UpdateInitProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/community/oneroom/updater/UpdateInitProvider$Tracker;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "MvboxUpdater"

.field private static checked:Z

.field private static volatile current:Landroid/app/Activity;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-boolean v0, Lcom/community/oneroom/updater/UpdateInitProvider;->checked:Z

    const/4 v0, 0x0

    sput-object v0, Lcom/community/oneroom/updater/UpdateInitProvider;->current:Landroid/app/Activity;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {v0}, Landroid/content/ContentProvider;-><init>()V

    return-void
.end method

.method static synthetic access$000()Landroid/app/Activity;
    .locals 1

    sget-object v0, Lcom/community/oneroom/updater/UpdateInitProvider;->current:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$002(Landroid/app/Activity;)Landroid/app/Activity;
    .locals 0

    sput-object v0, Lcom/community/oneroom/updater/UpdateInitProvider;->current:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$100()Z
    .locals 1

    sget-boolean v0, Lcom/community/oneroom/updater/UpdateInitProvider;->checked:Z

    return v0
.end method

.method static synthetic access$102(Z)Z
    .locals 0

    sput-boolean v0, Lcom/community/oneroom/updater/UpdateInitProvider;->checked:Z

    return v0
.end method


# virtual methods
.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 0

    const/4 v1, 0x0

    return v1
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 0

    const/4 v1, 0x0

    return-object v1
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 0

    const/4 v1, 0x0

    return-object v1
.end method

.method public onCreate()Z
    .locals 5

    const-string v0, "MvboxUpdater"

    :try_start_2
    invoke-virtual {v5}, Lcom/community/oneroom/updater/UpdateInitProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    if-nez v1, :cond_b

    move-object v3, v2

    goto :goto_f

    :cond_b
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    :goto_f
    nop

    instance-of v4, v3, Landroid/app/Application;

    if-eqz v4, :cond_18

    move-object v2, v3

    check-cast v2, Landroid/app/Application;

    goto :goto_1f

    :cond_18
    instance-of v3, v1, Landroid/app/Application;

    if-eqz v3, :cond_1f

    move-object v2, v1

    check-cast v2, Landroid/app/Application;

    :cond_1f
    :goto_1f
    if-eqz v2, :cond_2f

    new-instance v1, Lcom/community/oneroom/updater/UpdateInitProvider$Tracker;

    invoke-direct {v1}, Lcom/community/oneroom/updater/UpdateInitProvider$Tracker;-><init>()V

    invoke-virtual {v2, v1}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    const-string v1, "provider onCreate, callbacks registered"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_34

    :cond_2f
    const-string v1, "provider onCreate, no Application context"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_34
    .catchall {:try_start_2 .. :try_end_34} :catchall_35

    :goto_34
    goto :goto_3b

    :catchall_35
    move-exception v1

    const-string v2, "provider onCreate failed"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_3b
    const/4 v0, 0x1

    return v0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 0

    const/4 v1, 0x0

    return-object v1
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 0

    const/4 v1, 0x0

    return v1
.end method

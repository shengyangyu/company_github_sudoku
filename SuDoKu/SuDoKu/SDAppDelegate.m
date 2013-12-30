//
//  SDAppDelegate.m
//  SuDoKu
//
//  Created by ysy on 13-12-2.
//  Copyright (c) 2013年 com.ysy.www. All rights reserved.
//

#import "SDAppDelegate.h"
#import "SDViewController.h"
#import "BPush.h"

@implementation SDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    SDViewController *vc = [[[SDViewController alloc] initWithNibName:@"SDViewController" bundle:nil] autorelease];
    self.window.rootViewController = vc;
//    [self.window makeKeyAndVisible];
    /**
     *  广告
     */
    mobiSageAdSplash = [[MobiSageAdSplash alloc] initWithOrientation:MobiSage_Orientation_Portrait background:[UIColor whiteColor]withDelegate:self];
    [mobiSageAdSplash startSplash];
    /**
     *  通知
     */
    [BPush setupChannel:launchOptions];
    [BPush setDelegate:self];
    [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound];
    [application setApplicationIconBadgeNumber:0];

    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInteger:0] forKey:@"openInt6model"];
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInteger:0] forKey:@"openInt9model"];
    //只需要注册一次 在注册的代理里面写好
    [[NSUserDefaults standardUserDefaults] setObject:@"empty" forKey:@"bindChannel"];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    //为了延长程序进入后台 文件操作时间
    [self beginBackgroundTask];
    // 在这里加上你需要长久运行的代码
    NSLog(@"applicationDidEnterBackground");
    
    [self endBackgroundTask];
    
}
//开始
- (void)beginBackgroundTask
{
    self.backgroundUpdateTask = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        [self endBackgroundTask];
    }];
}
//结束
- (void)endBackgroundTask
{
    [[UIApplication sharedApplication] endBackgroundTask:self.backgroundUpdateTask];
    self.backgroundUpdateTask = UIBackgroundTaskInvalid;
}


- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
/**
 *  广告
 */

/**
 *  开屏广告展示成功
 *  @param adSplash
 */
- (void)mobiSageAdSplashSuccessToShow:(MobiSageAdSplash*)adSplash
{
    //NSLog(@"开屏广告展示成功");
}

/**
 *  开屏广告展示失败
 *  @param adSplash
 */
- (void)mobiSageAdSplashFaildToRequest:(MobiSageAdSplash*)adSplash
{
    //NSLog(@"开屏广告展示失败");
    [mobiSageAdSplash release];
    [self.window makeKeyAndVisible];
}

/**
 *  开屏广告被关闭
 *  @param adSplash
 */
- (void)mobiSageAdSplashClose:(MobiSageAdSplash*)adSplash
{
    
    //NSLog(@"开屏广告关闭");
    [mobiSageAdSplash release];
    [self.window makeKeyAndVisible];
}

/**
 *  通知
 */
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    //不需要解析出来 我这个就是在用户没有玩的时候显示
    //NSLog(@"didReceiveRemoteNotification:");
    /*
    NSString *alert = [[userInfo objectForKey:@"aps"] objectForKey:@"alert"];
    if (application.applicationState == UIApplicationStateActive)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"指尖数独通知"message:[NSString stringWithFormat:@"%@", alert]delegate:self cancelButtonTitle:@"知道了"otherButtonTitles:nil];
        [alertView show];
    }

    [BPush handleNotification:userInfo];
     */
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    //NSLog(@"didReceiveLocalNotification:");
}

/**
 *   绑定 解除绑定 等等代理
 *
 *  @param method 方法名
 *  @param data   返回参数
 */
- (void) onMethod:(NSString*)method response:(NSDictionary*)data
{
    //只需要注册一次 在注册的代理里面写好
    [[NSUserDefaults standardUserDefaults] setObject:@"first" forKey:@"bindChannel"];
}
//请求通知后调用
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
     NSLog(@"didRegisterForRemoteNotificationsWithDeviceToken:");
    [BPush registerDeviceToken: deviceToken];
}
@end

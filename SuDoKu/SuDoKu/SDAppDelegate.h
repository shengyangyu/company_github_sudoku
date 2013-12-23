//
//  SDAppDelegate.h
//  SuDoKu
//
//  Created by ysy on 13-12-2.
//  Copyright (c) 2013年 com.ysy.www. All rights reserved.
//  web change 2013-12-23 15:24

/**
 *  change code
 *
 *  @param strong    company mac
 *  @param nonatomic shengyang yu
 *
 HEAD
 *  @return yes 22
=======
 *  @return yes 2 shengyangyu2
 ce1f1c1d4e83486fd21e126130d1558bc9c5abc4
 */
#import <UIKit/UIKit.h>
#import "MobiSageSDK.h"

@interface SDAppDelegate : UIResponder <UIApplicationDelegate,MobiSageAdSplashDelegate>
{
    MobiSageAdSplash * mobiSageAdSplash;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, assign) UIBackgroundTaskIdentifier backgroundUpdateTask;

@end

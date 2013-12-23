//
//  SDAppDelegate.h
//  SuDoKu
//
//  Created by ysy on 13-12-2.
//  Copyright (c) 2013年 com.ysy.www. All rights reserved.
//

/**
 *  change code
 *
 *  @param strong    company mac
 *  @param nonatomic shengyang yu
 *
 *  @return yes 2 shengyangyu2
 */
#import <UIKit/UIKit.h>

@interface SDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, assign) UIBackgroundTaskIdentifier backgroundUpdateTask;

@end

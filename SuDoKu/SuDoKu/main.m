//
//  main.m
//  SuDoKu
//
//  Created by ysy on 13-12-2.
//  Copyright (c) 2013年 com.ysy.www. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SDAppDelegate.h"
#import "MobiSageSDK.h"

#define MobiSage_PublisherId_Test @"566786fdeb8e46c6bf3d45a30cf3708a"


int main(int argc, char * argv[])
{
    @autoreleasepool {
        
        [[MobiSageManager getInstance] setPublisherID:MobiSage_PublisherId_Test];
        [[MobiSageManager getInstance] setDeployChannel:@"yj"];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([SDAppDelegate class]));
    }
}

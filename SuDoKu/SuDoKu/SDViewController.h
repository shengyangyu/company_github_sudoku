//
//  SDViewController.h
//  SuDoKu
//
//  Created by ysy on 13-12-2.
//  Copyright (c) 2013年 com.ysy.www. All rights reserved.
// shengyangyu2
// shengyangyu

#import <UIKit/UIKit.h>
#import "MobiSageSDK.h"

@interface SDViewController: UIViewController<MobiSageAdBannerDelegate,MobiSageRecommendDelegate>
{
    MobiSageAdBanner * adBanner;
    MobiSageAdBanner * bottomAdBanner;
    MobiSageRecommendView *recomendView;
}
@property (retain, nonatomic) IBOutlet UIImageView *topImageView;

@property (retain, nonatomic) IBOutlet UIImageView *bottomImageView;

@property (retain, nonatomic) IBOutlet UIButton *button6;

@property (retain, nonatomic) IBOutlet UIButton *button9;

@property (retain, nonatomic) IBOutlet UIButton *buttonMore;

@property (retain, nonatomic) IBOutlet UIButton *buttonLast;

@property (retain, nonatomic) IBOutlet UIView *mainView;

@end

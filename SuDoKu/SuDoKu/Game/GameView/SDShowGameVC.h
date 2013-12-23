//
//  SDChallengeVC.h
//  SuDoKu
//
//  Created by ysy on 13-12-4.
//  Copyright (c) 2013年 com.ysy.www. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MobiSageSDK.h"

@interface SDShowGameVC : UIViewController<MobiSageAdBannerDelegate>
{
    MobiSageAdBanner * adBanner;
    MobiSageAdBanner * bottomAdBanner;
}

@property (retain, nonatomic) IBOutlet UIView *contentView;
@property (retain, nonatomic) IBOutlet UIButton *comebackBtn;
@property (retain, nonatomic) IBOutlet UIButton *lastBtn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withGameModel:(NSInteger)gameModel withGameIndex:(NSInteger)gameIndex;

@end

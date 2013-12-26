//
//  SDViewController.m
//  SuDoKu
//
//  Created by ysy on 13-12-2.
//  Copyright (c) 2013年 com.ysy.www. All rights reserved.
//

#import "SDViewController.h"
#import "SDChoiceGameVC.h"
#import "SDShowGameVC.h"
#import "UIButton+Bootstrap.h"
#import "SDCommonMethod.h"
#import "BPush.h"
#import "SDAlertView.h"

@interface SDViewController ()<SDChoiceGameVCDelegate>

@property (nonatomic,retain)SDChoiceGameVC *choiceVC;

@end

@implementation SDViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self buttonCustomerMethod];
    
    adBanner = [[MobiSageAdBanner alloc] initWithAdSize:Ad_320X50 withDelegate:self];
    adBanner.frame = CGRectMake(0, 0, 320, 50);
    //设置广告轮播动画效果
    [adBanner setSwitchAnimeType:Random];
    [self.view addSubview:adBanner];
    [adBanner release];
    
    bottomAdBanner = [[MobiSageAdBanner alloc] initWithAdSize:Ad_320X50 withDelegate:self];
    bottomAdBanner.frame = CGRectMake(0, MAINSCREEN_HEIGHT - 50 - STATUS_HEIGHT, 320, 50);
    //设置广告轮播动画效果
    [bottomAdBanner setSwitchAnimeType:Random];
    [self.view addSubview:bottomAdBanner];
    [bottomAdBanner release];
    //通知绑定
    [BPush bindChannel];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];

}

- (void)setChoiceVCLabelString:(NSString *)tltle
{
    if (!_choiceVC)
    {
        self.choiceVC = [[[SDChoiceGameVC alloc] initWithNibName:@"SDChoiceGameVC" bundle:nil] autorelease];
        self.choiceVC.currentModel = GAME_MODE_6;
        self.choiceVC.titleLabel.text = tltle;
        self.choiceVC.choiceDelegate = self;
        [self addChildViewController:self.choiceVC];
    }
    self.choiceVC.titleLabel.text = tltle;
}
#pragma mark -按钮外形
- (void)buttonCustomerMethod
{
    [self.button6 buttonOrangeStyle];
    [self.button9 buttonBlueStyle];
    [self.buttonMore buttonGreenStyle];
    [self.buttonLast buttonPurpleStyle];
}

#pragma mark -按钮 事件
- (IBAction)classicMethod:(UIButton *)sender
{
    self.choiceVC.currentModel = GAME_MODE_6;
    [self setChoiceVCLabelString:@"6 阶"];
    [SDCommonMethod panIn:self.choiceVC.view withpParentView:self.view];
}

- (IBAction)challengeMethod:(UIButton *)sender
{
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"openInt9model"] integerValue] >= 0)
    {
        self.choiceVC.currentModel = GAME_MODE_9;
        [self setChoiceVCLabelString:@"9 阶"];
        [SDCommonMethod panIn:self.choiceVC.view withpParentView:self.view];
    }else{
        SDAlertView *alert = [[SDAlertView alloc] initWithTitle:@"不要急，慢慢来!" withContent:@"先完成前面的!" withLeftButtonTitle:nil withRightButtonTitle:@"知道了"];
        [alert showView];
    }
}

- (IBAction)fightMethod:(UIButton *)sender
{

}

#pragma mark -SDChoiceGameVCDelegate
- (void)dismissViewMethod
{
    [SDCommonMethod panOut:self.choiceVC.view withpParentView:self.view];
}

#pragma mark - MobiSageAdViewDelegate 委托
#pragma mark
- (UIViewController *)viewControllerToPresent
{
    return self;
}
/**
 *  横幅广告被点击
 *  @param adBanner
 */
- (void)mobiSageAdBannerClick:(MobiSageAdBanner*)adBanner
{
//    NSLog(@"横幅广告被点击");
}

/**
 *  adBanner请求成功并展示广告
 *  @param adBanner
 */
- (void)mobiSageAdBannerSuccessToShowAd:(MobiSageAdBanner*)adBanner
{
//    NSLog(@"横幅广告请求成功并展示广告");
}
/**
 *  adBanner请求失败
 *  @param adBanner
 */
- (void)mobiSageAdBannerFaildToShowAd:(MobiSageAdBanner*)adBanner
{
//    NSLog(@"横幅广告请求失败");
}
/**
 *  adBanner被点击后弹出LandingSit
 *  @param adBanner
 */
- (void)mobiSageAdBannerPopADWindow:(MobiSageAdBanner*)adBanner
{
//    NSLog(@"被点击后弹出LandingSit");
}
/**
 *  adBanner弹出的LandingSit被关闭
 *  @param adBanner
 */
- (void)mobiSageAdBannerHideADWindow:(MobiSageAdBanner*)adBanner
{
//    NSLog(@"弹出的LandingSit被关闭");
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_button9 release];
    [_button6 release];
    [_buttonMore release];
    [_buttonLast release];
    [_mainView release];
    [super dealloc];
}
@end

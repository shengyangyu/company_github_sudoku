//
//  SDMoreVC.m
//  SuDoKu
//
//  Created by ysy on 13-12-27.
//  Copyright (c) 2013年 com.ysy.www. All rights reserved.
//

#import "SDMoreVC.h"

@interface SDMoreVC ()

@end

@implementation SDMoreVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.recomendView3 = [[MobiSageRecommendView alloc] initWithDelegate:self];
    [self.view addSubview:self.recomendView3];
//    [self.recomendView3 OpenAdSageRecmdModalView];
    [self.recomendView3 performSelector:@selector(OpenAdSageRecmdModalView) withObject:self afterDelay:0.5];
}
#pragma mark - MobiSageRecommendDelegate 委托函数
#pragma mark

- (UIViewController *)viewControllerForPresentingModalView {
    
    return self;
}
/**
 *  应用推荐界面打开时调用
 */

- (void)MobiSageWillOpenRecommendModalView
{
//    NSLog(@"应用推荐界面打开");
}
/**
 *  应用推荐界面打开失败时调用
 */
- (void)MobiSageFailToOpenRecommendModalView
{
//    NSLog(@"应用推荐打开失败");
}
/**
 *  应用推荐界面关闭时调用
 */
- (void)MobiSageDidCloseRecommendModalView
{
//    NSLog(@"应用推荐关闭");
}

//弹出荐计划广告的按钮触摸事件响应函数
- (void)openRecommendView {
    
    [self.recomendView3 OpenAdSageRecmdModalView];
    
}
#pragma mark -返回
- (IBAction)comebackMethod:(UISwipeGestureRecognizer *)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

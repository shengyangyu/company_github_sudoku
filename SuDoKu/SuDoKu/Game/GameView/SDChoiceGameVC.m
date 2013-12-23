//
//  SDCassicsVC.m
//  SuDoKu
//
//  Created by shengyang_yu on 13-12-5.
//  Copyright (c) 2013年 com.ysy.www. All rights reserved.
//

#import "SDChoiceGameVC.h"
#import "SDCommonMethod.h"
#import "UIButton+Bootstrap.h"
#import "SDShowGameVC.h"

@interface SDChoiceGameVC ()



@end

@implementation SDChoiceGameVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}
#pragma mark - 界面按钮方法
- (IBAction)stopGameMethod:(UIButton *)sender
{
    if ([self.choiceDelegate respondsToSelector:@selector(dismissViewMethod)]) {
        
        [self.choiceDelegate dismissViewMethod];
    }
    /*
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
     */
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self changeViewButtonSytle];
    float originy=([[UIDevice currentDevice].systemVersion floatValue]>=7.0)?0:20;
    self.buttomImage.frame = CGRectMake(self.buttomImage.frame.origin.x, MAINSCREEN_HEIGHT - 50 - originy, self.buttomImage.frame.size.width, self.buttomImage.frame.size.height);

}
- (void)changeViewButtonSytle
{
    for (int i = 0 ; i < [self.numberBtnArray count] ; i ++)
    {
        UIButton *button = (UIButton *)[self.numberBtnArray objectAtIndex:i];
        UIColor *color = ((i / 9 == 0)?Purple_Color:((i / 9 == 1)?Orange_Color:((i / 9 == 2)?Blue_Color:Green_Color)));
        [button setCircleButton:color];
        button.tag = BUTTON_TAG_BASE + i;
        [button addTarget:self action:@selector(buttonMethod:) forControlEvents:UIControlEventTouchUpInside];
    }
}

#pragma mark - 按钮方法
- (void)buttonMethod:(UIButton *)sender
{
    SDShowGameVC *vc = [[[SDShowGameVC alloc] initWithNibName:@"SDShowGameVC" bundle:nil withGameModel:self.currentModel withGameIndex:sender.tag - BUTTON_TAG_BASE] autorelease];
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}

- (void)setTitleLabelText:(NSString *)title
{
    self.titleLabel.text = title;
    [self.view drawRect:self.view.frame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_numberBtnArray release];
    [_mainView release];
    [_titleLabel release];
    [_buttomImage release];
    [super dealloc];
}
@end

//
//  LoginViewController.m
//  ERP
//
//  Created by minya on 2017/5/5.
//  Copyright © 2017年 minya. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidBeginEditing:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidEndEditing:) name:UIKeyboardWillHideNotification object:nil];

}

#pragma mark - 屏幕上弹
-( void )textFieldDidBeginEditing:(UITextField *)textField
{
    //键盘高度216

    //滑动效果（动画）
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@ "ResizeForKeyboard"  context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    //将视图的Y坐标向上移动，以使下面腾出地方用于软键盘的显示
    self.view.frame = CGRectMake(0.0f, -100.0f, self.view.frame.size.width, self.view.frame.size.height); //64-216
    
    [UIView commitAnimations];
}

#pragma mark -屏幕恢复
-( void )textFieldDidEndEditing:(UITextField *)textField
{
    //滑动效果
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@ "ResizeForKeyboard"  context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    //恢复屏幕
    self.view.frame = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height); //64-216
    
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

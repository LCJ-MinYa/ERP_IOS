//
//  LoginViewController.m
//  ERP
//
//  Created by minya on 2017/5/5.
//  Copyright © 2017年 minya. All rights reserved.
//

#import "LoginViewController.h"
#import "FeHourGlass.h"
#import "FeHourGlassViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _userInput.delegate = self;
    _pwdInput.delegate = self;
    [self setReyurnText:_userInput];
    [self setReyurnText:_pwdInput];
    [_pwdInput setSecureTextEntry:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    textField.returnKeyType = UIReturnKeyDone;
    [textField resignFirstResponder];
    return YES;
}

- (void)setReyurnText:(UITextField *)textField
{
    textField.returnKeyType = UIReturnKeyDone;
}

- (IBAction)loginBtnClick
{
    if([_userInput.text isEqualToString:@""] || [_userInput.text length]==0){
        NSString * userMsg = @"请输入登录账号";
        [self alertMsg:userMsg];
    }else if([_pwdInput.text isEqualToString:@""] || [_pwdInput.text length]==0){
        NSString * pwdMsg = @"请输入登录密码";
        [self alertMsg:pwdMsg];
    }else{
        NSLog(@"网络请求");
        
    }
}

//封装弹出消息框
- (void)alertMsg:(NSString *)msg
{
    UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:nil message:msg preferredStyle:UIAlertControllerStyleAlert];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"%@", msg);
    }]];
    [self presentViewController:alertVC animated:YES completion:nil];
}
@end

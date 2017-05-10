//
//  LoginViewController.m
//  ERP
//
//  Created by minya on 2017/5/5.
//  Copyright © 2017年 minya. All rights reserved.
//

#import "LoginViewController.h"
#import <MBProgressHUD.h>
#import "AFHTTPClient.h"
#import "APIConfig.h"

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
        MBProgressHUD * loading = [self showReqLoading];
        [AFHTTPClient PostService:GLOBAL_INFO params:nil success:^(id data) {
            [self hideReqLoading:loading];
            NSLog(@"%@", data);
        } fail:^{
            NSLog(@"请求错误");
        }];
    }
}

//封装显示网络请求等待
- (MBProgressHUD *)showReqLoading
{
    MBProgressHUD * loading = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    loading.mode = MBProgressHUDModeIndeterminate;
    loading.label.text = @"登录中...";
    loading.contentColor = [UIColor whiteColor];
    loading.bezelView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    return loading;
}

//封装关闭网络请求等待
- (void)hideReqLoading:(MBProgressHUD *)loadingClass
{
    [loadingClass hideAnimated:YES afterDelay:0];
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

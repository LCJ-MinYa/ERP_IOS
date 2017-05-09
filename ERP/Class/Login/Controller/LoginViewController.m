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

@end

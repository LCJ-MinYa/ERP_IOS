//
//  AppDelegate.m
//  ERP
//
//  Created by minya on 2017/5/5.
//  Copyright © 2017年 minya. All rights reserved.
//

#import "AppDelegate.h"
#import <IQKeyboardManager.h>
#import "LoginViewController.h"
#import "AFHTTPClient.h"
#import "APIConfig.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //程序启动入口
    
    //1.创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //2.判断用户是否登录（未登录显示登录界面，已登录显示主界面）
    //[[NSUserDefaults standardUserDefaults] setValue:@"pmp4yroMkmi1xbF258whfrLrQscUsersNw54jfGQ" forKey:@"token"];
    NSString * str = [[NSUserDefaults standardUserDefaults] valueForKey:@"token"];
    NSLog(@"%@", str);
    self.window.rootViewController = [AppDelegate showRootViewController:@"Login"];
    
    //3.显示窗口
    [self.window makeKeyAndVisible];
    
    // 设置键盘监听管理
    [self setKeyBoardManager];
    
    return YES;
}

//设置判断用户是否登录返回根视图
+ (UIViewController *)showRootViewController:(NSString *)view
{
    if([view isEqualToString:@"Login"]){
        UIStoryboard * LoginSB = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
        LoginViewController * LoginView = [LoginSB instantiateViewControllerWithIdentifier:@"Login"];
        return LoginView;
    }else{
        return nil;
    }
    return nil;
}

//设置键盘监听管理
- (void)setKeyBoardManager
{
    IQKeyboardManager *keyboardManager = [IQKeyboardManager sharedManager];
    keyboardManager.enable = YES;                       //设置是否开启键盘不遮挡输入框
    keyboardManager.enableAutoToolbar = NO;             //设置不显示自定义完成的顶部条
    keyboardManager.shouldResignOnTouchOutside = YES;   //设置点击其他区域关闭键盘
}



- (void)applicationWillResignActive:(UIApplication *)application {
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
}


- (void)applicationWillTerminate:(UIApplication *)application {
}

@end

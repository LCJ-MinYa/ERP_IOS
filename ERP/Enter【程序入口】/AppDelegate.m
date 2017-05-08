//
//  AppDelegate.m
//  ERP
//
//  Created by minya on 2017/5/5.
//  Copyright © 2017年 minya. All rights reserved.
//

#import "AppDelegate.h"
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
//    NSDictionary * params = @{@"profileId":@"10001", @"timestamp":@"1494210851", @"token":@"pmp4yroMkmi1xbF258whfrLrQscUsersNw54jfGQ", @"signstr":@"36d9b21bcd89b42ecd73f67e0a434dc7b9f5c135"};
//    [AFHTTPClient PostService:GLOBAL_INFO params:params success:^(id data) {
//        NSLog(@"%@", data);
//    } fail:^{
//        NSLog(@"请求错误");
//    }];
    [[NSUserDefaults standardUserDefaults] setValue:@"pmp4yroMkmi1xbF258whfrLrQscUsersNw54jfGQ" forKey:@"token"];
    NSString * str = [[NSUserDefaults standardUserDefaults] valueForKey:@"token"];
    NSLog(@"%@", str);
    self.window.rootViewController = [AppDelegate showRootViewController:@"Login"];
    
    //3.显示窗口
    [self.window makeKeyAndVisible];
    
    return YES;
}

+(UIViewController *)showRootViewController:(NSString *)view
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

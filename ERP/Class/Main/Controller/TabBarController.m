//
//  TabBarController.m
//  ERP
//
//  Created by minya on 2017/5/11.
//  Copyright © 2017年 minya. All rights reserved.
//

#import "TabBarController.h"
#import "NavigationController.h"
#import "ProductViewController.h"
#import "CartViewController.h"
#import "OrderViewController.h"
#import "MsgViewController.h"
#import "MineViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatAllNav];
}

//创建所有子控制器
- (void)creatAllNav
{
    /*
     自定义tabbar的背景颜色[新建view放在tabbar中实现]
     UIView * bgView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
     bgView.backgroundColor = [UIColor yellowColor];
     [self.tabBar insertSubview:bgView atIndex:0];
     self.tabBar.opaque = NO;
     */
    
    //添加第一个导航子控制器[商品]
    UIStoryboard * ProductSB = [UIStoryboard storyboardWithName:@"Product" bundle:nil];
    ProductViewController * product = [ProductSB instantiateViewControllerWithIdentifier:@"Product"];
    [self creatNav:product image:[UIImage imageNamed:@"product"] selectImage:[UIImage imageNamed:@"select_product"] title:@"商品"];
    product.navigationController.navigationBar.hidden = YES;
    
    //添加第二个导航子控制器[购物车]
    CartViewController * cart = [[CartViewController alloc] init];
    [self creatNav:cart image:[UIImage imageNamed:@"cart"] selectImage:[UIImage imageNamed:@"select_cart"] title:@"购物车"];
    
    //添加第三个导航子控制器[订单]
    OrderViewController * order = [[OrderViewController alloc] init];
    [self creatNav:order image:[UIImage imageNamed:@"order"] selectImage:[UIImage imageNamed:@"select_order"] title:@"订单"];
    
    //添加第四个导航子控制器[消息]
    MsgViewController * msg = [[MsgViewController alloc] init];
    [self creatNav:msg image:[UIImage imageNamed:@"msg"] selectImage:[UIImage imageNamed:@"select_msg"] title:@"消息"];
    
    //添加第五个导航子控制器[我的]
    MineViewController * mine = [[MineViewController alloc] init];
    [self creatNav:mine image:[UIImage imageNamed:@"mine"] selectImage:[UIImage imageNamed:@"select_mine"] title:@"我的"];
    
    [UITabBar appearance].barTintColor = [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1];
}

//封装导航控制器的创建
- (void)creatNav:(UIViewController *)viewVc image:(UIImage *)image selectImage:(UIImage *)selectImage title:(NSString *)title{
    
    //设置每个页面的导航控制器标题
    viewVc.navigationItem.title = title;
    viewVc.view.backgroundColor = [UIColor whiteColor];
    
    //创建每个导航控制器
    NavigationController * nav = [[NavigationController alloc] initWithRootViewController:viewVc];
    
    /*
     * nav.navigationBar导航条的相关内容抽取类
     * 放在Main中的LiLiNavigationController中去设置
     * 首先导入#import "LiLiNavigationController.h"
     * 创建导航控制器时使用LiLiNavigationController创建
     */
    
    //tabbar的相关设置
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [nav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1]} forState:UIControlStateNormal];
    [nav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:246/255.0 green:90/255.0 blue:68/255.0 alpha:1]} forState:UIControlStateSelected];
    
    //添加到根视图tabBar中
    [self addChildViewController:nav];
}

@end

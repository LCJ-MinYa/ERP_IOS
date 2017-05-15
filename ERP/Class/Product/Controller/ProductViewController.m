//
//  ProductViewController.m
//  ERP
//
//  Created by minya on 2017/5/11.
//  Copyright © 2017年 minya. All rights reserved.
//

#import "ProductViewController.h"
#import "ProductClassViewController.h"
#import "AFHTTPClient.h"
#import "APIConfig.h"
#import <MBProgressHUD.h>
#import <SDCycleScrollView.h>

@interface ProductViewController ()

@property (weak, nonatomic) IBOutlet UIView *searchView;
@property (weak, nonatomic) IBOutlet UIImageView *leftImg;
@property (weak, nonatomic) IBOutlet UIImageView *rightImg;
@property (weak, nonatomic) IBOutlet UIView *scrollContentView;

@end

@implementation ProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    [self initRequest];
}

//初始化视图和绑定事件
- (void)initView
{
    _searchView.layer.cornerRadius = 2;
    
    //跳转商品分类
    _leftImg.userInteractionEnabled = YES;
    UITapGestureRecognizer * singleLeftTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleLeftTapFunc:)];
    [_leftImg addGestureRecognizer:singleLeftTap];
    
    //跳转扫一扫
    _rightImg.userInteractionEnabled = YES;
    UITapGestureRecognizer * singleRightTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleRightTapFunc:)];
    [_rightImg addGestureRecognizer:singleRightTap];
}

- (void)singleLeftTapFunc:(UITapGestureRecognizer *)gestureRecognizer
{
    /* 如果在push跳转时需要隐藏tabBar，设置self.hidesBottomBarWhenPushed=YES;
     * 并在push后设置self.hidesBottomBarWhenPushed=NO;
     * 这样back回来的时候，tabBar会恢复正常显示。
     */
    self.hidesBottomBarWhenPushed = YES;
    ProductClassViewController * productClass = [[ProductClassViewController alloc] init];
    [self.navigationController pushViewController:productClass animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

- (void)singleRightTapFunc:(UITapGestureRecognizer *)gestureRecognizer
{
    NSLog(@"2222");
}

//判断页面数据是非可以加载
- (void)initRequest
{
    [AFHTTPClient PostService:self reqUrl:GLOBAL_INFO params:nil success:^(id data) {
        [self getPageData];
    } fail:nil loadingText:nil showLoading:NO];
}

//页面数据开始加载
- (void)getPageData
{
    MBProgressHUD * loading = [self showReqLoading];
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, queue, ^{
        [self getBannerNoticeData:semaphore];
    });
    dispatch_group_async(group, queue, ^{
        [self getProductListData:semaphore];
    });
    dispatch_group_notify(group, queue, ^{
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        //通知主线程刷新
        dispatch_async(dispatch_get_main_queue(), ^{
            [self hideReqLoading:loading];
        });
    });
}

//获取商品banner和公告
- (void)getBannerNoticeData:(dispatch_semaphore_t)semaphore
{
    [AFHTTPClient PostService:self reqUrl:BANNER_NOTICE params:nil success:^(id data) {
        dispatch_semaphore_signal(semaphore);
        NSDictionary * response = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSArray * bannerData = response[@"banner"];
        [self dealBannerData:bannerData];
        
    } fail:nil loadingText:nil showLoading:NO];
}

//处理商品banner
- (void)dealBannerData:(NSArray *)bannerData
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    SDCycleScrollView * bannerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, width, width/3) imageNamesGroup:@[@"nav_bg",@"cart",@"mine"]];
    [_scrollContentView addSubview:bannerView];
}

//获取商品列表
- (void)getProductListData:(dispatch_semaphore_t)semaphore
{
    [AFHTTPClient PostService:self reqUrl:PRODUCT_LIST params:nil success:^(id data) {
        dispatch_semaphore_signal(semaphore);
    } fail:nil loadingText:nil showLoading:NO];
}

//封装显示网络请求等待
- (MBProgressHUD *)showReqLoading
{
    MBProgressHUD * loading = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    loading.mode = MBProgressHUDModeIndeterminate;
    loading.label.text = @"正在加载...";
    loading.contentColor = [UIColor whiteColor];
    loading.bezelView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    return loading;
}

//封装关闭网络请求等待
- (void)hideReqLoading:(MBProgressHUD *)loadingClass
{
    [loadingClass hideAnimated:YES afterDelay:0];
}

@end

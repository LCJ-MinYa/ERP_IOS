//
//  ProductViewController.m
//  ERP
//
//  Created by minya on 2017/5/11.
//  Copyright © 2017年 minya. All rights reserved.
//

#import "ProductViewController.h"
#import "ProductClassViewController.h"

@interface ProductViewController ()

@property (weak, nonatomic) IBOutlet UIView *searchView;
@property (weak, nonatomic) IBOutlet UIImageView *leftImg;
@property (weak, nonatomic) IBOutlet UIImageView *rightImg;

@end

@implementation ProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
}

//初始化视图和绑定事件
- (void)initView
{
    _searchView.layer.cornerRadius = 2;
    _leftImg.userInteractionEnabled = YES;
    UITapGestureRecognizer * singleLeftTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleLeftTapFunc:)];
    [_leftImg addGestureRecognizer:singleLeftTap];
    
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

@end

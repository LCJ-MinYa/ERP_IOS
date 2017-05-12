//
//  APIConfig.h
//  ERP
//
//  Created by minya on 2017/5/5.
//  Copyright © 2017年 minya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIConfig : NSObject

//通用接口
extern NSString * const API;

//全局初始化请求
extern NSString * const GLOBAL_INFO;
//登录接口
extern NSString * const LOGIN;

//商品接口
extern NSString * const BANNER_NOTICE;      //商品首页banner和公告信息
extern NSString * const PRODUCT_LIST;      //商品首页banner和公告信息
@end

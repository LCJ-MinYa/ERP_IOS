//
//  APIConfig.h
//  ERP
//
//  Created by minya on 2017/5/5.
//  Copyright © 2017年 minya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIConfig : NSObject


#ifdef DEBUG
//debug状态下的测试api
#define API_BASE_URL @"http://zxdhapi.cmgrasp.com"

#else
//Release状态下的线上API
#define API_BASE_URL @"http://ydhapi.zhangyuxia.com.cn"
#endif

//接口列表
#define GLOBAL_INFO @"/api/system/getGlobalInfo" //全局初始化请求
#define LOGIN @"/api/user/login" //登录接口

//商品相关接口
#define BANNER_NOTICE @"/api/product/getBannerNotice" //商品首页banner和公告信息
#define PRODUCT_LIST @"/api/product/getProductList" //商品列表

@end

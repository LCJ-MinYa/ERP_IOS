//
//  APIConfig.m
//  ERP
//
//  Created by minya on 2017/5/5.
//  Copyright © 2017年 minya. All rights reserved.
//

#import "APIConfig.h"

@implementation APIConfig

NSString * const API = @"http://zxdhapi.cmgrasp.com";  //http://ydhapi.zhangyuxia.com.cn
NSString * const GLOBAL_INFO = @"/api/system/getGlobalInfo";
NSString * const LOGIN = @"/api/user/login";
NSString * const BANNER_NOTICE = @"/api/product/getBannerNotice";
NSString * const PRODUCT_LIST = @"/api/product/getProductList";

@end

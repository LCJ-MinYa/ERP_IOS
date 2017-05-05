//
//  AFHTTPClient.h
//  ERP
//
//  Created by minya on 2017/5/5.
//  Copyright © 2017年 minya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFHTTPClient : NSObject

/*
 * POST请求封装
 * reqUrl:请求地址 string类型
 * params:请求参数 NSDictionary类型
 * returnData:请求成功返回数据
 */
+ (void)PostService:(NSString *)reqUrl params:(NSDictionary *)params success:(void(^)(id data))success fail:(void(^)())fail;

@end

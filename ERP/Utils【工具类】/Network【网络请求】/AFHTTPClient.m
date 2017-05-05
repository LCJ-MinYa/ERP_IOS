//
//  AFHTTPClient.m
//  ERP
//
//  Created by minya on 2017/5/5.
//  Copyright © 2017年 minya. All rights reserved.
//

#import "AFHTTPClient.h"
#import <AFNetworking.h>
#import "APIConfig.h"

@implementation AFHTTPClient
+ (void)PostService:(NSString *)reqUrl params:(NSDictionary *)params success:(void(^)(id data))success fail:(void(^)())fail
{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    /*
     * 需要注意的是,默认提交请求的数据是二进制的,返回格式是JSON
     * 如果提交数据是JSON的,需要将请求格式设置为AFJSONRequestSerializer
     */
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //设置请求超时时间
    manager.requestSerializer.timeoutInterval = 5.0;
    //转换请求链接为UTF8
    NSString * joinUrl = [API stringByAppendingString:reqUrl];
    NSString * url = [joinUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@", url);
    
    //NSData * paramsJSON = [NSJSONSerialization dataWithJSONObject:params options:0 error:NULL];
    
    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(success){
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
        if(fail){
            fail();
        }
    }];
    
}
@end

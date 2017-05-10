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

//获取ProfileId
- (NSString *)getProfileId
{
    NSString * profileId = [[NSUserDefaults standardUserDefaults] valueForKey:@"profileId"];
    if([profileId isEqualToString:@""] || [profileId length]==0){
        return @"";
    }
    return profileId;
}

+ (void)PostService:(NSString *)reqUrl params:(NSDictionary *)params success:(void(^)(id data))success fail:(void(^)())fail
{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    //设置请求超时时间
    manager.requestSerializer.timeoutInterval = 5.0;
    //转换请求链接为UTF8
    NSString * joinUrl = [API stringByAppendingString:reqUrl];
    NSString * url = [joinUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    //封装基本参数
    NSMutableDictionary * newParams = [NSMutableDictionary dictionary];
    if(params != nil){
        [newParams addEntriesFromDictionary:params];
    }
    [newParams setValue:[self getProfileId] forKey:@"profileId"];
    [newParams setValue:@"1494210851" forKey:@"timestamp"];
    [newParams setValue:@"pmp4yroMkmi1xbF258whfrLrQscUsersNw54jfGQ" forKey:@"token"];
    [newParams setValue:@"36d9b21bcd89b42ecd73f67e0a434dc7b9f5c135" forKey:@"signstr"];
    NSLog(@"%@", newParams);
    
    [manager POST:url parameters:newParams progress:^(NSProgress * _Nonnull uploadProgress) {
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

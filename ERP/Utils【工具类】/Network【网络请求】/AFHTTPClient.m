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
#import <CommonCrypto/CommonDigest.h>

@implementation AFHTTPClient

//获取sha1之后的值
+ (NSString *) sha1:(NSString *)input
{
    NSData *data = [input dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (unsigned int)data.length, digest);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for(int i=0; i<CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    return output;
}

//获取ProfileId
+ (NSString *)getProfileId
{
    NSString * profileId = [[NSUserDefaults standardUserDefaults] valueForKey:@"profileId"];
    if([profileId isEqualToString:@""] || [profileId length]==0){
        return @"";
    }
    return profileId;
}

//获取当前时间戳
+ (NSString *)getTimestamp
{
    NSDate * newDate = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval timestamp = [newDate timeIntervalSince1970];
    NSString * timestampString = [NSString stringWithFormat:@"%f", timestamp];
    return timestampString;
}

//获取token
+ (NSString *)getToken
{
    NSString * token = [[NSUserDefaults standardUserDefaults] valueForKey:@"token"];
    if([token isEqualToString:@""] || [token length]==0){
        return @"";
    }
    return token;
}

//获取生成的signstr
+ (NSString *)getSignstr:(NSMutableDictionary *)newParams
{
    NSMutableArray * orgParams = [NSMutableArray array];
    for(NSString * str in newParams){
        [orgParams addObject:str];
    }
    NSArray * newArray = [orgParams sortedArrayUsingSelector:@selector(compare:)];
    
    NSString * parStr = @"";
    for(NSString * key in newArray){
        NSString * value = [newParams objectForKey:key];
        if(![value isEqualToString:@""] && [value length]!=0){
            NSString * str = [NSString stringWithFormat:@"%@%@%@%@%@", parStr, @"&", key, @"=", value];
            parStr = str;
        }
    }
    if(![parStr isEqualToString:@""] && [parStr length]!=0){
        NSString * newParStr = [parStr substringFromIndex:1];
        NSLog(@"%@", newParStr);
        return [self sha1:newParStr];
    }
    return @"";
}

+ (void)PostService:(NSString *)reqUrl params:(NSDictionary *)params success:(void(^)(id data))success fail:(void(^)())fail
{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
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
    [newParams setValue:[self getTimestamp] forKey:@"timestamp"];
    [newParams setValue:[self getToken] forKey:@"token"];
    [newParams setValue:[self getSignstr:newParams] forKey:@"signstr"];
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

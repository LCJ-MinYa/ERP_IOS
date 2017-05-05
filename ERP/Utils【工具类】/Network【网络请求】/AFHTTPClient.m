//
//  AFHTTPClient.m
//  ERP
//
//  Created by minya on 2017/5/5.
//  Copyright © 2017年 minya. All rights reserved.
//

#import "AFHTTPClient.h"
#import <AFNetworking.h>

@implementation AFHTTPClient
+ (void)PostService:(NSString *)reqUrl params:(NSDictionary *)params returnData:(void(^)(id data))returnData{
    NSLog(@"%@", reqUrl);
}
@end

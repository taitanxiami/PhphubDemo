//
//  BaseApi.m
//  PhphubDemo
//
//  Created by taitanxiami on 15/12/23.
//  Copyright © 2015年 taitanxiami. All rights reserved.
//

#import "BaseApi.h"
#import "AccessTokenHandler.h"
@implementation BaseApi
+(instancetype)clientGrantInstance {
    static BaseApi *clientGrantInstance = nil;
    dispatch_once_t token;
    dispatch_once(&token, ^{
       
        clientGrantInstance = [[BaseApi alloc]initWithBaseURL:[NSURL URLWithString:APIBaseURL]];
        [clientGrantInstance prepareForCommonRequest];
        [clientGrantInstance setupClientGtantRequest];
    });
    return clientGrantInstance;
}

#pragma mark - Helper

/**
 *  设置请求头
 */
- (void)prepareForCommonRequest {
    NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));

    NSString *version = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"];
    NSString *buildNumber = [[NSBundle mainBundle] objectForInfoDictionaryKey: (NSString *)kCFBundleVersionKey];
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    [self.requestSerializer setValue:@"application/vnd.PHPHub.v1+json" forHTTPHeaderField:@"Accept"];
    [self.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"X-Client-Platform"];
    [self.requestSerializer setValue:version forHTTPHeaderField:@"X-Client-Version"];
    [self.requestSerializer setValue:buildNumber forHTTPHeaderField:@"X-Client-Build"];
    [self.requestSerializer setValue:@"" forHTTPHeaderField:@"Cookie"];
    self.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    
    self.handler = [[APIRequestHandler alloc] init];
    [self.handler registerNotifications];
}

- (void)setupClientGtantRequest {
    NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));

    [self.requestSerializer setValue:[AccessTokenHandler getClientGrantAccessTokenFromLocal]
                  forHTTPHeaderField:@"Authorization"];
    self.handler.grantType = @"client_credentials";
}
@end

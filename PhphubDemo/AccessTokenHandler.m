//
//  AccessTokenHandler.m
//  PhphubDemo
//
//  Created by taitanxiami on 15/12/22.
//  Copyright © 2015年 taitanxiami. All rights reserved.
//

#import "AccessTokenHandler.h"
#import <GVUserDefaults.h>
#import "GVUserDefaults+Properties.h"
@implementation AccessTokenHandler


+ (void)storeClientGrantAccessToken:(NSString *)token {
    
    NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    [GVUserDefaults standardUserDefaults].userClientToken = token;
    
}

+(NSString *)getClientGrantAccessTokenFromLocal {
    NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));

    NSString *token = [GVUserDefaults standardUserDefaults].userClientToken;
    return [NSString stringWithFormat:@"bearer %@",token];
    
}
+ (void)fetchClinetGrantToken {
    NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));

    NSURL *url = [NSURL URLWithString:APIBaseURL];
    
    AFOAuth2Manager *oauthClient = [[AFOAuth2Manager alloc]initWithBaseURL:url clientID:Client_id secret:Clinet_secret];
    [oauthClient authenticateUsingOAuthWithURLString:APIAccessTokenURL
                                               scope:@""
                                             success:^(AFOAuthCredential *credential) {
                                                 NSLog(@"oauthToken-----> I have a client token = %@",credential.accessToken);
                                                 [AccessTokenHandler storeClientGrantAccessToken:credential.accessToken];
                                             }
                                             failure:^(NSError *error) {
                                                 
                                                 NSLog(@"oauthClient Error = %@",error);
                                             }];
}


+ (void)fetchClinetGrantTokenWithRetrytimes:(NSInteger)times callback:(BaseRequestBlock)block {
    NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));

    NSURL *url = [NSURL URLWithString:APIBaseURL];
    AFOAuth2Manager *oauthClient = [[AFOAuth2Manager alloc]initWithBaseURL:url clientID:Client_id secret:Clinet_secret];
    
    [oauthClient authenticateUsingOAuthWithURLString:APIAccessTokenURL
                                               scope:@""
                                             success:^(AFOAuthCredential *credential) {
                                                 NSLog(@"You get a token now token = %@",credential.accessToken);
                                                 //存储touken
                                                 [AccessTokenHandler storeClientGrantAccessToken:credential.accessToken];
                                                 if (block) {
                                                     block(@{@"access_token":credential.accessToken},nil);
                                                 }
                                               } failure:^(NSError *error) {
                                                   //如果失败，递归处理（最多请求3次）
                                                   if (times > 0) {
                                                       NSInteger newTimes = times - 1;
                                                       [self fetchClinetGrantTokenWithRetrytimes:newTimes callback:block];
                                                   }else {
                                                       //返回error信息
                                                       if (block)  block(nil,error);
                                                   }
                                                   
                                               }];
}

@end

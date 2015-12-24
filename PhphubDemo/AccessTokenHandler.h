//
//  AccessTokenHandler.h
//  PhphubDemo
//
//  Created by taitanxiami on 15/12/22.
//  Copyright © 2015年 taitanxiami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFOAuth2Manager.h>
#import "BaseApi.h"

@interface AccessTokenHandler : NSObject

/**
 *  请求token
 */
+ (void)fetchClinetGrantToken;

/**
 *  存储token
 */
+ (void)storeClientGrantAccessToken:(NSString *)token;

+ (NSString *)getClientGrantAccessTokenFromLocal;

+ (void)fetchClinetGrantTokenWithRetrytimes:(NSInteger)times callback:(BaseRequestBlock)black;

@end

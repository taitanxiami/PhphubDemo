//
//  CurrentUser.m
//  PhphubDemo
//
//  Created by taitanxiami on 15/12/23.
//  Copyright © 2015年 taitanxiami. All rights reserved.
//

#import "CurrentUser.h"
#import "AccessTokenHandler.h"

@implementation CurrentUser


+ (CurrentUser *)instance {
    
    static CurrentUser *user;
  static  dispatch_once_t token;
    dispatch_once(&token, ^{
        user = [[CurrentUser alloc]init];
    });
    return user;
    
}

/**
 *  设置客户端的请求状态
 */
- (void)setupClientRequestState:(BaseRequestBlock )block {
    
//    NSLog(@"class = %@ method = %s",NSStringFromClass(self),__func__);
    NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    [AccessTokenHandler fetchClinetGrantTokenWithRetrytimes:3 callback:block];
}

@end

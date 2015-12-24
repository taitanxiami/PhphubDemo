//
//  APIRequestHandler.h
//  PhphubDemo
//
//  Created by taitanxiami on 15/12/22.
//  Copyright © 2015年 taitanxiami. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIRequestHandler : NSObject

@property (nonatomic,copy) NSString *grantType;

- (void)registerNotifications;
- (BOOL)isClientGrantRequest:(NSURLRequest *)request;

@end

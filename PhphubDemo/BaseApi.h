//
//  BaseApi.h
//  PhphubDemo
//
//  Created by taitanxiami on 15/12/23.
//  Copyright © 2015年 taitanxiami. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "APIRequestHandler.h"

typedef void(^BaseRequestBlock)(id data,NSError *error);
typedef void(^BaseRequestSuccessBlock)(NSURLSessionDataTask *task, id responseObejct);
typedef void(^BaseRequestFailureBlock)(NSURLSessionDataTask *task, NSError *error);


@interface BaseApi : AFHTTPSessionManager
@property(strong,nonatomic) APIRequestHandler* handler;


#pragma mark - share instance

+ (instancetype)clientGrantInstance;


- (void)setupClientGtantRequest;
@end

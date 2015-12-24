//
//  TopicApis.m
//  PhphubDemo
//
//  Created by taitanxiami on 15/12/24.
//  Copyright © 2015年 taitanxiami. All rights reserved.
//

#import "TopicApis.h"
#import "TopicEntity.h"
#import "BaseApi.h"

@implementation TopicApis

- (NSString *)getUrlPathWithFilter:(NSString *)filter atPage:(NSInteger)pageIndex{
    NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));

    NSString *urlPath = @"topics?include=node,last_reply_user,user&filters=%@&per_page=20&page=%ld&columns=user(signature)";
    return [NSString stringWithFormat:urlPath, filter, (long)pageIndex];
}

- (id)getExcellentTopicList:(BaseRequestBlock)block atPage:(NSInteger)page {
    NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));

    NSString *urlPath = [self getUrlPathWithFilter:@"excellent" atPage:page];
    return [self getTopicListByUrlPath:urlPath block:block];

}

- (id)getTopicListByUrlPath:(NSString *)path block:(BaseRequestBlock)block {
    NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));

    BaseRequestSuccessBlock successBlock = ^(NSURLSessionTask *task ,id rawData) {
        
        NSMutableDictionary *data = [(NSMutableDictionary *)rawData mutableCopy];
        data[@"entities"] = [TopicEntity arrayOfEntityFromArray:data[@"data"]];
//        data[@"pagination"] = [PaginationEntity entityFromDictionary:data[@"meta"][@"pagination"]];
        if (block) block(data, nil);
    };
    BaseRequestFailureBlock failureBlock = ^(NSURLSessionTask * task, NSError *error) {
        if (block) block(nil, error);
    };
    
    return [[BaseApi clientGrantInstance] GET:path
                                   parameters:nil
                                      success:successBlock
                                      failure:failureBlock];

}
@end

//
//  TopicModel.m
//  PhphubDemo
//
//  Created by taitanxiami on 15/12/24.
//  Copyright © 2015年 taitanxiami. All rights reserved.
//

#import "TopicModel.h"

@implementation TopicModel

-(instancetype)init {
    self  = [super init];
    if (self) {
        _api  =  [[TopicApis alloc]init];
    }
    return self;
}
-(id)getExcellentTopicList:(BaseRequestBlock)block atPage:(NSInteger)pageIndex {
    NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));

       return  [_api getExcellentTopicList:block atPage:pageIndex];
}
@end

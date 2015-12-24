//
//  TopicApis.h
//  PhphubDemo
//
//  Created by taitanxiami on 15/12/24.
//  Copyright © 2015年 taitanxiami. All rights reserved.
//

#import "BaseApi.h"

@interface TopicApis : BaseApi

- (id)getExcellentTopicList:(BaseRequestBlock)block atPage:(NSInteger)page;

@end

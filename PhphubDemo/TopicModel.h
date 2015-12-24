//
//  TopicModel.h
//  PhphubDemo
//
//  Created by taitanxiami on 15/12/24.
//  Copyright © 2015年 taitanxiami. All rights reserved.
//

#import "BaseModel.h"
#import "TopicApis.h"
@interface TopicModel : BaseModel
@property TopicApis *api;


- (id)getExcellentTopicList:(BaseRequestBlock)block atPage:(NSInteger)pageIndex;

@end

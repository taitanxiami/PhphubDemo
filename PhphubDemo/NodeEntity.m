//
//  NodeEntity.m
//  PhphubDemo
//
//  Created by taitanxiami on 15/12/22.
//  Copyright © 2015年 taitanxiami. All rights reserved.
//

#import "NodeEntity.h"

@implementation NodeEntity
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"nodeId" : @"id",
             @"nodeName" : @"name",
             @"parentNode" : @"parent_node",
             };
}

@end

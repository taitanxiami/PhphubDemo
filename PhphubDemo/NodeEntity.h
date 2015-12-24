//
//  NodeEntity.h
//  PhphubDemo
//
//  Created by taitanxiami on 15/12/22.
//  Copyright © 2015年 taitanxiami. All rights reserved.
//

#import "BaseEntity.h"

@interface NodeEntity : BaseEntity

@property (nonatomic, strong) NSNumber *nodeId;
@property (nonatomic, copy) NSString *nodeName;
@property (nonatomic, strong) NSNumber *parentNode;

@end

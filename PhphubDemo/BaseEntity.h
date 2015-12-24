//
//  BaseEntity.h
//  PhphubDemo
//
//  Created by taitanxiami on 15/12/22.
//  Copyright © 2015年 taitanxiami. All rights reserved.
//

#import "MTLModel.h"
#import <MTLJSONAdapter.h>
#import <NSValueTransformer+MTLPredefinedTransformerAdditions.h>
#import <MTLValueTransformer.h>


@interface BaseEntity : MTLModel<MTLJSONSerializing>

#pragma mark - Class Methon to creat Entity

+ (NSDateFormatter *)dataFormatter;

+ (id)entityFromEntity:(NSDictionary *)data;
+ (NSArray *)arrayOfEntityFromArray:(NSArray *)array;

@end

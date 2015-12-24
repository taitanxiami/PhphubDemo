//
//  BaseEntity.m
//  PhphubDemo
//
//  Created by taitanxiami on 15/12/22.
//  Copyright © 2015年 taitanxiami. All rights reserved.
//

#import "BaseEntity.h"

@implementation BaseEntity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    NSLog(@"You must override %@ in a subclass",NSStringFromSelector(_cmd));
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

+ (NSDateFormatter *)dataFormatter {
    
    static NSDateFormatter *_dataFormdatter;
    
    if (!_dataFormdatter) {
        
        _dataFormdatter  =[[NSDateFormatter alloc]init];
        _dataFormdatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        
    }
    return _dataFormdatter;
}

+ (id)entityFromEntity:(NSDictionary *)data {
    
    NSError *error;
    id entity = [MTLJSONAdapter modelOfClass:[self class]
                          fromJSONDictionary:data
                                       error:&error];
    
    if ( error ) {
        NSLog(@"Couldn't convert JSON to Entity: %@", error);
        return nil;

    }
    return entity;
}
+ (NSArray *)arrayOfEntityFromArray:(NSArray *)array {
    
    NSError *error;
    NSArray *arrEntities = [MTLJSONAdapter modelsOfClass:[self class]
                                           fromJSONArray:array
                                                   error:&error];
    
    if (error) {
        NSLog(@"Couldn't convert app infos JSON to ChoosyAppInfo models: %@", error);
        return nil;

    }
    return arrEntities;
}

@end

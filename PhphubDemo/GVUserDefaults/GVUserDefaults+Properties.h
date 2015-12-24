//
//  GVUserDefaults+Properties.h
//  PHPHub
//
//  Created by Aufree on 9/30/15.
//  Copyright (c) 2015 ESTGroup. All rights reserved.
//

#import "GVUserDefaults.h"

@interface GVUserDefaults (Properties)

/**
 *  用户token
 */
@property (nonatomic, copy) NSString *userClientToken;
/**
 *  当前用户id
 */
@property (nonatomic, copy) NSNumber *currentUserId;
/**
 *  最后一次显示广告时间
 */
@property (nonatomic, strong) NSDate *lastTimeShowLaunchScreenAd;
@end

//
//  CurrentUser.h
//  PhphubDemo
//
//  Created by taitanxiami on 15/12/23.
//  Copyright © 2015年 taitanxiami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserEntity.h"

@interface CurrentUser : NSObject

+ (CurrentUser *)instance;

- (void)setupClientRequestState:(BaseRequestBlock)block;

@end

//
//  UserEntity.m
//  PhphubDemo
//
//  Created by taitanxiami on 15/12/22.
//  Copyright © 2015年 taitanxiami. All rights reserved.
//

#import "UserEntity.h"


@implementation UserEntity
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"userId" : @"id",
             @"username" : @"name",
             @"avatar" : @"avatar",
             @"topicCount" : @"topic_count",
             @"replyCount" : @"reply_count",
             @"notificationCount" : @"notification_count",
             @"twitterAccount" : @"twitter_account",
             @"company" : @"company",
             @"city" : @"city",
             @"email" : @"email",
             @"signature" : @"signature",
             @"githubName" : @"github_name",
             @"githubURL" : @"github_url",
             @"realName" : @"real_name",
             @"blogURL" : @"personal_website",
             @"repliesUrl" : @"links.replies_web_view",
             @"createdAtDate" : @"created_at",
             @"updatedAtDate" : @"updated_at",
             };
}

@end

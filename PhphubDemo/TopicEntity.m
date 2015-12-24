//
//  TopicEntity.m
//  PhphubDemo
//
//  Created by taitanxiami on 15/12/22.
//  Copyright © 2015年 taitanxiami. All rights reserved.
//

#import "TopicEntity.h"

@implementation TopicEntity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{
             
        @"topicId" : @"id",
        @"nodeId" :@"node_id",
        @"topicTitle" : @"title",
        @"topicBody" : @"body",
        @"topicReliesCount" : @"reply_count",
        @"voteCount" : @"vote_count",
        @"user" : @"user.data",
        @"lastReplyUser" : @"last_reply_user.data",
        @"node" : @"node.data",
        @"topicContentUrl" : @"links_details_web_view",
        @"topicRepliesUrl" : @"links_replies_web_view",
        @"favorite" : @"favorite",
        @"attension" : @"attention",
        @"voteUp" : @"vote_up",
        @"voteDown" : @"vote_down",
        @"udpateAt" : @"update_at"

        };
}

+ (NSValueTransformer *)userJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[UserEntity class]];
}

+ (NSValueTransformer *)lastReplyUserJSonTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[UserEntity class]];
}

+ (NSValueTransformer *)noteJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[NodeEntity class]];
}
@end

//
//  TopicEntity.h
//  PhphubDemo
//
//  Created by taitanxiami on 15/12/22.
//  Copyright © 2015年 taitanxiami. All rights reserved.
//

#import "BaseEntity.h"
#import "UserEntity.h"
#import "NodeEntity.h"

@interface TopicEntity : BaseEntity

@property (nonatomic, strong) NSNumber   *topicId;
@property (nonatomic, strong) NSNumber   *nodeId;
@property (nonatomic, copy  ) NSString   *topicTitle;
@property (nonatomic, copy  ) NSString   *topicBody;
@property (nonatomic, strong) NSNumber   *topicRepliesCount;
@property (nonatomic, strong) NSNumber   *voteCount;
@property (nonatomic, strong) UserEntity *user;
@property (nonatomic, strong) UserEntity *lastReplyUser;
@property (nonatomic, strong) NodeEntity *node;
@property (nonatomic, copy  ) NSString   *topicContentUrl;
@property (nonatomic, copy  ) NSString   *topicRepliesUrl;
@property (nonatomic, assign) BOOL       favorite;
@property (nonatomic, assign) BOOL       attention;
@property (nonatomic, assign) BOOL       voteUp;
@property (nonatomic, assign) BOOL       voteDown;
@property (nonatomic, strong) NSDate     *updatedAt;
@end

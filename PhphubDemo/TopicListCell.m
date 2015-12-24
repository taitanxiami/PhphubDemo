//
//  TopicListCell.m
//  PhphubDemo
//
//  Created by taitanxiami on 15/12/22.
//  Copyright © 2015年 taitanxiami. All rights reserved.
//


#import "TopicListCell.h"
#import "BaseView.h"
#import <UIImageView+WebCache.h>
#import <DateTools.h>
#import <Masonry.h>
static CGFloat topicListCellAvatorHeight = 38;

@interface TopicListCell ()

@property (nonatomic, strong) BaseView *baseView;
@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UIImageView *circleImageView;
@property (nonatomic, strong) UILabel *topicTitleLabel;
@property (nonatomic, strong) UILabel *topicInfoLabel;
@property (nonatomic, strong) UILabel *topicRepliesCountLabel;
@property (nonatomic, assign) BOOL didSetupConstraints;

@end
@implementation TopicListCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setTopicEntity:(TopicEntity *)topicEntity {
    _topicEntity = topicEntity;
    
    NSURL *url  = [NSURL URLWithString:_topicEntity.user.avatar];
    [_avatarImageView sd_setImageWithURL:url placeholderImage:nil];
    _topicTitleLabel.text = _topicEntity.topicTitle;
    _topicInfoLabel.text = [NSString stringWithFormat:@"%@ > 最后由 %@ > %@",_topicEntity.node.nodeName,_topicEntity.lastReplyUser.username,[_topicEntity.updatedAt timeAgoSinceNow]];
    
    
    NSNumber *repliesCount = _topicEntity.topicRepliesCount;
    _topicRepliesCountLabel.text = repliesCount.integerValue > 99? @"99+" : repliesCount.stringValue;
    
    if (!_didSetupConstraints) {
        self.didSetupConstraints = YES;
        [self addAutoLayout2Cell];
    }
}

#pragma mark - Lazy load view

-(BaseView *)baseView {
    if (!_baseView) {
        
        _baseView  = [[BaseView alloc]init];
        [_baseView addSubview:self.avatarImageView];
        [_baseView addSubview:self.circleImageView];
        [_baseView addSubview:self.topicTitleLabel];
        [_baseView addSubview:self.topicInfoLabel];
        [_baseView addSubview:self.topicRepliesCountLabel];
    }
    
    return _baseView;
}

-(UIImageView *)avatarImageView {
    if (_avatarImageView) {
        _avatarImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, topicListCellAvatorHeight, topicListCellAvatorHeight)];
        _avatarImageView.contentMode = UIViewContentModeScaleAspectFill;
        _avatarImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapAvatorGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAVatorImageView)];
        [_avatarImageView addGestureRecognizer:tapAvatorGesture];
    }
    return _avatarImageView;
}

- (UIImageView *)circleImageView {
    if (_circleImageView) {
        
        _circleImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, topicListCellAvatorHeight, topicListCellAvatorHeight)];
        _circleImageView.image = [UIImage imageNamed:@"corner_circle"];
    }
    return _circleImageView;
}

-(UILabel *)topicTitleLabel {
    if (!_topicTitleLabel) {
        _topicTitleLabel = [UILabel new];
        _topicTitleLabel.font = [UIFont systemFontOfSize:14];
        _topicTitleLabel.numberOfLines = 2;
    }
    return _topicTitleLabel;
}

-(UILabel *)topicInfoLabel {
    if (_topicInfoLabel) {
        
        _topicInfoLabel = [UILabel new];
        _topicInfoLabel.height = 15;
        _topicInfoLabel.font = [UIFont systemFontOfSize:11];
        _topicInfoLabel.textColor = [UIColor colorWithWhite:0.634 alpha:1.000];

    }
    return _topicInfoLabel;
}
-(UILabel *)topicRepliesCountLabel {
    if (!_topicRepliesCountLabel) {
        
        _topicRepliesCountLabel = [UILabel new];
        _topicRepliesCountLabel.numberOfLines = 1;
        _topicRepliesCountLabel.font = [UIFont systemFontOfSize:11];
        _topicRepliesCountLabel.textAlignment = NSTextAlignmentCenter;
        _topicRepliesCountLabel.textColor = [UIColor whiteColor];
        _topicRepliesCountLabel.layer.backgroundColor = [UIColor colorWithRed:0.510 green:0.676 blue:1.000 alpha:1.000].CGColor;
    }
    return _topicRepliesCountLabel;
}

- (void)addAutoLayout2Cell {
    CGFloat baseViewMargin = 8;
    CGFloat toppicTitleMagin = 10;
    CGFloat topicTitleOffset = self.avatarImageView.width + toppicTitleMagin * 2;
    
    [self.baseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(0);
        make.right.equalTo(self.contentView.mas_left).offset(baseViewMargin);
        make.right.equalTo(self.contentView.mas_right).offset(-baseViewMargin);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-baseViewMargin);
    }];
    
    [self.topicTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.baseView.mas_top).offset(toppicTitleMagin);
        make.left.equalTo(self.baseView.mas_left).offset(topicTitleOffset);
        make.right.equalTo(self.topicRepliesCountLabel.mas_left).offset(-topicTitleOffset);
    }];
    
    [self.topicInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topicTitleLabel.mas_bottom).offset(baseViewMargin);
        make.left.equalTo (self.baseView.mas_left).offset(topicTitleOffset);
        make.right.equalTo(self.topicRepliesCountLabel.mas_left).offset(-toppicTitleMagin);
        make.bottom.equalTo(self.baseView.mas_bottom).offset(-baseViewMargin);
    }];
    
    [self.topicRepliesCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        CGFloat topicRepliesCountHeight = 20;

        _topicRepliesCountLabel.layer.cornerRadius = topicRepliesCountHeight / 2;
        _topicRepliesCountLabel.layer.shouldRasterize = YES;
        make.size.mas_equalTo(CGSizeMake(topicRepliesCountHeight, topicRepliesCountHeight));
        make.centerY.mas_equalTo(self.baseView.mas_centerY);
        make.right.equalTo(self.baseView).offset(-toppicTitleMagin);

    }];
}
#pragma mark - Actions
- (void)tapAVatorImageView {
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

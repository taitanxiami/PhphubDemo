//
//  TopicListTableView.h
//  PhphubDemo
//
//  Created by taitanxiami on 15/12/22.
//  Copyright © 2015年 taitanxiami. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TopicListTableViewDelegate <NSObject>

- (void)headerRefreshing;
- (void)footerRereshing;

@end

@interface TopicListTableView : UITableView

/**
 *  数据源
 */
@property (nonatomic,strong) NSMutableArray *topicEntites;
/**
 *  代理对象
 */
@property (weak,nonatomic) id<TopicListTableViewDelegate>topicTableViewDelegate;

@end

//
//  TopicListTableView.m
//  PhphubDemo
//
//  Created by taitanxiami on 15/12/22.
//  Copyright © 2015年 taitanxiami. All rights reserved.
//

#import "TopicListTableView.h"
#import "TopicListCell.h"
#import <MJRefresh/MJRefresh.h>

static NSString *topicListIdentifier = @"topicListIdentifier";

@interface TopicListTableView () <UITableViewDataSource,UITableViewDelegate>

@end


@implementation TopicListTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self  =    [super initWithFrame:frame style:style];
    
    if (self) {
        
        [self setup];
    }    
    return self;
}

/**
 *  tableView初始化
 */
- (void)setup {
    
    [self registerClass:[TopicListCell class] forCellReuseIdentifier:topicListIdentifier];
    self.backgroundColor = [UIColor colorWithWhite:0.933 alpha:1.00];
    self.separatorColor = [UIColor clearColor];
    self.rowHeight = 80;
    self.dataSource = self;
    self.delegate=self;
    [self setupHeaderView];
//    [self setupFooterView];
    [self reloadData];
    
}
- (void)setupHeaderView {
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
    header.lastUpdatedTimeLabel.hidden = YES;
//    header.stateLabel.font = [UIFont fontWithName:FontName size:13];
    self.mj_header = header;
}

- (void)setupFooterView {
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
//    footer.stateLabel.font = [UIFont fontWithName:FontName size:13];
    self.mj_footer = footer;
}
- (void)refreshData {
    if (_topicTableViewDelegate && [_topicTableViewDelegate respondsToSelector:@selector(headerRefreshing)]) {
        [_topicTableViewDelegate headerRefreshing];
    }
}

- (void)loadMoreData {
    if (_topicTableViewDelegate && [_topicTableViewDelegate respondsToSelector:@selector(footerRereshing)]) {
        [_topicTableViewDelegate footerRereshing];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.topicEntites.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TopicListCell *cell  = [tableView dequeueReusableCellWithIdentifier:topicListIdentifier];
    if (!cell) {
        
        cell  = [[TopicListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:topicListIdentifier];
    }
    
    TopicEntity *topicEntity = self.topicEntites[indexPath.section];
    cell.topicEntity = topicEntity;
    return cell;
}

@end

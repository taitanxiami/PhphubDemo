//
//  DDEssentialListViewController.m
//  PhphubDemo
//
//  Created by taitanxiami on 15/12/22.
//  Copyright © 2015年 taitanxiami. All rights reserved.
//

#import "DDEssentialListViewController.h"
#import "TopicListTableView.h"
#import <MJRefresh/MJRefresh.h>
#import "CurrentUser.h"
#import "TopicEntity.h"
#import "TopicModel.h"
@interface DDEssentialListViewController ()<TopicListTableViewDelegate>

@property (nonatomic,strong)TopicListTableView *tableView;
@property (nonatomic,strong) TopicEntity *topicEntites;

@end

@implementation DDEssentialListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"精华";
    
    self.tableView = [[TopicListTableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.topicTableViewDelegate = self;
    
    
    [self checkUserClientToken];
    [self createRightButtonItem];
}

/**
 *  检测用户客户端token
 */
- (void)checkUserClientToken {
    
    __weak typeof(self)weakself = self;
    BaseRequestBlock block = ^(NSDictionary *data,NSError *error) {
        [weakself.tableView.mj_header beginRefreshing];
    };    
    [[CurrentUser instance] setupClientRequestState:block];
}

- (void)createRightButtonItem {
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"pencil_square_icon"]
                                                                           style:UIBarButtonItemStylePlain
                                                                          target:self
                                                                          action:@selector(jumpToPostTopicVC)];
//    rightBarButtonItem.tintColor = [UIColor colorWithRed:0.502 green:0.776 blue:0.200 alpha:1.000];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}


#pragma mark - Action

/**
 *  发布新话题
 */
- (void)jumpToPostTopicVC {
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableview delegate 
- (void)headerRefreshing {
    NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));

    __weak typeof(self) weakself = self;
    BaseRequestBlock callback =^ (NSDictionary *data, NSError *error) {
        if (!error) {
            weakself.topicEntites = data[@"entities"];
//            weakself.pagination = data[@"pagination"];
            [weakself.tableView reloadData];
        }
        
        [weakself.tableView.mj_header endRefreshing];
//        if (weakself.pagination.totalPages > 1) {
//            [weakself.tableView setupFooterView];
//        }
    };
    
    [self fetchDataSource:callback atPage:1];

}

- (void)fetchDataSource:(BaseRequestBlock)callback atPage:(NSUInteger)atPage {
    NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));

    [[TopicModel instance] getExcellentTopicList:callback atPage:atPage];
}

- (void)footerRereshing {
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

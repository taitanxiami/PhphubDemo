//
//  DDMeViewController.m
//  PhphubDemo
//
//  Created by taitanxiami on 15/12/22.
//  Copyright © 2015年 taitanxiami. All rights reserved.
//

#import "DDMeViewController.h"

@interface DDMeViewController ()

@end

@implementation DDMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createRightButtonItem];
}

- (void)createRightButtonItem {
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"pencil_square_icon"]
                                                                           style:UIBarButtonItemStylePlain
                                                                          target:self
                                                                          action:@selector(jumpToPostTopicVC)];
    rightBarButtonItem.tintColor = [UIColor colorWithRed:0.502 green:0.776 blue:0.200 alpha:1.000];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

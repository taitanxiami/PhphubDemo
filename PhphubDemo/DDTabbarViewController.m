//
//  DDTabbarViewController.m
//  PhphubDemo
//
//  Created by taitanxiami on 15/12/22.
//  Copyright © 2015年 taitanxiami. All rights reserved.
//

#import "DDTabbarViewController.h"
#import "DDWikiListViewController.h"
#import "DDMeViewController.h"
#import "DDEssentialListViewController.h"
#import "DDTopicListViewController.h"
@interface DDTabbarViewController () {
    
    UINavigationController *_wikiNav;
    UINavigationController *_meNav;
    UINavigationController *_topicNav;
    UINavigationController *_essentialNav;
    
}

@end

@implementation DDTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    DDMeViewController *me =[[ DDMeViewController alloc]initWithStyle:UITableViewStyleGrouped];
    me.tabBarItem = [[UITabBarItem alloc]initWithTitle:nil image:[UIImage imageNamed:@"me_icon"] selectedImage:[UIImage imageNamed:@"me_selected_icon"]];
    
    _meNav = [[UINavigationController alloc]initWithRootViewController:me];

    DDEssentialListViewController *essentialVC = [[DDEssentialListViewController alloc]initWithStyle:UITableViewStylePlain];
    essentialVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:nil image:[UIImage imageNamed:@"essential_icon"] selectedImage:[UIImage imageNamed:@"essential_selected_icon"]];
    _essentialNav = [[UINavigationController alloc]initWithRootViewController:essentialVC];
    
    DDTopicListViewController *topic = [[DDTopicListViewController alloc]initWithStyle:UITableViewStyleGrouped];
    topic.tabBarItem = [[UITabBarItem alloc]initWithTitle:nil image:[UIImage imageNamed:@"forum_icon"] selectedImage:[UIImage imageNamed:@"forum_selected_icon"]];
    _topicNav = [[UINavigationController alloc]initWithRootViewController:topic];
    
    DDWikiListViewController *wiki = [[DDWikiListViewController alloc]initWithStyle:UITableViewStyleGrouped];
    wiki.tabBarItem  = [[UITabBarItem alloc]initWithTitle:nil image:[UIImage imageNamed:@"wiki_icon"] selectedImage:[UIImage imageNamed:@"wiki_selected_icon"]];
    _wikiNav = [[UINavigationController alloc]initWithRootViewController:wiki];
    
    self.viewControllers = @[_essentialNav,_topicNav,_wikiNav,_meNav];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end

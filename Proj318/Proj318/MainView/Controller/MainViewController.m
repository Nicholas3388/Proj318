//
//  MainViewController.m
//  Proj318
//
//  Created by apple on 16/3/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MainViewController.h"
#import "MessageViewController.h"
#import "ContactViewController.h"
#import "TodoViewController.h"
#import "MeViewController.h"

static MainViewController *instance;

@implementation MainViewController {
    // private
}

#pragma mark - singleton
+ (MainViewController *)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[MainViewController alloc]init];
    });
    return instance;
}

#pragma mark - load view
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self layout];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - layout setup
- (void)layout {
    self.title = NSLocalizedString(@"kMessage", nil);
    
    MessageViewController *mvc = [[MessageViewController alloc]init];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:mvc];
    nav1.title = NSLocalizedString(@"kMessage", nil);
    
    ContactViewController *cvc = [[ContactViewController alloc]init];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:cvc];
    nav2.title = NSLocalizedString(@"kContact", nil);
    
    TodoViewController *tvc = [[TodoViewController alloc]init];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:tvc];
    nav3.title = NSLocalizedString(@"kTodo", nil);
    
    MeViewController *mevc = [[MeViewController alloc]init];
    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:mevc];
    nav4.title = NSLocalizedString(@"kMe", nil);
    
    NSArray *vcArray = [NSArray arrayWithObjects:nav1, nav2, nav3, nav4, nil];
    self.viewControllers = vcArray;
    
    // set tab item image
    UITabBarItem *tabItem1 = [self.tabBar.items objectAtIndex:0];
    tabItem1.image = [[UIImage imageNamed:@"message"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabItem1.selectedImage = [[UIImage imageNamed:@"message"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabItem1.tag = 0;
    
    UITabBarItem *tabItem2 = [self.tabBar.items objectAtIndex:1];
    tabItem2.image = [[UIImage imageNamed:@"contact"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabItem2.selectedImage = [[UIImage imageNamed:@"contact"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabItem2.tag = 1;
    
    UITabBarItem *tabItem3 = [self.tabBar.items objectAtIndex:2];
    tabItem3.image = [[UIImage imageNamed:@"todo"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabItem3.selectedImage = [[UIImage imageNamed:@"todo"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabItem3.tag = 2;
    
    UITabBarItem *tabItem4 = [self.tabBar.items objectAtIndex:3];
    tabItem4.image = [[UIImage imageNamed:@"me"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabItem4.selectedImage = [[UIImage imageNamed:@"me"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabItem4.tag = 3;
}

@end

//
//  AccountViewController.m
//  Proj318
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "AccountViewController.h"

@implementation AccountViewController {
    // private
    UITableView *_tableView;
}

#pragma mark - load view
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self layout];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - setup layout
- (void)layout {
    self.title = NSLocalizedString(@"kAccountText", nil);
    
    self.view.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
}

@end

//
//  TodoViewController.m
//  Proj318
//
//  Created by apple on 16/3/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "TodoViewController.h"

@implementation TodoViewController

#pragma mark - load view
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self layout];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - layout
- (void)layout {
    self.title = NSLocalizedString(@"kTodo", nil);
}

@end

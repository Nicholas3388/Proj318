//
//  StartViewController.m
//  Proj318
//
//  Created by apple on 16/3/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "StartViewController.h"
#import "TheStartView.h"

@implementation StartViewController {
    // private
    TheStartView *_startView;
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
    _startView = [TheStartView instanceView];
    [self.view addSubview:_startView];
}

@end

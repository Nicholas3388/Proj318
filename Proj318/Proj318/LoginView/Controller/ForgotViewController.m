//
//  ForgotViewController.m
//  Proj318
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ForgotViewController.h"
#import "TheForgotView.h"

@implementation ForgotViewController {
    // private
    TheForgotView *_forgotView;
}

#pragma mark - load view
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self layout];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - layout setup
- (void)layout {
    self.title = NSLocalizedString(@"kForgot", nil);
    
    _forgotView = [TheForgotView instanceView];
    [self.view addSubview:_forgotView];
    
    
}


@end

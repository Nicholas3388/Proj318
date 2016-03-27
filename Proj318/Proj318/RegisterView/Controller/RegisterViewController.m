//
//  RegisterViewController.m
//  Proj318
//
//  Created by apple on 16/3/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "RegisterViewController.h"
#import "TheRegisterView.h"

@implementation RegisterViewController {
    // private
    TheRegisterView *_registerView;
}

#pragma mark - load view
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self layout];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - layout setup
- (void)layout {
    self.title = NSLocalizedString(@"kRegister", nil);
    
    _registerView = [TheRegisterView instanceView];
    [self.view addSubview:_registerView];
}

@end

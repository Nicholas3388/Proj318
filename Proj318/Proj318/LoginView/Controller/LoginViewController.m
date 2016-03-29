//
//  LoginViewController.m
//  Proj318
//
//  Created by apple on 16/3/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LoginViewController.h"
#import "TheLoginView.h"
#import "MainViewController.h"
#import "ForgotViewController.h"

@implementation LoginViewController {
    // private
    TheLoginView *_loginView;
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
    self.title = NSLocalizedString(@"kLogin", nil);
    
    _loginView = [TheLoginView instanceView];
    [self.view addSubview:_loginView];
    
    [_loginView.loginButton addTarget:self action:@selector(onLogin) forControlEvents:UIControlEventTouchUpInside];
    
    [_loginView.forgotButton addTarget:self action:@selector(onForgotPassword) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onLogin {
    // you should request server here
    
    MainViewController *mvc = [MainViewController shareInstance];
    [self.navigationController pushViewController:mvc animated:YES];
}

- (void)onForgotPassword {
    ForgotViewController *fvc = [[ForgotViewController alloc]init];
    [self.navigationController pushViewController:fvc animated:YES];
}

@end

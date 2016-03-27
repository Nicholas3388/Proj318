//
//  StartViewController.m
//  Proj318
//
//  Created by apple on 16/3/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "StartViewController.h"
#import "TheStartView.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"

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
    
    [_startView.loginButton addTarget:self action:@selector(onLoginButtonTouched) forControlEvents:UIControlEventTouchUpInside];
    [_startView.registerButton addTarget:self action:@selector(onRegisterButtonTouched) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - button handler
- (void)onLoginButtonTouched {
    // name validation, password validation
    [self onLogin];
}

- (void)onRegisterButtonTouched {
    RegisterViewController *rvc = [[RegisterViewController alloc]init];
    [self.navigationController pushViewController:rvc animated:YES];
    self.navigationController.navigationBarHidden = NO;
}

- (void)onLogin {
    // query server here
    
    LoginViewController *lvc = [[LoginViewController alloc]init];
    [self.navigationController pushViewController:lvc animated:YES];
    self.navigationController.navigationBarHidden = NO;
}

@end

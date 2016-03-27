//
//  MeViewController.m
//  Proj318
//
//  Created by apple on 16/3/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MeViewController.h"

@implementation MeViewController

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
    self.title = NSLocalizedString(@"kMe", nil);
    
    // create setting button
    UIButton *settingButton = [UIButton buttonWithType:UIButtonTypeSystem];
    settingButton.frame = CGRectMake(0, 0, 20, 20);
    [settingButton setImage:[UIImage imageNamed:@"btn_set_normal"] forState:UIControlStateNormal];
    [settingButton addTarget:self action:@selector(onSettingButtonTouched) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithCustomView:settingButton];
    self.navigationItem.rightBarButtonItem = rightButton;
}

#pragma mark - button handler
- (void)onSettingButtonTouched {
    
}

@end

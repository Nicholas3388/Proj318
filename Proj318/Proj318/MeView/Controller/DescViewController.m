//
//  DescViewController.m
//  Proj318
//
//  Created by 王妍慧 on 16/5/3.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "DescViewController.h"
#import "Tools.h"

@implementation DescViewController {
    // private
}

#pragma mark - load view
- (void) viewDidLoad {
    [super viewDidLoad];
    
}

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // back button
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton.frame = CGRectMake(0, 0, 80, 40);
    [backButton setImage:[UIImage imageNamed:@"btn_return_normal"] forState:UIControlStateNormal];
    [backButton setTitle:NSLocalizedString(@"kBack", nil) forState:UIControlStateNormal];
    backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    backButton.titleLabel.font = [UIFont systemFontOfSize:18.0];
    [backButton addTarget:self action:@selector(onBack) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *topLeftButton = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = topLeftButton;
    
    // save button
    UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeSystem];
    saveButton.frame = CGRectMake(0, 0, 80, 40);
    //[saveButton setImage:[UIImage imageNamed:@"message"] forState:UIControlStateNormal];
    [saveButton setTitle:NSLocalizedString(@"kSaveDesc", nil) forState:UIControlStateNormal];
    saveButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    saveButton.titleLabel.font = [UIFont systemFontOfSize:18.0];
    [saveButton addTarget:self action:@selector(onSave) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *topRightButton = [[UIBarButtonItem alloc]initWithCustomView:saveButton];
    self.navigationItem.rightBarButtonItem = topRightButton;
}

#pragma mark - button handler
- (void)onBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - save button 
- (void)onSave {
    [Tools setDesc:@"saved"];
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end

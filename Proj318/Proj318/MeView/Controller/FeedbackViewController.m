//
//  FeedbackViewController.m
//  Proj318
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "FeedbackViewController.h"

@implementation FeedbackViewController {
    //private
}

#pragma mark - load view
- (void)viewDidLoad {
    [super viewDidLoad];
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
}

#pragma mark - button handler
- (void)onBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

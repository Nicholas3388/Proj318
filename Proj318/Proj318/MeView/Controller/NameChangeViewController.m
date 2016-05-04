//
//  nameChangeViewController.m
//  Proj318
//
//  Created by 王妍慧 on 16/5/4.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "NameChangeViewController.h"

@implementation NameChangeViewController

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - done button clicked
-(void)onDone:(QElement *)element{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hey!" message:@"User name has been saved" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

@end

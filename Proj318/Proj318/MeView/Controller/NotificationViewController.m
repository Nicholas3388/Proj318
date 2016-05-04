//
//  NotificationViewController.m
//  Proj318
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "NotificationViewController.h"

@implementation NotificationViewController {
    // private
    UITableView *_tableView;
}

#pragma mark - load view
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self layout];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - setup layout
- (void)layout {
    self.title = NSLocalizedString(@"kNotificationText", nil);
    
    self.view.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
}

- (void)onBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - event handler
-(void)newsNotify:(QElement *)element{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hey!" message:@"This is the exampleAction method in the NotificationViewController" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

-(void)soundNotify:(QElement *)element{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hey!" message:@"This is the exampleAction method in the NotificationViewController" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

-(void)vibrateNotify:(QElement *)element{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hey!" message:@"This is the exampleAction method in the NotificationViewController" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

-(void)updateNotify:(QElement *)element{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hey!" message:@"This is the exampleAction method in the NotificationViewController" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

@end

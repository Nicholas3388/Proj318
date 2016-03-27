//
//  ContactViewController.m
//  Proj318
//
//  Created by apple on 16/3/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ContactViewController.h"

@implementation ContactViewController

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
    self.title = NSLocalizedString(@"kContact", nil);
}

@end

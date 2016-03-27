//
//  TheStartView.m
//  Proj318
//
//  Created by apple on 16/3/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "TheStartView.h"

@implementation TheStartView {
    // private
}

@synthesize registerButton;
@synthesize loginButton;

#pragma mark - create instance
+ (TheStartView *)instanceView {
    NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"TheStartView" owner:nil options:nil];
    TheStartView *instance = [nib objectAtIndex:0];
    
    // layout setup
    instance.registerButton.backgroundColor = [UIColor blackColor];
    instance.loginButton.backgroundColor = [UIColor blackColor];
    instance.registerButton.layer.cornerRadius = 8.0;
    instance.loginButton.layer.cornerRadius = 8.0;
    
    [instance.registerButton setTitle:NSLocalizedString(@"kRegister", nil) forState:UIControlStateNormal];
    [instance.loginButton setTitle:NSLocalizedString(@"kLogin", nil) forState:UIControlStateNormal];
    
    return instance;
}

@end

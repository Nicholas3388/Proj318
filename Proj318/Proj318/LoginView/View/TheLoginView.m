//
//  LoginView.m
//  Proj318
//
//  Created by apple on 16/3/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "TheLoginView.h"

@implementation TheLoginView {
    // private
}

@synthesize forgotButton;
@synthesize loginButton;
@synthesize nameTextfield;
@synthesize passwordTextfield;
@synthesize nameLabel;
@synthesize passwordLabel;

#pragma mark - create instance
+ (TheLoginView *)instanceView {
    NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"TheLoginView" owner:nil options:nil];
    TheLoginView *instance = [nib objectAtIndex:0];

    instance.nameLabel.text = NSLocalizedString(@"kName", nil);
    instance.passwordLabel.text = NSLocalizedString(@"kPassword", nil);
    
    instance.nameTextfield.placeholder = NSLocalizedString(@"kInputName", nil);
    instance.passwordTextfield.placeholder = NSLocalizedString(@"kInputPassword", nil);
    
    instance.loginButton.layer.cornerRadius = 8.0;
    [instance.loginButton setTitle:NSLocalizedString(@"kLogin", nil) forState:UIControlStateNormal];
    instance.loginButton.backgroundColor = [UIColor blackColor];
    
    [instance.forgotButton setTitle:NSLocalizedString(@"kForgot", nil) forState:UIControlStateNormal];
    
    return instance;
}

@end

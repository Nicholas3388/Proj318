//
//  TheRegisterView.m
//  Proj318
//
//  Created by apple on 16/3/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "TheRegisterView.h"

@implementation TheRegisterView

@synthesize phoneLabel;
@synthesize passwordLabel;
@synthesize verifCodeLabel;
@synthesize phoneTextfield;
@synthesize passwordTextfield;
@synthesize verifCodeField;
@synthesize getVerifCodeButton;
@synthesize nextButton;

+ (TheRegisterView *)instanceView {
    NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"TheRegisterView" owner:nil options:nil];
    TheRegisterView *instance = [nib objectAtIndex:0];
    
    instance.phoneLabel.text = NSLocalizedString(@"kPhone", nil);
    instance.passwordLabel.text = NSLocalizedString(@"kPassword", nil);
    instance.verifCodeLabel.text = NSLocalizedString(@"kVerifCode", nil);
    
    instance.phoneTextfield.placeholder = NSLocalizedString(@"kInputPhone", nil);
    instance.passwordTextfield.placeholder = NSLocalizedString(@"kInputPassword", nil);
    instance.verifCodeField.placeholder = NSLocalizedString(@"kInputVerifCode", nil);
    
    instance.nextButton.layer.cornerRadius = 8.0;
    [instance.nextButton setTitle:NSLocalizedString(@"kNextStep", nil) forState:UIControlStateNormal];
    instance.nextButton.backgroundColor = [UIColor blackColor];
    
    [instance.getVerifCodeButton setTitle:NSLocalizedString(@"kGetVerifCode", nil) forState:UIControlStateNormal];
    
    return instance;
}

@end

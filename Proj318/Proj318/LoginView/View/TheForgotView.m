//
//  TheForgotView.m
//  Proj318
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "TheForgotView.h"

@implementation TheForgotView

@synthesize phoneLabel;
@synthesize verifCodeLabel;
@synthesize phoneInputTextfield;
@synthesize verifCodeInputTextfield;
@synthesize getVerifCodeButton;
@synthesize doneButton;

#pragma mark - create instance
+ (TheForgotView *)instanceView {
    NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"TheForgotView" owner:nil options:nil];
    TheForgotView *instance = [nib objectAtIndex:0];
    
    instance.phoneLabel.text = NSLocalizedString(@"kPhone", nil);
    instance.verifCodeLabel.text = NSLocalizedString(@"kVerifCode", nil);
    
    instance.phoneInputTextfield.placeholder = NSLocalizedString(@"kInputPhone", nil);
    instance.verifCodeInputTextfield.placeholder = NSLocalizedString(@"kInputVerifCode", nil);
    
    instance.doneButton.layer.cornerRadius = 8.0;
    [instance.doneButton setTitle:NSLocalizedString(@"kDone", nil) forState:UIControlStateNormal];
    instance.doneButton.backgroundColor = [UIColor blackColor];
    
    [instance.getVerifCodeButton setTitle:NSLocalizedString(@"kGetVerifCode", nil) forState:UIControlStateNormal];
    
    return instance;
}

@end

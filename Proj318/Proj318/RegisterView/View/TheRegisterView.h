//
//  TheRegisterView.h
//  Proj318
//
//  Created by apple on 16/3/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TheRegisterView : UIView

@property (strong, nonatomic) IBOutlet UITextField *phoneTextfield;

@property (strong, nonatomic) IBOutlet UITextField *passwordTextfield;

@property (strong, nonatomic) IBOutlet UITextField *verifCodeField;

@property (strong, nonatomic) IBOutlet UIButton *getVerifCodeButton;

@property (strong, nonatomic) IBOutlet UIButton *nextButton;

@property (strong, nonatomic) IBOutlet UILabel *phoneLabel;

@property (strong, nonatomic) IBOutlet UILabel *passwordLabel;

@property (strong, nonatomic) IBOutlet UILabel *verifCodeLabel;

+ (TheRegisterView *)instanceView;

@end

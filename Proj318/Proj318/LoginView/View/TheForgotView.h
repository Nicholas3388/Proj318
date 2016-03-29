//
//  TheForgotView.h
//  Proj318
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TheForgotView : UIView

@property (strong, nonatomic) IBOutlet UILabel *phoneLabel;

@property (strong, nonatomic) IBOutlet UILabel *verifCodeLabel;

@property (strong, nonatomic) IBOutlet UITextField *phoneInputTextfield;

@property (strong, nonatomic) IBOutlet UITextField *verifCodeInputTextfield;

@property (strong, nonatomic) IBOutlet UIButton *getVerifCodeButton;

@property (strong, nonatomic) IBOutlet UIButton *doneButton;

+ (TheForgotView *)instanceView;

@end

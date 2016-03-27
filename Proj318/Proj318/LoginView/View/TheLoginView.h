//
//  LoginView.h
//  Proj318
//
//  Created by apple on 16/3/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TheLoginView : UIView

@property (strong, nonatomic) IBOutlet UIButton *forgotButton;

@property (strong, nonatomic) IBOutlet UIButton *loginButton;

@property (strong, nonatomic) IBOutlet UITextField *nameTextfield;

@property (strong, nonatomic) IBOutlet UITextField *passwordTextfield;

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

@property (strong, nonatomic) IBOutlet UILabel *passwordLabel;

+ (TheLoginView *)instanceView;

@end

//
//  TheStartView.h
//  Proj318
//
//  Created by apple on 16/3/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TheStartView : UIView

@property (strong, nonatomic) IBOutlet UIButton *registerButton;

@property (strong, nonatomic) IBOutlet UIButton *loginButton;

+ (TheStartView *)instanceView;

@end

//
//  MyInfoViewCell.h
//  Proj318
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MyDetailInfoView : UIView

@property (strong, nonatomic) IBOutlet UIImageView *portrait;

+ (MyDetailInfoView *)instanceView;

@end

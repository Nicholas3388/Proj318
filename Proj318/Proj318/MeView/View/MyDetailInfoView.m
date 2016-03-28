//
//  MyInfoViewCell.m
//  Proj318
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MyDetailInfoView.h"

@implementation MyDetailInfoView

@synthesize portrait;

+ (MyDetailInfoView *)instanceView {
    NSArray *array = [[NSBundle mainBundle]loadNibNamed:@"MyDetailInfoView" owner:nil options:nil];
    return [array objectAtIndex:0];
}

@end

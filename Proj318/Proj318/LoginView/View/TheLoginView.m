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


#pragma mark - create instance
+ (TheLoginView *)instanceView {
    NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"TheLoginView" owner:nil options:nil];
    TheLoginView *instance = [nib objectAtIndex:0];

    
    return instance;
}

@end

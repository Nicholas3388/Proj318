//
//  GuideView.h
//  Proj318
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GuideView : UIView<UIScrollViewDelegate>

@property (strong, nonatomic)UIScrollView *scrollView;

@property (strong, nonatomic)UIButton *startButton;

//init
- (id)initWithFrame:(CGRect)frame;

- (void)showView:(UIView *)view;

@end

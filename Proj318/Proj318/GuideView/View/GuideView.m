//
//  GuideView.m
//  Proj318
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GuideView.h"
#import "AppConfig.h"

@implementation GuideView {
    // private
    NSMutableArray *_dotsArray;
}

@synthesize scrollView;
@synthesize startButton;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createView:frame];
    }
    return self;
}

- (void)createView:(CGRect)frame {
    self.backgroundColor = [UIColor whiteColor];
    
    //scroll
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    scrollView.bounces = NO;
    [self addSubview:scrollView];
    
    _dotsArray = [[NSMutableArray alloc]init];
    
    //创建图片
    for (NSInteger i = 0; i < 4; i++) {
        UIImageView* item = [[UIImageView alloc] initWithFrame:CGRectMake(i*frame.size.width, 0, frame.size.width, frame.size.height)];
        if (isIPhone4) {
            //NSString* name = [NSString stringWithFormat:@"Default-0%ld.png",i+1];
            //item.image = [UIImage imageNamed:name];
        }else{
            NSString* name = [NSString stringWithFormat:@"LaunchImage-%ld-568h@2x.png",i+1];
            item.image = [UIImage imageNamed:name];
        }
        [scrollView addSubview:item];
        
        // create dots
        UIImageView *dotView = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth*0.5+(i-1.5)*36-8, ScreenHeight-48, 12, 12)];
        UIImage *dot = [UIImage imageNamed:@"dot"];
        dotView.image = dot;
        if (i != 0)
            dotView.alpha = 0.3;
        [_dotsArray addObject:dotView];
        [self addSubview:dotView];
    }
    
    //setContentSize
    [scrollView setContentSize:CGSizeMake(frame.size.width*4, frame.size.height)];
    
    //Start Button
    startButton = [UIButton buttonWithType:UIButtonTypeSystem];
    startButton.tintColor = [UIColor blackColor];
    startButton.layer.borderColor = [UIColor blackColor].CGColor;
    startButton.layer.cornerRadius = 4.0f;
    startButton.layer.borderWidth = 1.0f;
    startButton.clipsToBounds = YES;
    [startButton setTitle:NSLocalizedString(@"kStart", nil) forState:UIControlStateNormal];
    startButton.frame = CGRectMake(0, 0, 150, 35);
    if (isIPhone4) {
        startButton.center = CGPointMake(frame.size.width / 2.0, frame.size.height - 70);
    }else{
        startButton.center = CGPointMake(frame.size.width / 2.0, frame.size.height - 80);
    }
    [startButton addTarget:self action:@selector(onStartButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    startButton.hidden = YES;
    startButton.alpha = 0.0;
    [self addSubview:startButton];
}

#pragma mark - button handler
- (void)onStartButtonTouched:(UIButton *)button {
    [UIView animateWithDuration:0.4 animations:^{
        self.alpha = 0.0;
    } completion:^(BOOL finished){
        self.hidden = YES;
        [self removeFromSuperview];
    }];
}

#pragma mark - show view
- (void)showView:(UIView *)view {
    [view addSubview:self];
}

#pragma mark - Scroll view delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint point = scrollView.contentOffset;
    
    NSInteger page = point.x/scrollView.frame.size.width;
    
    if (page == 3) {
        [UIView animateWithDuration:0.3 animations:^(){
            startButton.hidden = NO;
            startButton.alpha = 1.0;
        } completion:^(BOOL finished){
            
        }];
    }
    else{
        [UIView animateWithDuration:0.5 animations:^(){
            startButton.alpha = 0.0;
        } completion:^(BOOL finished){
            startButton.hidden = YES;
        }];
    }
    
    for (int i=0; i<_dotsArray.count; i++) {
        UIImageView *currentDot = [_dotsArray objectAtIndex:i];
        if (i == page)
            currentDot.alpha = 1;
        else
            currentDot.alpha = 0.3;
    }
}

@end

//
//  Tools.m
//  Proj318
//
//  Created by apple on 16/3/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "Tools.h"
#import "StartViewController.h"
#import "AppDelegate.h"

@implementation Tools

+ (void)setStartViewController {
    StartViewController *svc = [[StartViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:svc];
    nav.navigationBarHidden = YES;
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    appDelegate.window.rootViewController = nav;
}

@end

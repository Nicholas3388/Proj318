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


#define MY_DESC    @"myDescription"

@implementation Tools

+ (void)setStartViewController {
    StartViewController *svc = [[StartViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:svc];
    nav.navigationBarHidden = YES;
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    appDelegate.window.rootViewController = nav;
}

+ (void)setDesc:(NSString *)desc {
    [[NSUserDefaults standardUserDefaults] setObject:desc forKey:MY_DESC];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)getDesc {
    return [[NSUserDefaults standardUserDefaults] objectForKey:MY_DESC];
}

@end

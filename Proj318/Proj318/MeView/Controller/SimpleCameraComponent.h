//
//  SimpleCameraComponent.h
//  TuSDKDemo
//
//  Created by Clear Hu on 15/4/24.
//  Copyright (c) 2015年 tusdk.com. All rights reserved.
//

#import "DemoSimpleBase.h"

@protocol SimpleCameraComponentDelegate <NSObject>

- (void)sendResult:(UIImage *)image;

@end

/**
 *  相机组件范例
 */
@interface SimpleCameraComponent : DemoSimpleBase
{
    id <SimpleCameraComponentDelegate> delegate;
}

@property(nonatomic,assign)id delegate;
@end

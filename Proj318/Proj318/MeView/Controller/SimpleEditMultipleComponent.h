//
//  SimpleEditMultipleComponent.h
//  TuSDKDemo
//
//  Created by Clear Hu on 15/4/24.
//  Copyright (c) 2015年 tusdk.com. All rights reserved.
//

#import "DemoSimpleBase.h"

@protocol SimpleEditMultipleComponentDelegate <NSObject>

- (void)sendResult:(UIImage *)image;

@end

/**
 *  多功能图片编辑组件范例
 */
@interface SimpleEditMultipleComponent : DemoSimpleBase
{
    id <SimpleEditMultipleComponentDelegate> delegate;
}
@property(nonatomic,assign)id delegate;
@end

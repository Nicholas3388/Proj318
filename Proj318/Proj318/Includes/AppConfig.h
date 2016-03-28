//
//  AppConfig.h
//  Proj318
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#ifndef AppConfig_h
#define AppConfig_h

// screen width
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

// Screen height
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

// iPhone5
#define isIPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136),[[UIScreen mainScreen] currentMode].size) : NO)
// iPhone4
#define isIPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960),[[UIScreen mainScreen] currentMode].size) : NO)

// iPhone 6p
#define isIPhone6p ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208),[[UIScreen mainScreen] currentMode].size) : NO)

#define isIPhone6 (ScreenWidth == 667.0)

#endif /* AppConfig_h */

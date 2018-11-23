//
//  UIConfig.h
//  UITableViewDemo
//
//  Created by 王成龙 on 2018/11/21.
//  Copyright © 2018 CL. All rights reserved.
//

#ifndef UIConfig_h
#define UIConfig_h

/***************************屏幕宽高*****************************/
#pragma mark -  *************  /** 屏幕宽高 */
#define SCREEN_WIDTH            ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT           ([[UIScreen mainScreen] bounds].size.height)
//屏幕大小
#define SCREENSIZE  [UIScreen mainScreen].bounds

//状态栏的高度
#define SDJTStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height

//导航栏的高度
#define SDJTNavBarHeight 44.0
//导航栏+状态栏的高度
#define SDJTNavHeight            (SDJTStatusBarHeight + SDJTNavBarHeight)

//分栏的高度
#define SDJTTabBarHeight         49
//iphoneX-SafeArea的高度
#define SDJTSafeAreaHeight  ([[UIApplication sharedApplication] statusBarFrame].size.height>20?34:0)
//分栏+iphoneX-SafeArea的高度
#define SDJTSafeAreaTabBarHeight (49+SDJTSafeAreaHeight)

//全局边距
#define SDJTMARGIN   16

//颜色 a代表透明度,1为不透明,0为透明
#define SDJTRGBAlphaColor(r,g,b,a)      [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]



#pragma mark -  *************  /** 字号 */
//加粗
#define SDJTBoldSystemFontOfSize(FONTSIZE) [UIFont systemFontOfBoldMutableSize:FONTSIZE]
//字号
//#define SDJTSystemFontOfSize(FONTSIZE)     [UIFont systemFontOfSize:FONTSIZE]
#define SDJTSystemFontOfSize(FONTSIZE)     [UIFont systemFontOfMutableSize:FONTSIZE]

#endif /* UIConfig_h */

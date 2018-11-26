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



//rgb颜色转换（16进制->10进制）
#define SDJTAlphaColorFromRGB(s,a)      [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s &0xFF00) >>8))/255.0 blue:((s &0xFF))/255.0 alpha:a]
#define SDJTColorFromRGB(s)             SDJTAlphaColorFromRGB(s,1.0)

//机构圈上部分的黑背景颜色
#define SDJTBgColorFF3A3A              SDJTColorFromRGB(0x3A3A3A)//背景色


#endif /* UIConfig_h */

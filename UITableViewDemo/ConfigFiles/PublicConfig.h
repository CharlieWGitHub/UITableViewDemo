//
//  PublicConfig.h
//  UITableViewDemo
//
//  Created by 王成龙 on 2018/11/21.
//  Copyright © 2018 CL. All rights reserved.
//

#ifndef PublicConfig_h
#define PublicConfig_h


/***************************系统版本*****************************/
//获取手机系统的版本
#define SDJTiOSSystemVersion [[[UIDevice currentDevice] systemVersion] floatValue]

//是否为iOS7及以上系统
#define SDJTiOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

//是否为iOS8及以上系统
#define SDJTiOS8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)

//是否为iOS9及以上系统
#define SDJTiOS9 ([[UIDevice currentDevice].systemVersion doubleValue] >= 9.0)

//是否为iOS10及以上系统
#define SDJTiOS10 ([[UIDevice currentDevice].systemVersion doubleValue] >= 10.0)

//是否为iOS11及以上系统
#define SDJTiOS11 ([[UIDevice currentDevice].systemVersion doubleValue] >= 11.0)

#pragma mark -  ************* /** 通知 */
/** 通知 */
#define SDJTNSNotification  [NSNotificationCenter defaultCenter]
//创建通知
#define SDJTAddNotification(selectorName,key) [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(selectorName) name:key object:nil];
//发送通知
#define SDJTSendNotification(key) [[NSNotificationCenter defaultCenter] postNotificationName:key object:self userInfo:nil];
//移除通知
#define SDJTRemoveNotification(key) [[NSNotificationCenter defaultCenter]removeObserver:self name:key object:nil];

#define SDJTkeyCancelNetNotification            @"SDJTkeyCancelNetNotification"//未联网弹框提示，取消按钮
#define SDJTkeyNetStateRefreshNotification      @"SDJTkeyNetStateRefreshNotification"//网络状态变化刷新通知


/***************************循环(强弱)引用*****************************/
#pragma mark -  ************* /** 循环(强弱)引用 */
#define WEAK_SELF       __weak typeof (self) weakSelf = self
#define STRONG_SELF     __strong typeof (self) strongSelf = weakSelf


/***************************提示*****************************/
#pragma mark -  ************* /** 提示 */
#define SDJTCheckNetTip    @"网络断开，请检查网络设置"
#define SDJTContCommentTip  @"暂不允许评论"

/***************************网络请求固定参数*****************************/
#pragma mark -  ************* /** 网络请求固定参数 */
#define SizeNum          @"10"//查询条数
/***************************log日志处理*****************************/
#pragma mark -  ************* /** log日志处理 */
#ifdef DEBUG
#define NSLog(format, ...) printf("\n[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
//发布时不要打印log
//#define NSLog(format, ...)
#else
#define NSLog(format, ...)
#endif

#pragma mark -  *************  /**设置---主窗口*/
#define SDJTKEYWINDOW   [UIApplication sharedApplication].keyWindow




#endif /* PublicConfig_h */

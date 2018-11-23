//
//  ReachabilityNetWorkUtils.h
//  PostLoan
//
//  Created by 彭昭君 on 2017/11/3.
//  Copyright © 2017年 sdjt. All rights reserved.
//

/**
 * iOS开发 ---- 一句代码调用实现网络的监测功能（基于AFNetworkReachabilityManager的封装）
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^netStateBlock) (NSInteger netState);

@interface ReachabilityNetWorkUtils : NSObject

/**
 * 网络检测，有弹框提示
 * @param block 判断结果回调
 */
+ (void)netWorkState:(netStateBlock)block;

+ (void)showWarningView;

@end

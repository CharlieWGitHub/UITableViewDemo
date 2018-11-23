//
//  MBProgressHUD+Extension.h
//  JTNetWork
//
//  Created by sdjtpzj on 2018/6/25.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Extension)

+(void)showSuccess:(NSString *)success toView:(UIView *)view;
+(void)showError:(NSString *)error toView:(UIView *)view;
+(void)showInfo:(NSString *)info toView:(UIView *)view;

+(MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;

+(void)showSuccess:(NSString *)success;
+(void)showError:(NSString *)error;
+(void)showInfo:(NSString *)info;
/**
 只显示菊花转圈圈
 */
+(MBProgressHUD *)show;
+(MBProgressHUD *)showInView:(UIView *)view;
+(MBProgressHUD *)showMessage:(NSString *)message;
//show 没有hid时不可点击
+ (MBProgressHUD *)showViewNotClick:(UIView *)view;
+(void)hideHUDForView:(UIView *)view;

/**
 隐藏转圈
 */
+(void)hideHUD;

//只显示文字
+(void)showText:(NSString *)text toView:(UIView *)view;
+(void)showText:(NSString *)text;

@end

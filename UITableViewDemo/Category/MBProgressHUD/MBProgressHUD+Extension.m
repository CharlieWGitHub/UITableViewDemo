//
//  MBProgressHUD+Extension.m
//  JTNetWork
//
//  Created by sdjtpzj on 2018/6/25.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "MBProgressHUD+Extension.h"

#define xFONT [UIFont systemFontOfSize:10]
#define BACKGROUNDCOLOR [UIColor colorWithWhite:0.f alpha:.5f]
//#define MBCOMMON_FONT  [UIFont systemFontOfMutableSize:14.0]//统一字体
#define MBCORNERRADIUS 6                          //角弧度

@implementation MBProgressHUD (Extension)
#pragma mark显示信息

+(void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view;
{
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    [self hideHUDForView:view];
    if (text.length > 8) {

        NSMutableString *newStr = [[NSMutableString alloc]initWithString:text];

        [newStr insertString:@"\n" atIndex:6];

        text = newStr;
    }
    //快速显示一个提示信息
    MBProgressHUD *hud               = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.detailsLabelText             = text;
    hud.detailsLabelFont             = [UIFont systemFontOfSize:14];
    hud.margin                       = 10;


    hud.detailsLabel.text            =  text;
    hud.detailsLabel.font            = [UIFont systemFontOfSize:14];
    hud.margin                       = 10;
    hud.bezelView.style              =  MBProgressHUDBackgroundStyleBlur;
    hud.bezelView.color              = BACKGROUNDCOLOR;
    hud.bezelView.layer.cornerRadius = MBCORNERRADIUS;
    hud.contentColor                 = [UIColor whiteColor];
    hud.backgroundView.style         = MBProgressHUDBackgroundStyleSolidColor;
    hud.backgroundView.color         = [UIColor colorWithWhite:0.f alpha:.2f];
    //设置图片
    hud.customView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@",icon]]];

    //在设置模式
    hud.mode = MBProgressHUDModeCustomView;
    // 隐藏的时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;

    //1秒后再消失
    [hud hideAnimated:YES afterDelay:1.5];

}

#pragma mark 显示错误信息

+(void)showError:(NSString *)error toView:(UIView *)view
{

    [self show:error icon:@"error.png" view:view];

}

+(void)showSuccess:(NSString *)success toView:(UIView *)view
{

    [self show:success icon:@"success.png" view:view];
}

+(void)showInfo:(NSString *)info toView:(UIView *)view
{

    [self show:info icon:@"info.png" view:view];

}

+(void)showSuccess:(NSString *)success
{
    [self showSuccess:success toView:nil];
}

+(void)showError:(NSString *)error
{

    [self showError:error toView:nil];
}

+(void)showInfo:(NSString *)info
{

    [self showInfo:info toView:nil];
}
+(MBProgressHUD *)show{
    return [self showInView:nil];
}

+(MBProgressHUD *)showInView:(UIView *)view
{
    //同一时间只允许有一个转圈圈
    [self hideHUD];
    if (!view) view = [UIApplication sharedApplication].keyWindow;

    //快速显示一个提示信息
    MBProgressHUD *hud               = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.bezelView.style              =  MBProgressHUDBackgroundStyleSolidColor;
    hud.contentColor                 = [UIColor whiteColor];
    hud.margin                       = 8;
    hud.bezelView.color              = BACKGROUNDCOLOR;
    hud.bezelView.layer.cornerRadius = MBCORNERRADIUS;
    hud.backgroundView.style         = MBProgressHUDBackgroundStyleSolidColor;
    hud.backgroundView.color         = [UIColor colorWithWhite:0.f alpha:.1f];
    hud.removeFromSuperViewOnHide    = YES;
    hud.mode                         = MBProgressHUDModeIndeterminate;
//    hud.userInteractionEnabled       = NO;
    return hud;
}

//show 没有hid时不可点击
+ (MBProgressHUD *)showViewNotClick:(UIView *)view
{
    //同一时间只允许有一个转圈圈
    [self hideHUD];
    if (!view) view = [UIApplication sharedApplication].keyWindow;
    
    //快速显示一个提示信息
    MBProgressHUD *hud               = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.bezelView.style              =  MBProgressHUDBackgroundStyleSolidColor;
    hud.contentColor                 = [UIColor whiteColor];
    hud.margin                       = 8;
    hud.bezelView.color              = BACKGROUNDCOLOR;
    hud.bezelView.layer.cornerRadius = MBCORNERRADIUS;
    hud.backgroundView.style         = MBProgressHUDBackgroundStyleSolidColor;
    hud.backgroundView.color         = [UIColor colorWithWhite:0.f alpha:.1f];
    hud.removeFromSuperViewOnHide    = YES;
    hud.mode                         = MBProgressHUDModeIndeterminate;
    hud.userInteractionEnabled = YES;
    return hud;
}

#pragma mark 显示一些信息
+(MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view
{
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    //快速显示一个提示信息
    MBProgressHUD *hud               = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text                   = message;
    hud.label.font                   = [UIFont systemFontOfSize:14];
    hud.margin                       = 10;
    hud.bezelView.style              = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color              = BACKGROUNDCOLOR;
    hud.bezelView.layer.cornerRadius = MBCORNERRADIUS;
    hud.contentColor                 = [UIColor whiteColor];
    hud.backgroundView.style         = MBProgressHUDBackgroundStyleSolidColor;
    hud.backgroundView.color         = [UIColor colorWithWhite:0.f alpha:.2f];
    hud.removeFromSuperViewOnHide    = YES;
    return hud;
}

+(MBProgressHUD *)showMessage:(NSString *)message
{
    return [self showMessage:message toView:nil];
}

+(void)hideHUDForView:(UIView *)view
{
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    [self hideHUDForView:view animated:YES];
}

+(void)hideHUD
{
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self hideHUD];
        });
    }

    [self hideHUDForView:nil];
}

#pragma mark - 只显示文本
+(void)showText:(NSString *)text toView:(UIView *)view
{
    [self hideHUD];
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    //快速显示一个提示信息
    MBProgressHUD *hud    = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.detailsLabel.text = text;
    hud.contentColor      = [UIColor whiteColor];
    hud.detailsLabel.font = [UIFont systemFontOfSize:14];
    hud.margin            = 8;
    //    hud.offset            = CGPointMake(hud.offset.x, 60);
    hud.bezelView.style   = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color   = [UIColor colorWithWhite:0.f alpha:.5f];
    hud.mode = MBProgressHUDModeText;
    hud.removeFromSuperViewOnHide = YES;
    hud.userInteractionEnabled = NO;
    //    [hud hideAnimated:YES afterDelay:1.3];
    [hud hideAnimated:YES afterDelay:2];

}

+(void)showText:(NSString *)text
{
    if (![text isEqualToString:@""]) {
        [self showText:text toView:nil];
    }
}


@end


//
//  CustomPublicHUD.h
//  PostLoan
//
//  Created by 彭昭君 on 2017/11/3.
//  Copyright © 2017年 sdjt. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CallBackBlock)(NSInteger btnIndex);

@interface CustomPublicHUD : NSObject

/**
 单个按钮的AlertView
 
 @param title 标题
 @param message 提示信息
 @param cancelTitle 取消按钮标题
 @param handler 按钮点击回调
 */
+(void)showAlertView:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle handler:(void(^)(void))handler;
/**
 显示两个按钮的AlertView
 
 @param title 标题
 @param message 提示信息
 @param cancelTitle 取消按钮标题
 @param confirmTitle 确定按钮标题
 @param cancel 取消按钮取消回调
 @param confirm 确定按钮确定回调
 */
+(void)showAlertView:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle confirmTitle:(NSString *)confirmTitle cancel:(void(^)(void))cancel confirm:(void(^)(void))confirm;
/**
 alert 弹框 UIAlertView和UIAlertController
 
 @param title 标题
 @param message 详细信息
 @param block 执行方法的回调
 @param cancelBtnTitle 取消按钮
 @param otherButtonTitles 其他按钮
 iOS8以前UIAlertView，
 以后UIAlertController
 */
+(void)showAlertTitle:(NSString *)title
              message:(NSString *)message
        callbackBlock:(CallBackBlock)block
    cancelButtonTitle:(NSString *)cancelBtnTitle
    otherButtonTitles:(NSString *)otherButtonTitles,...NS_REQUIRES_NIL_TERMINATION;


+(void)showActionSheetTitle:(NSString *)title message:(NSString *)message destructiveBtn:(NSString *)destructiveTitle cancelBtn:(NSString *)btnTitle destrusctive:(void(^)(void))destrusctive cancel:(void(^)(void))cancel;


/**
 *  任意多按键的  ActionSheet
 *
 *  @param title          标题
 *  @param message        内容
 *  @param actionTitles   按键标题数组
 *  @param handler        按键回调
 内置"取消"按键, buttonIndex 为0
 */
+ (void)showActionSheetTitle:(NSString *)title message:(NSString *)message actionTitles:(NSArray *)actionTitles handler:(void(^)(NSUInteger buttonIndex, NSString *buttonTitle))handler;

@end

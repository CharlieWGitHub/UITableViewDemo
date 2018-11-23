//
//  CustomPublicHUD.m
//  PostLoan
//
//  Created by 彭昭君 on 2017/11/3.
//  Copyright © 2017年 sdjt. All rights reserved.
//

#import "CustomPublicHUD.h"
#import "AppDelegate.h"
#import <objc/runtime.h>


@interface CustomPublicHUD ()<UIAlertViewDelegate>
@property (nonatomic, weak) id delegate;
@end

@implementation CustomPublicHUD
+(void)showAlertView:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle handler:(void (^)(void))handler
{
    WEAK_SELF;
    UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertControl addAction:[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf setKeyWindowVisible];
        if (handler) {
            handler();
        }
    }]];
//    [[self createShowViewController] presentViewController:alertControl animated:YES completion:nil];
    [SDJTKEYWINDOW.rootViewController presentViewController:alertControl animated:YES completion:nil];
}

//两个按钮
+(void)showAlertView:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle confirmTitle:(NSString *)confirmTitle cancel:(void(^)(void))cancel confirm:(void(^)(void))confirm
{
    WEAK_SELF;
    UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertControl addAction:[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf setKeyWindowVisible];
        if (cancel) {
            cancel();
        }
    }]];
    
    
    [alertControl addAction:[UIAlertAction actionWithTitle:confirmTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf setKeyWindowVisible];
        if (confirm) {
            confirm();
        }
    }]];
    
    [SDJTKEYWINDOW.rootViewController presentViewController:alertControl animated:YES completion:nil];
}

+(UIViewController *)createShowViewController
{
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [window setBackgroundColor:[UIColor clearColor]];
    UIViewController*rootViewController = [[UIViewController alloc] init];
    [[rootViewController view] setBackgroundColor:[UIColor clearColor]];
    [window makeKeyAndVisible];
    [window setRootViewController:rootViewController];
    return window.rootViewController;
}

-(UIViewController *)createShowViewController
{
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [window setBackgroundColor:[UIColor clearColor]];
    UIViewController*rootViewController = [[UIViewController alloc] init];
    [[rootViewController view] setBackgroundColor:[UIColor clearColor]];
    [window makeKeyAndVisible];
    [window setRootViewController:rootViewController];
    return window.rootViewController;
}

+(void)setKeyWindowVisible
{
    AppDelegate *appDelegate =(AppDelegate *)[UIApplication sharedApplication].delegate;
    [appDelegate.window makeKeyAndVisible];
}


/**********by pzj***********/
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
+ (void)showAlertTitle:(NSString *)title
               message:(NSString *)message
         callbackBlock:(CallBackBlock)block
     cancelButtonTitle:(NSString *)cancelBtnTitle
     otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    if (cancelBtnTitle) {
        [alertController addAction:[UIAlertAction actionWithTitle:cancelBtnTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            block(0);
        }]];
    }
    if (otherButtonTitles) {
        [alertController addAction:[UIAlertAction actionWithTitle:otherButtonTitles style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSInteger count = 1;
            
            if ([cancelBtnTitle isEmptyStr]||cancelBtnTitle == nil) {
                count = 0;
            }else{
                count = 1;
            }
            block(count);
        }]];
        
        /**下面这里是3个或3个以上按钮时**/
        va_list args;//定义一个指向个数可变的参数列表指针;
        va_start(args, otherButtonTitles);//va_start 得到第一个可变参数地址
        NSString *title = nil;
        
        int count = 2;
        if ([cancelBtnTitle isEmptyStr]||cancelBtnTitle == nil) {count = 0;}
        else{count = 1;}
        while ((title = va_arg(args, NSString *)))//指向下一个参数地址
        {
            count ++;
            UIAlertAction *otherAction = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                block(count);
            }];
            [alertController addAction:otherAction];
        }
        va_end(args);//置空指针
        
    }
//    [[self createShowViewController] presentViewController:alertController animated:YES completion:nil];
    [SDJTKEYWINDOW.rootViewController presentViewController:alertController animated:YES completion:nil];
}

+(void)showActionSheetTitle:(NSString *)title message:(NSString *)message destructiveBtn:(NSString *)destructiveTitle cancelBtn:(NSString *)btnTitle destrusctive:(void (^)(void))destrusctive cancel:(void (^)(void))cancel
{
    UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    [alertControl addAction:[UIAlertAction actionWithTitle:destructiveTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        if (destrusctive) {
            destrusctive();
        }
    }]];
    
    [alertControl addAction:[UIAlertAction actionWithTitle:btnTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancel) {
            cancel();
        }
    }]];
    [SDJTKEYWINDOW.rootViewController presentViewController:alertControl animated:YES completion:nil];
}

+(void)showActionSheetTitle:(NSString *)title message:(NSString *)message actionTitles:(NSArray *)actionTitles handler:(void (^)(NSUInteger, NSString *))handler
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        handler(0, @"取消");
    }];
    [alert addAction:cancelAction];
    
    for (int i = 0; i < actionTitles.count; i ++) {
        
        UIAlertAction *confimAction = [UIAlertAction actionWithTitle:actionTitles[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            handler((i + 1), actionTitles[i]);
        }];
        [alert addAction:confimAction];
    }
    [SDJTKEYWINDOW.rootViewController presentViewController:alert animated:YES completion:nil];
    
}

@end

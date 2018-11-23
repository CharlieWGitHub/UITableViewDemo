//
//  ReachabilityNetWorkUtils.m
//  PostLoan
//
//  Created by 彭昭君 on 2017/11/3.
//  Copyright © 2017年 sdjt. All rights reserved.
//

#import "ReachabilityNetWorkUtils.h"
#import "AFNetworkReachabilityManager.h"

@implementation ReachabilityNetWorkUtils

#pragma mark----网络检测
+(void)netWorkState:(netStateBlock)block;
{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    // 提示：要监控网络连接状态，必须要先调用单例的startMonitoring方法
    [manager startMonitoring];
    //检测的结果
    __block typeof(self) bself = self;
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status==0||status==-1) {
            //弹出提示框
            [bself showWarningView];
            //将netState值传入block中
            block(status);
        }else{
            //将netState值传入block中
            block(status);
        }
    }];
}

#pragma mark---网络断开时弹出提示框
+(void)showWarningView
{
    [CustomPublicHUD showAlertView:@"提示" message:SDJTCheckNetTip cancelTitle:@"取消" confirmTitle:@"去设置" cancel:^{
        NSLog(@"取消");
        SDJTSendNotification(SDJTkeyCancelNetNotification);
    } confirm:^{
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if( [[UIApplication sharedApplication]canOpenURL:url] ) {
            
            dispatch_after(0.2, dispatch_get_main_queue(), ^{
                if (@available(iOS 10.0, *)) {
                    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
                    }];
                } else {
                    [[UIApplication sharedApplication]openURL:url];
                }
            });
        }
    }];
}

@end

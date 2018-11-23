//
//  HttpRequestTool.h
//  PostLoan
//
//  Created by 彭昭君 on 2017/11/7.
//  Copyright © 2017年 sdjt. All rights reserved.
//

/**
 * 网络请求 公共底层
 */
#import <Foundation/Foundation.h>
#import "AFURLRequestSerialization.h"
@class AFMultipartFormData;

//请求方式
typedef NS_ENUM(NSUInteger, RequestMethod) {
    POST = 0,
    GET,
    PUT,
    PATCH,
    DELETE
};

typedef NS_ENUM (NSInteger, AFNetworkErrorType) {
    AFNetworkErrorType_Cancelled = NSURLErrorCancelled, //-999操作取消
    AFNetworkErrorType_TimedOut  = NSURLErrorTimedOut,  //-1001 请求超时
    AFNetworkErrorType_UnURL     = NSURLErrorUnsupportedURL, //-1002 不支持的url
    AFNetworkErrorType_NoNetwork = NSURLErrorNotConnectedToInternet, //-1009 断网
    AFNetworkErrorType_404Failed = NSURLErrorBadServerResponse, //-1011 404错误
    AFNetworkErrorType_ConnectToHost = NSURLErrorCannotConnectToHost,
    AFNetworkErrorType_3840Failed = 3840, //请求或返回不是纯Json格式
};

@interface HttpRequestTool : NSObject

//声明单例方法
+ (instancetype)shareInstance;

/**
 网络请求-普通的，show view ---hid view
 
 @param method 请求方式
 @param urlString 请求接口
 @param parameters 参数
 @param success 成功回调
 @param failure 失败回调
 @return NSURLSessionTask（AFNetwork 时）
 */
- (id)excuteMethod:(RequestMethod)method
               url:(NSString *)urlString
        parameters:(id)parameters
              view:(UIView *)view
           success:(void (^)(id responseObject))success
           failure:(void (^)(id,NSError *error))failure;

/**
 网络请求(文件上传)
 
 @param method 请求方式
 @param urlString 请求接口
 @param parameters 参数
 @param success 成功回调
 @param failure 失败回调
 @return NSURLSessionTask（AFNetwork 时）
 */ 
- (id)excuteUpLoadFileMethod:(RequestMethod)method
                   url:(NSString *)urlString
            parameters:(id)parameters
                  view:(UIView *)view
constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
              progress:(void (^)(NSProgress * pro))progress
               success:(void (^)(id responseObject))success
               failure:(void (^)(id responseObject,NSError *error))failure;

@end

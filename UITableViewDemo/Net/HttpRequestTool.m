//
//  HttpRequestTool.m
//  PostLoan
//
//  Created by 彭昭君 on 2017/11/7.
//  Copyright © 2017年 sdjt. All rights reserved.
//

#import "HttpRequestTool.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"

@interface HttpRequestTool ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation HttpRequestTool

//请求实例的懒加载
-(AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/javascript",@"multipart/form-data",@"application/hal+json",nil];
    }
    return _manager;
}

#pragma mark - 实现声明单例方法 GCD
+ (instancetype)shareInstance
{
    static HttpRequestTool *singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[HttpRequestTool alloc] init];
    });
    return singleton;
}

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
           failure:(void (^)(id,NSError *error))failure
{
    _manager.requestSerializer.timeoutInterval = 30.0f; //超时时间
    //header
    [self headerEncryptWithManager:_manager];
    NSDictionary *resultDict = [[NSDictionary alloc] init];
    if (parameters != nil) {
        NSDictionary *dict = [[NSDictionary alloc] init];
        if ([parameters isKindOfClass:[NSDictionary class]]) {
            dict = (NSDictionary *)parameters;
        }else{
            dict = [parameters mj_keyValues];
        }
        resultDict = dict;
        NSLog(@"HttpRequestTool - url=%@ \n dict = %@",urlString,resultDict);
//        NSString *jsonStr = [CustomLib convertToJsonData:dict];
//        resultDict = @{@"data":jsonStr};
//        NSLog(@"paramsDict =%@",resultDict);
    }else{
        NSLog(@"HttpRequestTool - url=%@",urlString);
        resultDict = nil;
    }
    switch (method) {
        case POST:
        {
            
            return [self POST:urlString parameters:resultDict view:view success:^(id responseObject) {
                if (success) {
                    success(responseObject);
                }
            } failure:^(id responseObject,NSError *error) {
                if (failure) {
                    failure(responseObject,error);
                }
            }];
        }
            break;
            
        case GET:
        {
            return [self GET:urlString parameters:resultDict view:view success:^(id responseObject) {
                if (success) {
                    success(responseObject);
                }
            } failure:^(id responseObject,NSError *error) {
                if (failure) {
                    failure(responseObject,error);
                }
            }];
        }
            break;
            
        default:{
            return [self GET:urlString parameters:resultDict view:view success:^(id responseObject) {
                if (success) {
                    success(responseObject);
                }
            } failure:^(id responseObject,NSError *error) {
                if (failure) {
                    failure(responseObject,error);
                }
            }];
        }
            break;
    }
}

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
              progress:(nullable void (^)(NSProgress * _Nonnull))progress
               success:(void (^)(id responseObject))success
               failure:(void (^)(id responseObject,NSError *error))failure
{
    _manager.requestSerializer.timeoutInterval = 45.0f;

//    NSString *token = [JTUserInfoTool shareInstance].token;
//    if (token.length >0) {
//        NSLog(@"token = %@",token);
//        NSString *authorization = [NSString stringWithFormat:@"%@%@",@"TNW ",token];
//        [_manager.requestSerializer setValue:token.length==0?@"":authorization forHTTPHeaderField:@"Authorization"];
//    }else{
//        [_manager.requestSerializer setValue:@"" forHTTPHeaderField:@"Authorization"];
//    }
    
    [self headerEncryptWithManager:_manager];
    
    NSDictionary *resultDict = [[NSDictionary alloc] init];
    if (parameters != nil) {
        NSDictionary *dict =  [parameters mj_keyValues];
        resultDict = dict;
        NSLog(@"HttpRequestTool - url=%@ \n dict = %@",urlString,dict);
//        NSString *jsonStr = [CustomLib convertToJsonData:dict];
//        resultDict = @{@"data":jsonStr};
//        NSLog(@"paramsDict =%@",resultDict);
    }
    switch (method) {
        case POST:
        {
            return [self POSTFile:urlString parameters:resultDict view:view  constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                if (block) {
                    block(formData);
                }
            } progress:^(NSProgress * _Nonnull uploadProgress) {
                if (progress) {
                    progress(uploadProgress);
                }
            } success:^(id responseObject) {
                if (success) {
                    success(responseObject);
                }
            } failure:^(id responseObject,NSError *error) {
                if (failure) {
                    failure(responseObject,error);
                }
            }];
        }
            break;
        default:{
            return nil;
        }
            break;
    }
}

#pragma mark - method -
-(NSURLSessionTask *)POST:(NSString *)URLString parameters:(id)parameters view:(UIView *)view success:(void (^)(id))success failure:(void (^)(id,NSError *))failure
{
    WEAK_SELF;
    return [self.manager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
        NSLog(@"post success--%@",responseObject);
        //后期的解析、解密、转json可以统一调这个方法
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSDictionary *resultDict = (NSDictionary *)responseObject;
            resultDict = [self dictionaryWithEncryptionDictionary:resultDict];
        
            if ([resultDict
                 .allKeys containsObject:@"message"]) {
                NSString *txnStatusMsgStr = resultDict[@"message"];
                NSLog(@"message = %@",txnStatusMsgStr);
            }
////////////////////
            if ([resultDict.allKeys containsObject:@"status"]) {
                NSString *txnStatusStr = resultDict[@"status"];
                NSInteger txnStatus = [txnStatusStr integerValue];
                
                if (txnStatus == 200){//成功，解析数据
                    
                    if (success) {
                        success(resultDict);
                    }
                    
                }else if (txnStatus == 500){//token 失效，跳转登录界面，后台说错误码500，临时先写500
                 //发送个通知，后期处理
                    if (view == nil) {
                        [MBProgressHUD hideHUD];
                    }else{
                        [MBProgressHUD hideHUDForView:view];
                    }
                    
                    NSString *txnStatusMsgStr = @"";
                    if ([resultDict
                         .allKeys containsObject:@"message"]) {
                        txnStatusMsgStr = resultDict[@"message"];
                        [MBProgressHUD showText:txnStatusMsgStr toView:view];
                    }
                    
                }else{//失败，提示失败信息
                    
                    if (view == nil) {
                        [MBProgressHUD hideHUD];
                    }else{
                        [MBProgressHUD hideHUDForView:view];
                    }
                    
                    NSString *txnStatusMsgStr = @"";
                    if ([resultDict
                         .allKeys containsObject:@"message"]) {
                        txnStatusMsgStr = resultDict[@"message"];
                        [MBProgressHUD showText:txnStatusMsgStr];
                    }
                    if (failure) {
                        failure(resultDict,nil);
                    }
                }
            
            }
////////////////////
            
        }
       
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"post failed--%@",error);
        if (view == nil) {
            [MBProgressHUD hideHUD];
        }else{
            [MBProgressHUD hideHUDForView:view];
        }
        [weakSelf requestFailed:error failure:^(id responseObject, NSError *error) {
            if (failure) {
                failure(responseObject,error);
            }
        }];
    }];
}


-(NSURLSessionTask *)POSTFile:(NSString *)URLString parameters:(id)parameters
                         view:(UIView *)view
    constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
                     progress:(nullable void (^)(NSProgress * _Nonnull))progress
                      success:(void (^)(id))success
                      failure:(void (^)(id,NSError *error))failure
{
    WEAK_SELF;
    return [self.manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        if (block) {
            block(formData);
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        if (progress) {
            progress(uploadProgress);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"post success--%@",responseObject);
        //后期的解析、解密、转json可以统一调这个方法
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSDictionary *resultDict = (NSDictionary *)responseObject;
            resultDict = [self dictionaryWithEncryptionDictionary:resultDict];
            
            if ([resultDict
                 .allKeys containsObject:@"message"]) {
                NSString *txnStatusMsgStr = resultDict[@"message"];
                NSLog(@"message = %@",txnStatusMsgStr);
            }
////////////////////
            if ([resultDict.allKeys containsObject:@"status"]) {
                NSString *txnStatusStr = resultDict[@"status"];
                NSInteger txnStatus = [txnStatusStr integerValue];

                
                if (txnStatus == 200){//成功，解析数据
                    
                    if (success) {
                        success(resultDict);
                    }
                    
                }else if (txnStatus == 500){//token 失效，跳转登录界面，后台说错误码500，临时先写500
                    //发送个通知，后期处理
                    
                    if (view == nil) {
                        [MBProgressHUD hideHUD];
                    }else{
                        [MBProgressHUD hideHUDForView:view];
                    }
                    
                    NSString *txnStatusMsgStr = @"";
                    if ([resultDict
                         .allKeys containsObject:@"message"]) {
                        txnStatusMsgStr = resultDict[@"message"];
                        [MBProgressHUD showText:txnStatusMsgStr];
                    }
                    
                }else{//失败，提示失败信息
                    
                    if (view == nil) {
                        [MBProgressHUD hideHUD];
                    }else{
                        [MBProgressHUD hideHUDForView:view];
                    }
                    
                    NSString *txnStatusMsgStr = @"";
                    if ([resultDict
                         .allKeys containsObject:@"message"]) {
                        txnStatusMsgStr = resultDict[@"message"];
                        [MBProgressHUD showText:txnStatusMsgStr];
                    }
                    if (failure) {
                        failure(resultDict,nil);
                    }
                }
                
            }
////////////////////
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"post failed--%@",error);
        if (view == nil) {
            [MBProgressHUD hideHUD];
        }else{
            [MBProgressHUD hideHUDForView:view];
        }
        [weakSelf requestFailed:error failure:^(id responseObject, NSError *error) {
            if (failure) {
                failure(responseObject,error);
            }
        }];
    }];
}

- (NSURLSessionTask *)GET:(NSString *)URLString
               parameters:(id)parameters
                  view:(UIView *)view
                  success:(void (^)(id))success
                  failure:(void (^)(id,NSError *))failure
{
    WEAK_SELF;
    return [self.manager GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"get success--%@",responseObject);
        //后期的解析、解密、转json可以统一调这个方法
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSDictionary *resultDict = (NSDictionary *)responseObject;
            resultDict = [self dictionaryWithEncryptionDictionary:resultDict];
            
            if ([resultDict
                 .allKeys containsObject:@"message"]) {
                NSString *txnStatusMsgStr = resultDict[@"message"];
                NSLog(@"message = %@",txnStatusMsgStr);
            }
            ////////////////////
            if ([resultDict.allKeys containsObject:@"status"]) {
                NSString *txnStatusStr = resultDict[@"status"];
                NSInteger txnStatus = [txnStatusStr integerValue];
                
                if (txnStatus == 200){//成功，解析数据
                    
                    if (success) {
                        success(resultDict);
                    }
                    
                }else if (txnStatus == 500){//token 失效，跳转登录界面，后台说错误码500，临时先写500
                    //发送个通知，后期处理
                    
                    if (view == nil) {
                        [MBProgressHUD hideHUD];
                    }else{
                        [MBProgressHUD hideHUDForView:view];
                    }
                    
                    NSString *txnStatusMsgStr = @"";
                    if ([resultDict
                         .allKeys containsObject:@"message"]) {
                        txnStatusMsgStr = resultDict[@"message"];
                        [MBProgressHUD showText:txnStatusMsgStr];
                    }
                    
                }else{//失败，提示失败信息
                    
                    if (view == nil) {
                        [MBProgressHUD hideHUD];
                    }else{
                        [MBProgressHUD hideHUDForView:view];
                    }
                    
                    NSString *txnStatusMsgStr = @"";
                    if ([resultDict
                         .allKeys containsObject:@"message"]) {
                        txnStatusMsgStr = resultDict[@"message"];
                        [MBProgressHUD showText:txnStatusMsgStr];
                    }
                    if (failure) {
                        failure(resultDict,nil);
                    }
                }
                
            }
            ////////////////////
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"get failed--%@",error);
        if (view == nil) {
            [MBProgressHUD hideHUD];
        }else{
            [MBProgressHUD hideHUDForView:view];
        }
        
        [weakSelf requestFailed:error failure:^(id responseObject, NSError *error) {
            if (failure) {
                failure(responseObject,error);
            }
        }];

    }];
}

-(NSDictionary *)dictionaryWithEncryptionDictionary:(NSDictionary *)dict{
    if ([dict.allKeys containsObject:@"result"]) {
        NSString *resultStr = dict[@"result"];
        NSDictionary *resultDict = [NSDictionary dictionaryWithJsonString:resultStr];
        return resultDict;
    }else{
        return dict;
    }
}

#pragma mark - 请求失败统一回调方法
- (void)requestFailed:(NSError *)error failure:(void (^)(id,NSError *))failure
{
    NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
    NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"服务器的错误原因:%@",str);
    NSDictionary *resultDict = [NSDictionary dictionaryWithJsonString:str];
    if ([resultDict.allKeys containsObject:@"status"]) {
        NSString *txnStatus = resultDict[@"status"];
        NSInteger status = [txnStatus integerValue];
       
        if (status == 500) {//token 失效，跳转登录界面，后台说错误码500，临时先写500
            //发送个通知，后期处理
            //token失效，跳转到登录界面
            /********************************/
            /**************通知跳到登录界面******************/
            /********************************/
            
            NSString *txnStatusMsgStr = @"";
            if ([resultDict
                 .allKeys containsObject:@"message"]) {
                txnStatusMsgStr = resultDict[@"message"];
                [MBProgressHUD showText:txnStatusMsgStr];
            }
            if (failure) {
                failure(resultDict,error);
            }
            return;
        }else{//失败，提示失败信息
    
            NSString *txnStatusMsgStr = @"";
            if ([resultDict
                 .allKeys containsObject:@"message"]) {
                txnStatusMsgStr = resultDict[@"message"];
                [MBProgressHUD showText:txnStatusMsgStr];
            }
            if (failure) {
                failure(resultDict,error);
            }
            return;
        }
    }

    /////// /////// /////// ///////
    switch (error.code) {
        case AFNetworkErrorType_NoNetwork:
            NSLog(@"网络连接已断开");
            [MBProgressHUD showText:@"网络连接已断开"];
            break;
        case AFNetworkErrorType_ConnectToHost:
//            NSLog(@"网络连接失败，请检查网络");
            NSLog(@"未能连接到服务器，请检查网络");
            [MBProgressHUD showText:@"未能连接到服务器，请检查网络"];
            break;
        case AFNetworkErrorType_TimedOut :
            NSLog(@"访问服务器超时，请检查网络。");
//            [MBProgressHUD showText:@"访问服务器超时，请检查网络"];
            [MBProgressHUD showText:@"访问服务器超时"];
            break;
        case AFNetworkErrorType_3840Failed :
            NSLog(@"服务器报错了，请稍后再访问。");
            [MBProgressHUD showText:@"服务器报错了，请稍后再访问"];
            break;
        case AFNetworkErrorType_Cancelled:
            NSLog(@"操作取消");
            break;
        default:
            //            NSLog(@"%ld",(long)error.code);
            //            [MBProgressHUD showText:@"操作失败，请稍候再试"];
            break;
    }
    if (failure) {
        failure(nil,error);
    }
}

- (void)cancelLastRequest
{
    NSURLSessionTask *task = [self.manager.tasks lastObject];
    [task cancel];
}

- (void)cancelAllRequest
{
    [_manager.operationQueue cancelAllOperations];
}
- (void) headerEncryptWithManager:(AFHTTPSessionManager *) mgr
{
    NSString *token = [JTUserInfoTool shareInstance].token;
    if (token.length >0) {
        NSLog(@"token = %@",token);
        NSString *authorization = [NSString stringWithFormat:@"%@%@",@"TNW ",token];
//        NSString *userid = [JTUserInfoTool shareInstance].data.userId;
        NSMutableDictionary * headerDict = [NSMutableDictionary dictionary];
        headerDict[@"Authorization"] = authorization.length==0?@"":authorization;
//        headerDict[@"id"] = userid.length==0?@"":userid;
        //后续可➕其他信息
        for (NSString * str in headerDict.allKeys) {
            [mgr.requestSerializer setValue:headerDict[str] forHTTPHeaderField:str];
            NSLog(@"%@ = %@",str,headerDict[str]);
        }
    }else{
        [mgr.requestSerializer setValue:@"" forHTTPHeaderField:@"Authorization"];
    }
    
}




@end

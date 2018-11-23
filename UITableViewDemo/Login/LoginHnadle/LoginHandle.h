//
//  LoginHandle.h
//  UITableViewDemo
//
//  Created by 王成龙 on 2018/11/23.
//  Copyright © 2018 CL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpRequestTool.h"
#import "JTUserInfoTool.h"
#import "JTParamsBaseModel.h"
#import "LoginHandle.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginHandle : NSObject

+ (NSURLSessionTask *)loadLoginHttpRequestWithParams:(JTParamsBaseModel *)params view:(UIView *)view success:(void (^)(JTUserInfoTool *infoModel))success failure:(void (^)(NSError *error))failure;

@end

NS_ASSUME_NONNULL_END

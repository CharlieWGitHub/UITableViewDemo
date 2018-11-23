//
//  LoginHandle.m
//  UITableViewDemo
//
//  Created by 王成龙 on 2018/11/23.
//  Copyright © 2018 CL. All rights reserved.
//

#import "LoginHandle.h"

@implementation LoginHandle

+ (NSURLSessionTask *)loadLoginHttpRequestWithParams:(JTParamsBaseModel *)params view:(UIView *)view success:(void (^)(JTUserInfoTool *infoModel))success failure:(void (^)(NSError *error))failure
{
    return [[HttpRequestTool shareInstance] excuteMethod:POST url:JT_Url_Login parameters:params view:view success:^(id responseObject) {
        if ([responseObject[@"status"] integerValue] == 200) {
            NSDictionary *dict=(NSDictionary*)responseObject;
            JTUserInfoTool *info = [JTUserInfoTool mj_objectWithKeyValues:dict];
            success(info);
        }
    } failure:^(id responseObject, NSError *error) {
        NSLog(@"失败的回调----");
    }];
}
@end

//
//  JTJGHandle.h
//  UITableViewDemo
//
//  Created by 王成龙 on 2018/11/25.
//  Copyright © 2018 CL. All rights reserved.
//

#import "HttpRequestTool.h"

@class CellModel;

NS_ASSUME_NONNULL_BEGIN

@interface JTJGHandle : HttpRequestTool

+ (NSURLSessionTask *)loadOrgAgencyCircleParams:(JTParamsBaseModel *)params success:(void (^)(CellModel *allDataModel))success failure:(void (^)(NSError *error))failure;

@end

NS_ASSUME_NONNULL_END

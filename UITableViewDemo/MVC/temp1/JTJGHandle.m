//
//  JTJGHandle.m
//  UITableViewDemo
//
//  Created by 王成龙 on 2018/11/25.
//  Copyright © 2018 CL. All rights reserved.
//

#import "JTJGHandle.h"

@implementation JTJGHandle

+(NSURLSessionTask *)loadOrgAgencyCircleParams:(JTParamsBaseModel*)params success:(void (^)(CellModel * allData))success failure:(void (^)(NSError * ))failure{
    return [[super shareInstance]excuteMethod:POST url:JT_Url_OrgAgencyCircle parameters:params view:nil success:^(id responseObject) {
    
    } failure:^(id responseObject, NSError *error) {
        
    }];
}
@end

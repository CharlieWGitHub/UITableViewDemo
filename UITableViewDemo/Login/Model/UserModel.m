//
//  UserModel.m
//  JTNetWork
//
//  Created by Apple on 2018/6/25.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        [self mj_decode:decoder];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder 
{
    [self mj_encode:encoder];
}

#pragma mark - Method
/**
 用户头像
 */
- (NSString *)getLuheadpicStr
{
    NSString *str = @"";
    if (self.luheadpic != nil) {
        if (![self.luheadpic isEmptyStr]) {
            str = self.luheadpic;
        }
    }
    return str;
}
/**
 用户名信息
 */
- (NSString *)getLuusernameStr
{
    NSString *str = @"";
    if (self.luusername != nil) {
        if (![self.luusername isEmptyStr]) {
            str = self.luusername;
        }
    }
    return str;
}

/**
 所在机构名字
 */
- (NSString *)getBranchNmStr
{
    NSString *str = @"";
    if (self.branchNm != nil) {
        if (![self.branchNm isEmptyStr]) {
            str = self.branchNm;
        }
    }
    return str;
}
/**
 岗位名称
 */
- (NSString *)getPositionNameStr
{
    NSString *str = @"";
    if (self.positionName != nil) {
        if (![self.positionName isEmptyStr]) {
            str = self.positionName;
        }
    }
    return str;
}
/**
 点赞数
 */
- (NSString *)getPointpraiseNoStr
{
    NSString *str = @"";
    if (self.pointpraiseNo != nil) {
        if (![self.pointpraiseNo isEmptyStr]) {
            str = self.pointpraiseNo;
        }
    }
    return str;
}
/**
 发布评论数
 */
- (NSString *)getCommentNoStr
{
    NSString *str = @"";
    if (self.commentNo != nil) {
        if (![self.commentNo isEmptyStr]) {
            str = self.commentNo;
        }
    }
    return str;
}
/**
 留言数
 */
- (NSString *)getMessageNoStr
{
    NSString *str = @"";
    if (self.messageNo != nil) {
        if (![self.messageNo isEmptyStr]) {
            str = self.messageNo;
        }
    }
    return str;
}


@end

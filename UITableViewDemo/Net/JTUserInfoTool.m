//
//  JTUserInfoTool.m
//  JTNetWork
//
//  Created by sdjtpzj on 2018/6/26.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "JTUserInfoTool.h"

#define YMAccountPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"aaa.accs"]
static id _instance = nil;

@interface JTUserInfoTool ()<NSCoding>

@end

@implementation JTUserInfoTool

//归档
MJCodingImplementation
//声明单例方法
+ (instancetype)shareInstance
{
    return [[self alloc]init];
}

+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}
- (instancetype)init {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super init];
    });
    return _instance;
}
//把数据存储到沙盒
-(void)saveUserInfoToSanbox
{
    [NSKeyedArchiver archiveRootObject:[JTUserInfoTool shareInstance] toFile:YMAccountPath];
    NSLog(@"数据存储成功");
}

//从沙盒中加载数据
-(void)loadUserInfoFromSanbox
{
    JTUserInfoTool  * userInfo = [JTUserInfoTool shareInstance];
    //网络默认是可用的
    userInfo = [NSKeyedUnarchiver unarchiveObjectWithFile:YMAccountPath];
}

//清空沙盒中token
- (void)removeTokenFromSanbox
{
    _token        = nil;
    _defaultSelectIndex   = nil;
    _isFist = nil;
    _data = nil;
    [self saveUserInfoToSanbox];
}

-(BOOL)isLogin
{
    return self.token.length;
}

- (NSInteger) getDefaultSelectIndexNum
{
//  临时默认启动后展示第num页
//    NSInteger num = 4;
//    [JTUserInfoTool shareInstance].defaultSelectIndex = num;
//    [self saveUserInfoToSanbox];
//    self.defaultSelectIndex = 2;
    return self.defaultSelectIndex;
    
}

-(BOOL)isPermissions:(NSInteger)permissions
{
    BOOL isSend = NO;
    for (NSDictionary *dic in _auths) {
        NSInteger value = [dic[@"authValue"] integerValue];
        if (value == permissions) {
            isSend = YES;
        }
    }
    return isSend;
}

//地图机构视图权限
-(BOOL)isMapOnePermissions
{
    return [self isPermissions:1];
}
//地图行员视图权限
-(BOOL)isMapTwoPermissions
{
    return [self isPermissions:3];
}
//地图客户视图权限
-(BOOL)isMapThreePermissions
{
    return [self isPermissions:2];
}
//是否可以发布活动和动态
-(BOOL)isSendDynamicOrActive
{
    return [self isPermissions:4];
}
//是否可以发送消息
-(BOOL)isSendMessage
{
    return [self isPermissions:5];
}
//机构指标维度查看
-(BOOL)isInstitutionsPermissions
{
    return [self isPermissions:6];
}
//是否允许参加活动
-(BOOL)isParticipateActive
{
   return [self isPermissions:7];
}

@end

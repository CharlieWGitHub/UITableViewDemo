//
//  JTUserInfoTool.h
//  JTNetWork
//
//  Created by sdjtpzj on 2018/6/26.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UserModel;
//@class JTSearchModel;
@interface JTUserInfoTool : NSObject

+ (instancetype)shareInstance;
/**
 selectIndex selectIndex=2,地图
 */
@property (nonatomic, assign) NSInteger defaultSelectIndex;
@property (nonatomic, assign) BOOL isFist;


/**
 *token
 */
@property (nonatomic, copy) NSString * token;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, retain) UserModel *data;

@property (nonatomic, strong) NSArray *auths;
@property (nonatomic, copy)   NSString *orgType;

//用户名
@property (nonatomic, copy) NSString *userName;
//密码
@property (nonatomic, copy) NSString *default_PASS;

/**
 搜索模型
 */
//@property (nonatomic, strong) JTSearchModel *searchModel;

@property (nonatomic ,strong) NSIndexPath* tag;

//地图机构视图权限
-(BOOL)isMapOnePermissions;
//地图行员视图权限
-(BOOL)isMapTwoPermissions;
//地图客户视图权限
-(BOOL)isMapThreePermissions;
//是否可以发布活动和动态
-(BOOL)isSendDynamicOrActive;
//是否可以发送消息
-(BOOL)isSendMessage;
//机构指标维度查看
-(BOOL)isInstitutionsPermissions;
//是否允许参加活动
-(BOOL)isParticipateActive;

/**
 *  从沙盒获取用户数据
 */
-(void)loadUserInfoFromSanbox;
/**
 *  存储用户信息到沙盒
 */
-(void)saveUserInfoToSanbox;

/**
 *  清空沙盒中数据
 */
-(void)removeTokenFromSanbox;

-(BOOL)isLogin;

- (NSInteger)getDefaultSelectIndexNum;


@end

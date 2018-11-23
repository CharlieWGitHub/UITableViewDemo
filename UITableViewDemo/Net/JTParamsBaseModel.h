//
//  JTParamsBaseModel.h
//  UITableViewDemo
//
//  Created by 王成龙 on 2018/11/23.
//  Copyright © 2018 CL. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JTParamsBaseModel : NSObject

@property (nonatomic, copy) NSString *password;//密码
@property (nonatomic, copy) NSString *principal;//用户名
@property (nonatomic, copy) NSString *country;//+86
@property (nonatomic, copy) NSString *phoneNo;//用户名
@property (nonatomic, copy) NSString *id;//用户id
@property (nonatomic, copy) NSString *vcode;       //验证码
@property (nonatomic, copy) NSString *luuserid;    //用户id
@property (nonatomic, copy) NSString *q2password;  //密码too
@property (nonatomic, copy) NSString *userSetPassWord; //旧密码
@property (nonatomic, copy) NSString *mobileCheck; //绑定新手机号
@property (nonatomic, copy) NSString *size;//分页大小
@property (nonatomic, copy) NSString *page;//页码
@property (nonatomic, copy) NSString *sort;//排序字段
@property (nonatomic, copy) NSString *activityId;//动态id
@property (nonatomic, copy) NSString *commentIf;//评论状态值
@property (nonatomic, copy) NSString *userId;//userId
@property (nonatomic, copy) NSString *otherUserId;//他人用户ID
@property (nonatomic, copy) NSString *group;//传 default
@property (nonatomic, copy) NSString *targetId; // 被留言人id
@property (nonatomic, copy) NSString *context; //留言内容
@property (nonatomic, copy) NSString *title;//检索活动标签
@property (nonatomic, copy) NSString *retrieval;//检索条件
@property (nonatomic, copy) NSString *targetBranchNo;//被点赞机构号
@property (nonatomic, copy) NSString *branchNo;//机构号
@property (nonatomic, copy) NSString *good;
@property (nonatomic, copy) NSString *dId;//动态ID
@property (nonatomic, copy) NSString *comment;//用户的评论
@property (nonatomic, copy) NSString *rankingCode;//指标编号
@property (nonatomic, copy) NSString *keyword;//检索内容
@property (nonatomic, copy) NSString *msgType;//消息类型
@property (nonatomic, copy) NSString *msgTitle;//消息标题
@property (nonatomic, copy) NSString *msgContent;//消息内容
@property (nonatomic, copy) NSString *authType;//消息发送级别
@property (nonatomic, copy) NSString *contacts;//@的人

@property (nonatomic, copy) NSString *msdId;//消息id

@property (nonatomic ,copy) NSString * keyname;//地图-客户信息列表-关键字
//@property (nonatomic ,copy) NSString * keyword;//地图-客户信息列表-关键字
//@property (nonatomic ,copy) NSString * branchNo;//地图-机构信息-机构编号
@property (nonatomic ,copy) NSString * roles;//地图-行员搜索-关键字
@property (nonatomic ,copy) NSString * activityVo;//json串，活动详情
@property (nonatomic ,copy) NSString * resources;//json串，活动资源

@property (nonatomic, copy) NSString *feedback;//意见反馈

@property (nonatomic ,copy) NSString * homepage;//首页设置
@property (nonatomic ,copy) NSString * oldpassword;//更改密码旧密码

@property (nonatomic, copy) NSString *year;//年份

@property (nonatomic, copy) NSString *firstRid;//指标榜评论所需字段
@end

NS_ASSUME_NONNULL_END

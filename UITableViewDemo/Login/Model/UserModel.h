//
//  UserModel.h
//  JTNetWork
//
//  Created by Apple on 2018/6/25.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property (nonatomic,copy) NSString * approvalStatus;
@property (nonatomic,copy) NSString * branchNm;//机构名称
@property (nonatomic,copy) NSString * branchNo;//机构号
@property (nonatomic,copy) NSString * displayName;
@property (nonatomic,copy) NSString * email;
@property (nonatomic,copy) NSString * lastPasswordFailTime;
@property (nonatomic,copy) NSString * lastPasswordResetTime;
@property (nonatomic,copy) NSString * latitude;
@property (nonatomic,copy) NSString * loginTimes;
@property (nonatomic,copy) NSString * longitude;
@property (nonatomic,copy) NSString * luactive;
@property (nonatomic,copy) NSString * lubrowserpath ;
@property (nonatomic,copy) NSString * lubrowsertype ;
@property (nonatomic,copy) NSString * lucorpid;
@property (nonatomic,copy) NSString * luenabled ;
@property (nonatomic,copy) NSString * luflag ;
@property (nonatomic,copy) NSString * lugxtime;
@property (nonatomic,copy) NSString * luheadpic;
@property (nonatomic,copy) NSString * luhomepage;//设置的首页是哪个
@property (nonatomic,copy) NSString * lulastlogip ;
@property (nonatomic,copy) NSString * lulastlogtime ;
@property (nonatomic,copy) NSString * lulogintoken ;
@property (nonatomic,copy) NSString * lumobile ;
@property (nonatomic,copy) NSString * lumodiuserid;
@property (nonatomic,copy) NSString * luoldpwd;
@property (nonatomic,copy) NSString * luorgid;
@property (nonatomic,copy) NSString * lupagerows;
@property (nonatomic,copy) NSString * luphone ;
@property (nonatomic,copy) NSString * luregtime;
@property (nonatomic,copy) NSString * lusex;
@property (nonatomic,copy) NSString * lushopseq;
@property (nonatomic,copy) NSString * luusertype;
@property (nonatomic,copy) NSString * luworkercode;
@property (nonatomic,copy) NSString * organizationId;
@property (nonatomic,copy) NSString * password;
@property (nonatomic,copy) NSString * positionId;
@property (nonatomic,copy) NSString * positionName;//岗位名称
@property (nonatomic,copy) NSString * status;
@property (nonatomic,copy) NSString * token;
@property (nonatomic, copy) NSString * updatedTt;
@property (nonatomic, copy) NSString * useLang;
@property (nonatomic, copy) NSString * userId;
@property (nonatomic, copy) NSString * userName;
@property (nonatomic, copy) NSString * orgType;

/*我的界面新增的几个字段*/
//@property (nonatomic, copy) NSString *activityDynamics;
//@property (nonatomic, copy) NSString *branchNm;//已经有了
//@property (nonatomic, copy) NSString *branchNo;//已经有了
//@property (nonatomic, copy) NSString *luheadpic;//已经有了
//@property (nonatomic, copy) NSString *luorgid;//已经有了
//@property (nonatomic, copy) NSString *positionName;//岗位名称
@property (nonatomic, copy) NSString *commentNo;//发布评论数
@property (nonatomic, copy) NSString *luuserid;//留言人
@property (nonatomic, copy) NSString *luusername;
@property (nonatomic, copy) NSString *messageNo;//留言数
@property (nonatomic, copy) NSString *pointpraiseNo;//点赞数

#pragma mark - Method
/**
 用户头像
 */
- (NSString *)getLuheadpicStr;
/**
 用户名信息/留言人
 */
- (NSString *)getLuusernameStr;
/**
 所在机构名字
 */
- (NSString *)getBranchNmStr;
/**
 岗位名称
 */
- (NSString *)getPositionNameStr;
/**
 点赞数
 */
- (NSString *)getPointpraiseNoStr;
/**
 发布评论数
 */
- (NSString *)getCommentNoStr;
/**
 留言数
 */
- (NSString *)getMessageNoStr;

@end

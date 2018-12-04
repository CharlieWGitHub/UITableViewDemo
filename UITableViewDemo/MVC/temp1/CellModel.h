//
//  CellModel.h
//  UITableViewDemo
//
//  Created by 王成龙 on 2018/11/28.
//  Copyright © 2018 CL. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CellModel : NSObject

@property (nonatomic ,copy) NSString * headImage;//头像
@property (nonatomic ,copy) NSString * bankName;//银行名称
@property (nonatomic ,copy) NSString * publishTime;//发布时间
@property (nonatomic ,copy) NSString * activityImage;//活动图片

//动态字段
@property (nonatomic ,copy) NSString * commentNo;//
@property (nonatomic ,copy) NSArray  * comments;//
@property (nonatomic ,copy) NSString * dBranchNm;//
@property (nonatomic ,copy) NSString * dBranchNo;//
@property (nonatomic ,copy) NSString * dCommentIf;//
@property (nonatomic ,copy) NSString * dContext;//
@property (nonatomic ,copy) NSString * dId;//
@property (nonatomic ,copy) NSString * dLuheadpic;//
@property (nonatomic ,copy) NSString * dLuuserdId;//
@property (nonatomic ,copy) NSString * dTxTm;//

@property (nonatomic ,copy) NSString * good;//
@property (nonatomic ,copy) NSString * pointpraiseNo;//


//活动字段
@property (nonatomic ,copy) NSString * aBranchNo;//
@property (nonatomic ,copy) NSString * aBranchaNm;//
@property (nonatomic ,copy) NSString * aContext;//
@property (nonatomic ,copy) NSString * aId;//
@property (nonatomic ,copy) NSString * aInformation;//
@property (nonatomic ,copy) NSString * aLudelete;//
@property (nonatomic ,copy) NSString * aLuuseraId;//
@property (nonatomic ,copy) NSString * aPctureadr;//
@property (nonatomic ,copy) NSString * aPersonNm;//
@property (nonatomic ,copy) NSString * aReward;//
@property (nonatomic ,copy) NSString * aSponsorNm;//

@property (nonatomic ,copy) NSString * aTitle;//
@property (nonatomic ,copy) NSString * activityJtm;//
@property (nonatomic ,copy) NSString * activityKtm;//
@property (nonatomic ,copy) NSString * activityLabel;//
@property (nonatomic ,copy) NSString * activityOb;//
@property (nonatomic ,copy) NSString * activityOther;//
@property (nonatomic ,copy) NSString * activityPe;//
@property (nonatomic ,copy) NSString * activityPlace;//
@property (nonatomic ,copy) NSString * activityTy;//
//@property (nonatomic ,copy) NSString * dTxTm;//
@property (nonatomic ,copy) NSString * type;//



@end

NS_ASSUME_NONNULL_END

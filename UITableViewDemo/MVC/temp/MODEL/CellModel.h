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

//@property (nonatomic ,copy) NSString * headImage;//头像
//@property (nonatomic ,copy) NSString * bankName;//银行名称
//@property (nonatomic ,copy) NSString * publishTime;//发布时间
//@property (nonatomic ,copy) NSString * activityImage;//活动图片

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
@property (nonatomic ,copy) NSArray  * dPictureAdr;//

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
@property (nonatomic ,copy) NSString * activityTy;//biaoqian
//@property (nonatomic ,copy) NSString * dTxTm;//
@property (nonatomic ,copy) NSString * type;//

@property (nonatomic ,assign) NSInteger showH;//计算展示的高度-文字超过限制的时候
@property (nonatomic ,assign) NSInteger closeH;//关闭的时候的高度
@property (nonatomic ,assign) NSInteger midH;//中间的布局图片的高度
@property (nonatomic ,assign) NSInteger bottomH;//下面评论的高度

@property (nonatomic ,assign) BOOL isShow;

-(NSString * _Nonnull)getDTxTm;
-(NSInteger)getContextHeight;
-(NSInteger)getShowH;
-(NSInteger)getCloseH;
-(NSInteger)getMidH;
-(NSInteger)getBottomH;

@end

NS_ASSUME_NONNULL_END

//
//  DynamicCellTableViewCell.h
//  UITableViewDemo
//
//  Created by 王成龙 on 2018/11/25.
//  Copyright © 2018 CL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellModel.h"
#import "UIImageView+YYWebImage.h"
#import "UIImage+YYWebImage.h"
NS_ASSUME_NONNULL_BEGIN
@protocol cDynamicCellDelegate <NSObject>

//分享
- (void)share;
//收缩文字
- (void)shrinkageContextWithIndexPat:(NSIndexPath*)indexPath;
//点赞
- (void)giveLike;
//评论
- (void)giveCommentary;
//删除
- (void)deleteComment;

@end

@interface DynamicCellTableViewCell : UITableViewCell

@property (nonatomic ,assign)NSInteger height;//高度
@property (nonatomic ,assign)NSInteger topViewHeight;//
@property (nonatomic ,assign)NSInteger midViewHeight;//
@property (nonatomic ,assign)NSInteger bottomViewHeight;//
/*
 * 分三部分布局
 * 1：第一部分 从头到 图片数组
 * 2：数组图片
 * 3：评论部分
 */
// --- 第一部分
@property (nonatomic ,strong) UIView * topView;//第一部分
@property (nonatomic ,strong) UIView * midView;//第二部分
@property (nonatomic ,strong) UIView * bottomView;//第三部分
@property (nonatomic ,strong) UIImageView * dLuheadpic;//headImg
@property (nonatomic ,strong) UILabel * dBranchNm;//name
@property (nonatomic ,strong) UILabel * dTxTm;//时间
@property (nonatomic ,strong) UILabel * dContext;//内容
@property (nonatomic ,strong) UIButton * isShowBtn;//展开or 收起
// --- 第二部分
//根据图片数组的个数进行布局
@property (nonatomic ,strong) NSArray *dPictureAdr;//图片数组
@property (nonatomic ,strong) UIImageView * picImg;//图片view
// ---- 第三部分
@property (nonatomic ,strong) UIView * lineView;//横线view
@property (nonatomic ,strong) UIButton *shareBtn;//分享按钮
@property (nonatomic ,strong) UIButton *pointpraiseNoBtn;//喜欢数目
@property (nonatomic ,strong) UIButton *commentNoBtn;//评论数目
// 展示在一个view上
@property (nonatomic ,strong) UIView * commentView;//评论view 包含评论人 评论 - 删除（自己发布的可以删除）
@property (nonatomic ,strong) UILabel  * commentLab;//评论
@property (nonatomic ,strong) UIButton * commentDelBtn;//删除按钮
@property (nonatomic ,strong) NSArray  * commentsArray;//动态评论数组
@property (nonatomic ,strong) UIButton * lookMoreBtn;//删除按钮


@property (nonatomic, strong) NSIndexPath * indexPath;

@property (nonatomic, weak  ) id<cDynamicCellDelegate> delegate;

- (void)setCellContentWithModel:(CellModel*)model WithIndexPat:(NSIndexPath*)indexPath;

@end

NS_ASSUME_NONNULL_END

//
//  ActivityCellTableViewCell.h
//  UITableViewDemo
//
//  Created by 王成龙 on 2018/11/25.
//  Copyright © 2018 CL. All rights reserved.
//  活动的cell

#import <UIKit/UIKit.h>
#import "CellModel.h"
#import "UIImageView+YYWebImage.h"
#import "UIImage+YYWebImage.h"
NS_ASSUME_NONNULL_BEGIN

@interface ActivityCellTableViewCell : UITableViewCell

@property (nonatomic ,strong) UIImageView * headImage;//头像
@property (nonatomic ,strong) UILabel * bankName;//银行名称
@property (nonatomic ,strong) UILabel * publishTime;//发布时间
@property (nonatomic ,strong) UIImageView * activityImage;//活动图片
@property (nonatomic ,strong) UILabel * activityName;//活动名字
@property (nonatomic ,strong) UIButton * shareButton;//分享按钮
@property (nonatomic ,strong) UIImageView * timeImg;//活动时间的按钮
@property (nonatomic ,strong) UILabel * activityTime;//活动时间
@property (nonatomic ,strong) UIImageView * addressImg;//活动地点的按钮
@property (nonatomic ,strong) UILabel * activityAddrss;//活动地点
@property (nonatomic ,strong) UIImageView * tagImg;//标签按钮
@property (nonatomic ,strong) UILabel * activityTag;//活动按钮
@property (nonatomic ,strong) UIButton * joinButton;//立即参加
//@property (nonatomic, strong) UIView * backView;//背景view
@property (nonatomic, strong) NSIndexPath * indexPath;

//mvc
- (void)setCellContentWithModel:(CellModel*)model;
@end


NS_ASSUME_NONNULL_END

//
//  HeadView.h
//  UITableViewDemo
//
//  Created by 王成龙 on 2018/11/25.
//  Copyright © 2018 CL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HeadView : UIView
@property (nonatomic ,strong)UIView * top;
@property (nonatomic ,strong)UIImageView * luheadpic;//头像图片
@property (nonatomic ,strong)UIView  * topBackView;//backview
@property (nonatomic ,strong)UILabel * branchNm;//名字
@property (nonatomic ,strong)UIView  * pointpraiseBackView;//点赞背景view
@property (nonatomic ,strong)UILabel * pointpraiseNo;//点赞数

@property (nonatomic ,strong)UILabel * activityNuLab;//发布活动数量
@property (nonatomic ,strong)UILabel * commentNoLab;//评论数量
@property (nonatomic ,strong)UILabel * dynamicNuLab;//发布文章数量
@property (nonatomic ,strong)UILabel * dContextLab;//最新动态
@property (nonatomic ,strong)UILabel * comprehensiveNu;//当前排名



- (void)headViewWithData:(id)data;

@end

NS_ASSUME_NONNULL_END

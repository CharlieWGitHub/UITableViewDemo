//
//  DynamicCellTableViewCell.m
//  UITableViewDemo
//
//  Created by 王成龙 on 2018/11/25.
//  Copyright © 2018 CL. All rights reserved.
//

#import "DynamicCellTableViewCell.h"
#import "CustomLib.h"

@implementation DynamicCellTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = [UIColor colorWithHexString:@"#F9F9F9"];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
    }
    return self;
}
- (void)drawRect:(CGRect)rect{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawPath(context, kCGPathFillStroke);
    //绘制一个矩形 （）
    float fw = SCREEN_WIDTH;
    float fh = self.bounds.size.height;
    CGContextMoveToPoint(context, fw, fh-20);  // 开始坐标右下边开始
    CGContextAddArcToPoint(context, fw, fh-10, fw-20, fh-10, 20); // 右下角角度
    CGContextAddArcToPoint(context, 0, fh-10, 0, fh-20, 20); // 左下角角度
    CGContextAddArcToPoint(context, 0, 0, fw-20, 0, 20); // 左上角
    CGContextAddArcToPoint(context, fw, 0, fw, fh-20, 20); // 右上角
    CGContextClosePath(context);
    [[UIColor whiteColor]setFill];
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextDrawPath(context, kCGPathFillStroke); //根据坐标绘制路径
}

- (void)setupUI{
      WEAK_SELF;
    [self addSubview:self.topView];
    [self addSubview:self.midView];
    [self addSubview:self.bottomView];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf);
        make.top.equalTo(weakSelf).offset(70);
        make.height.mas_equalTo(120);
    }];
    [self.midView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf);
        make.height.mas_equalTo((SCREEN_WIDTH/3+10)*3+20 );
        make.top.equalTo(weakSelf.topView.mas_bottom);
    }];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf);
        make.height.mas_equalTo(136);
        make.top.equalTo(weakSelf.midView.mas_bottom);
    }];
    
    [self addSubview:self.dLuheadpic];
    [self.dLuheadpic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(16);
        make.top.equalTo(weakSelf).offset(16);
        make.size.mas_offset(CGSizeMake(48, 48));
    }];
    //银行名字
    [self addSubview:self.dBranchNm];
    [self.dBranchNm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.dLuheadpic.mas_right).offset(10);
        make.top.equalTo(weakSelf).offset(16);
        make.right.equalTo(weakSelf);
        make.height.mas_equalTo(22);
        
    }];
    [self addSubview:self.dTxTm];
    [self.dTxTm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.dLuheadpic.mas_right).offset(10);
        make.top.equalTo(weakSelf.dBranchNm.mas_bottom).offset(5);
        make.right.equalTo(weakSelf);
        make.height.mas_equalTo(20);
    }];
//  内容
    [self.topView addSubview:self.dContext];
    [self.dContext mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.topView).with.insets(UIEdgeInsetsMake(10, 10, 25, 10));
    }];
//  展示与否
    [self.topView addSubview:self.isShowBtn];
    [self.isShowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.topView).offset(16);
        make.top.equalTo(weakSelf.dContext.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(40, 25));
    }];
//  中间布局视图
//    [self.midView addSubview:self.picImg];
//    [self.picImg mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.equalTo(weakSelf.midView).offset(10);
//        make.size.mas_equalTo(CGSizeMake((SCREEN_WIDTH-40)/3, (SCREEN_WIDTH-40)/3));
//    }];
//    下面布局
    [self.bottomView addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.bottomView).offset(5);
        make.left.equalTo(weakSelf.bottomView).offset(20);
        make.right.equalTo(weakSelf.bottomView).offset(-20);
        make.height.mas_equalTo(1);
    }];
    
//  -分享按钮- 评论 -- 点赞--
    [self.bottomView addSubview:self.shareBtn];
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.lineView.mas_bottom).offset(10);
        make.right.equalTo(weakSelf.bottomView).offset(-20);
        make.size.mas_equalTo(CGSizeMake(22, 22));
    }];
    [self.bottomView addSubview:self.commentNoBtn];
    [self.commentNoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.lineView.mas_bottom).offset(10);
        make.right.equalTo(weakSelf.shareBtn.mas_left).offset(-10);
        make.size.mas_equalTo(CGSizeMake(50, 22));
    }];
    
    [self.bottomView addSubview:self.pointpraiseNoBtn];
    [self.pointpraiseNoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.lineView.mas_bottom).offset(10);
        make.right.equalTo(weakSelf.commentNoBtn.mas_left).offset(-10);
        make.size.mas_equalTo(CGSizeMake(50, 22));
    }];

    
}
- (void)setCellContentWithModel:(CellModel*)model{
//    model.getContextHeight;
    WEAK_SELF;
    [self.dLuheadpic yy_setImageWithURL:[NSURL URLWithString:model.dLuheadpic] options:YYWebImageOptionProgressive];
    self.dBranchNm.text = model.dBranchNm;
    self.dTxTm.text  = model.getDTxTm;
    if (model.getContextHeight>120) {
        [self.topView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(weakSelf);
            make.top.equalTo(weakSelf).offset(70);
            make.height.mas_equalTo(model.getContextHeight+40);
        }];
        [self.topView setNeedsUpdateConstraints];
        [self.topView updateConstraintsIfNeeded];
        [UIView animateWithDuration:0.3 animations:^{
            [self.topView layoutIfNeeded];
        }];
        self.isShowBtn.hidden = NO;
    }
    self.dContext.text = model.dContext;
    
//  布局图片
    [self.midView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf);
        make.height.mas_equalTo(model.getMidH);
        make.top.equalTo(weakSelf.topView.mas_bottom);
    }];
    [self.midView setNeedsUpdateConstraints];
    [self.midView updateConstraintsIfNeeded];
    [UIView animateWithDuration:0.3 animations:^{
        [self.midView layoutIfNeeded];
    }];
    __block UIImageView *lastView = nil;
    // 间距为10
    int intes = 10;
    // 每行3个
    int num = 3;
    for (int i = 0; i < model.dPictureAdr.count; i++) {
        self.picImg = [UIImageView new];
        [self.picImg yy_setImageWithURL:[NSURL URLWithString:model.dPictureAdr[i]] options:YYWebImageOptionProgressive];
        [self.midView addSubview:self.picImg];        
        // 添加约束
        [self.picImg mas_makeConstraints:^(MASConstraintMaker *make) {
            // 给个高度约束
            make.height.mas_equalTo((SCREEN_WIDTH-40)/3);
            
            // 1. 判断是否存在上一个view
            if (lastView) {
                // 存在的话宽度与上一个宽度相同
                make.width.equalTo(lastView);
            } else {
                // 否则计算宽度  ！！！此处的判断条件是为了避免 最后一列约束冲突
                /**
                 *  这里可能大家会问 为什么上面我说最后一列会有冲突？
                 *  如果不添加判断的话会造成：
                 *  1添加了宽度约束 2所有列加了左侧约束 第3步给 最后一列添加了右侧约束
                 *  这里最后一列既有左侧约束又有右侧约束还有宽度约束 会造成约束冲突
                 *  所以这里添加宽度时将最后一列剔除
                 */
                if (i % num != 0) {
                make.width.mas_equalTo((self.picImg.superview.frame.size.width - (num + 1)* intes)/4);
                }
            }
            // 2. 判断是否是第一列
            if (i % num == 0) {
                // 一：是第一列时 添加左侧与父视图左侧约束
                make.left.mas_equalTo(self.picImg.superview).offset(intes);
            } else {
                // 二： 不是第一列时 添加左侧与上个view左侧约束
        
make.left.mas_equalTo(lastView.mas_right).offset(intes);
            }
            // 3. 判断是否是最后一列 给最后一列添加与父视图右边约束
            if (i % num == (num - 1)) {
                make.right.mas_equalTo(self.picImg.superview).offset(-intes);
            }
            // 4. 判断是否为第一列
            if (i / num == 0) {
                // 第一列添加顶部约束
            make.top.mas_equalTo(self.picImg.superview).offset(10);
            } else {
                // 其余添加顶部约束 intes*10 是我留出的距顶部高度
                make.top.mas_equalTo(10 + ( i / num )* ((SCREEN_WIDTH-40)/3 + intes));
            }
        }];
        // 每次循环结束 此次的View为下次约束的基准
        lastView = self.picImg;
    }
    
//  是否点赞->good  数量->pointpraiseNo
    [self.pointpraiseNoBtn setTitle:model.pointpraiseNo forState:UIControlStateNormal];
//  是否评论 数量
    [self.commentNoBtn setTitle:model.commentNo forState:UIControlStateNormal];
//  布局评论--保存到model里面最好把行高
    [self.bottomView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf);
        make.height.mas_equalTo(model.getBottomH);
        make.top.equalTo(weakSelf.midView.mas_bottom);
    }];
    [self.bottomView setNeedsUpdateConstraints];
    [self.bottomView updateConstraintsIfNeeded];
    [UIView animateWithDuration:0.3 animations:^{
        [self.bottomView layoutIfNeeded];
    }];
//  更新-高度
// - comments 评论的数组
    UIView *lastView2 = nil;
    for (int i=0; i<model.comments.count; i++) {
        self.commentView = [UIView new];
        self.commentLab = [UILabel new];
        self.commentDelBtn = [UIButton new];
        [self.bottomView addSubview:self.commentView];
        [self.commentView addSubview:self.commentLab];
        [self.commentView addSubview:self.commentDelBtn];
//        self.commentView.backgroundColor = [UIColor orangeColor];
        [self.commentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(weakSelf.bottomView);
            make.height.mas_equalTo(@(20));
            if ( lastView2 )
            {
                make.top.mas_equalTo(lastView2.mas_bottom);
            }
            else
            {
                make.top.mas_equalTo(weakSelf.bottomView).offset(50);
            }
        }];
        self.commentLab.font = [UIFont systemFontOfSize:14];
        self.commentLab.textColor = [UIColor colorWithHexString:@"#4A4A4A"];
        self.commentLab.attributedText = [CustomLib changeLabelWithColor:[NSString stringWithFormat:@"%@: %@",[model.comments[i] objectForKey:@"luusername"],[model.comments[i] objectForKey:@"context"]] colorText:[NSString stringWithFormat:@"%@",[model.comments[i]objectForKey:@"luusername"]] color:[UIColor colorWithHexString:@"#678BB5"]];
      
        [self.commentDelBtn setTitle:@"删除" forState:UIControlStateNormal];
        [self.commentDelBtn setTitleColor:[UIColor colorWithHexString:@"#678BB5"] forState:UIControlStateNormal];
        self.commentDelBtn.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size: 14];
        [self.commentDelBtn addTarget:self action:@selector(deleteCommentForRow:) forControlEvents:UIControlEventTouchUpInside];

        [self.commentLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.commentView).offset(10);
            make.right.equalTo(weakSelf.commentDelBtn.mas_left).offset(-20);
            make.height.mas_equalTo(20);
            make.top.equalTo(weakSelf.commentView);
        }];
       
        [self.commentDelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            //        make.left.equalTo(weakSelf.commentLab.mas_right).offset(10);
            make.top.equalTo(weakSelf.commentView);
            make.right.equalTo(weakSelf.commentView).offset(-10);
            make.size.mas_equalTo(CGSizeMake(40, 20));
        }];
      lastView2 = self.commentView;
    }
    if (model.comments.count>0) {
        [self.bottomView addSubview:self.lookMoreBtn];
        NSString * title = [NSString stringWithFormat:@"查看全部 %@ 条评论",model.commentNo];
        [self.lookMoreBtn setTitle:title forState:UIControlStateNormal];
//        self.lookMoreBtn .backgroundColor = [UIColor lightGrayColor];
        [self.lookMoreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.bottomView).offset(5);
            make.top.equalTo(weakSelf.commentView.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(130, 20));
        }];
    }
}
//三部分
- (UIView *)topView{
    if (_topView == nil) {
        _topView = [[UIView alloc]init];
//        _topView.backgroundColor = [UIColor colorWithHexString:@"#FF7F50"];
    }
    return _topView;
}
-(UIView *)midView{
    if (_midView == nil) {
        _midView = [[UIView alloc]init];
//        _midView.backgroundColor = [UIColor colorWithHexString:@"#6A5ACD"];
    }
    return _midView;
}
-(UIView *)bottomView{
    if (_bottomView == nil) {
        _bottomView = [[UIView alloc]init];
//        _bottomView.backgroundColor = [UIColor colorWithHexString:@"#00B2EE"];
    }
    return _bottomView;
}
- (UIButton *)lookMoreBtn{
    if (_lookMoreBtn ==nil) {
        _lookMoreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_lookMoreBtn setTitle:@"查看所有评论" forState:UIControlStateSelected];
        [_lookMoreBtn setTitleColor:[UIColor colorWithHexString:@"#678BB5"] forState:UIControlStateNormal];
        _lookMoreBtn.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size: 14];
        [_lookMoreBtn addTarget:self action:@selector(isShowBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _lookMoreBtn;
}
-(UIImageView *)dLuheadpic{
    if (_dLuheadpic == nil) {
        _dLuheadpic = [[UIImageView alloc]init];
        _dLuheadpic.layer.cornerRadius = 10;
        _dLuheadpic.layer.masksToBounds = YES;
    }
    return _dLuheadpic;
}
- (UILabel*)dBranchNm{
    if (_dBranchNm == nil) {
        _dBranchNm = [[UILabel alloc]init];
    }
    return _dBranchNm;
}
- (UILabel*)dTxTm{
    if (_dTxTm == nil) {
        _dTxTm = [[UILabel alloc]init];
        _dTxTm.textColor = [UIColor colorWithHexString:@"#678BB5"];
        _dTxTm.font = [UIFont fontWithName:@"PingFang-SC-Medium" size: 14];
    }
    return _dTxTm;
}
- (UILabel*)dContext{
    if (_dContext == nil) {
        _dContext = [[UILabel alloc]init];
        _dContext.textColor = [UIColor colorWithHexString:@"#4A4A4A"];
        _dContext.font = [UIFont fontWithName:@"PingFang-SC-Medium" size: 16];
        _dContext.numberOfLines = 0;
    }
    return _dContext;
}
-(UIButton *)isShowBtn{
    if (_isShowBtn == nil) {
        _isShowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_isShowBtn setTitle:@"展示" forState:UIControlStateNormal];
        [_isShowBtn setTitle:@"收起" forState:UIControlStateSelected];
        _isShowBtn.selected = NO;
        [_isShowBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _isShowBtn.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size: 16];
        [_isShowBtn addTarget:self action:@selector(isShowBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        _isShowBtn.hidden = YES;
    }
    return _isShowBtn;
}

//second
//- (UIImageView *)picImg{
//    if(_picImg == nil ){
//        _picImg = [[UIImageView alloc]init];
//        _picImg.image = [UIImage imageNamed:@"Rectangle"];
//        _picImg.contentMode = UIViewContentModeScaleAspectFill;
//    }
//    return _picImg;
//}
//bottom
-(UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor colorWithHexString:@"#F5F5F5"];
    }
    return _lineView;
}
//分享
-(UIButton *)shareBtn{
    if (_shareBtn==nil) {
        _shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareBtn setImage:[UIImage imageNamed:@"activityShare"] forState:UIControlStateNormal];
        [_shareBtn addTarget:self action:@selector(shareBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shareBtn;
}
//点赞
-(UIButton*)pointpraiseNoBtn{
    if (_pointpraiseNoBtn ==nil) {
        _pointpraiseNoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_pointpraiseNoBtn setImage:[UIImage imageNamed:@"Like"] forState:UIControlStateNormal];
        [_pointpraiseNoBtn setTitle:@"200" forState:UIControlStateNormal];
        _pointpraiseNoBtn.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size: 14];
        [_pointpraiseNoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_pointpraiseNoBtn addTarget:self action:@selector(pointPraiseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pointpraiseNoBtn;
}

//评论按钮
- (UIButton*)commentNoBtn{
    if (_commentNoBtn == nil) {
        _commentNoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_commentNoBtn setImage:[UIImage imageNamed:@"Comment"] forState:UIControlStateNormal];
        [_commentNoBtn setTitle:@"120" forState:UIControlStateNormal];
        _commentNoBtn.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size: 14];
        [_commentNoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_commentNoBtn addTarget:self action:@selector(pushCommentBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _commentNoBtn;
}
//评论的展示view
- (UIView*)commentView{
    if (_commentView == nil) {
        _commentView = [[UIView alloc]init];
    }
    return _commentView;
}
- (UILabel *)commentLab{
    if (_commentLab ==nil) {
        _commentLab = [[UILabel alloc]init];
        _commentLab.text = @"张三：被你迷人的明眸所吸引，干净纯洁的脸上时常有温暖的笑容";
        _commentLab.font = [UIFont fontWithName:@"PingFang-SC-Medium" size: 14];
        _commentLab.textColor = [UIColor colorWithHexString:@"#9B9B9B"];
    }
    return _commentLab;
}
- (UIButton *)commentDelBtn{
    if (_commentDelBtn == nil) {
        _commentDelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_commentDelBtn setTitle:@"删除" forState:UIControlStateNormal];
        [_commentDelBtn setTitleColor:[UIColor colorWithHexString:@"#678BB5"] forState:UIControlStateNormal];
        _commentDelBtn.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size: 14];
        [_commentDelBtn addTarget:self action:@selector(deleteCommentForRow:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _commentDelBtn;
}

//分享
- (void)shareBtnClicked:(id)sender{
    NSLog(@"分享");
    
}
//评论
- (void)pushCommentBtnClick:(id)sender{
    NSLog(@"评论");
    
}
//点赞
-(void)pointPraiseBtnClick:(id)sender{
    NSLog(@"点赞");
    
}
//删除评论
- (void)deleteCommentForRow:(id)sender{
    NSLog(@"删除");
    
}
- (void)isShowBtnClicked:(UIButton*)sender{
    // 更新约束
    self.isShowBtn.selected =! self.isShowBtn.selected;
    
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

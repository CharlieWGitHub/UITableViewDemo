//
//  DynamicCellTableViewCell.m
//  UITableViewDemo
//
//  Created by 王成龙 on 2018/11/25.
//  Copyright © 2018 CL. All rights reserved.
//

#import "DynamicCellTableViewCell.h"

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
        make.left.right.top.equalTo(weakSelf);
        make.height.mas_equalTo(200);
    }];
    [self.midView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf);
        make.height.mas_equalTo(SCREEN_WIDTH/3);
        make.top.equalTo(weakSelf.topView.mas_bottom);
    }];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf);
        make.height.mas_equalTo(136);
        make.top.equalTo(weakSelf.midView.mas_bottom);
    }];
    
    [self.topView addSubview:self.dLuheadpic];
    [self.dLuheadpic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.topView).offset(16);
        make.top.equalTo(weakSelf.topView).offset(16);
        make.size.mas_offset(CGSizeMake(48, 48));
    }];
    //银行名字
    [self.topView addSubview:self.dBranchNm];
    [self.dBranchNm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.dLuheadpic.mas_right).offset(10);
        make.top.equalTo(weakSelf.topView).offset(16);
        make.right.equalTo(weakSelf.topView);
        make.height.mas_equalTo(22);
        
    }];
    [self.topView addSubview:self.dTxTm];
    [self.dTxTm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.dLuheadpic.mas_right).offset(10);
        make.top.equalTo(weakSelf.dBranchNm.mas_bottom).offset(10);
        make.right.equalTo(weakSelf.topView);
        make.height.mas_equalTo(20);
    }];
//  内容
    [self.topView addSubview:self.dContext];
    [self.dContext mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.topView).offset(60);
        make.left.equalTo(weakSelf).offset(10);
        make.right.equalTo(weakSelf).offset(-10);
        make.height.mas_equalTo(100);
    }];
    
//  展示与否
    [self.topView addSubview:self.isShowBtn];
    [self.isShowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.topView).offset(16);
        make.top.equalTo(weakSelf.dContext.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(40, 25));
    }];
//  中间布局视图
    [self.midView addSubview:self.picImg];
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
    
//    评论view
    [self.bottomView addSubview:self.commentView];
    [self.commentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.bottomView);
        make.top.equalTo(weakSelf.lineView.mas_bottom).offset(40);
        make.height.mas_equalTo(20);
    }];
    
    [self.commentView addSubview:self.commentLab];
    [self.commentView addSubview:self.commentDelBtn];
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
        [_isShowBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _isShowBtn.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size: 16];
    }
    return _isShowBtn;
}

//second
- (UIImageView *)picImg{
    if(_picImg == nil ){
        _picImg = [[UIImageView alloc]init];
    }
    return _picImg;
}
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
    }
    return _commentDelBtn;
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

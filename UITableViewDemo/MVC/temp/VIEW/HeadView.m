//
//  HeadView.m
//  UITableViewDemo
//
//  Created by 王成龙 on 2018/11/25.
//  Copyright © 2018 CL. All rights reserved.
//

#import "HeadView.h"

@implementation HeadView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUI];
    }
    return self;
}
- (void)setUI{
    [self addSubview:self.luheadpic];
    WEAK_SELF;
    [self.luheadpic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_centerX).offset(-45);
        make.top.equalTo(weakSelf).offset(20);
        make.size.mas_equalTo(CGSizeMake(90, 90));
    }];
    
    [self addSubview:self.topBackView];
    [self.topBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.luheadpic.mas_bottom).offset(10);
        make.height.mas_equalTo(40);
        make.left.equalTo(weakSelf).offset(25);
        make.right.equalTo(weakSelf).offset(-25);
    }];
  
//  名字跟图标
    [self.topBackView addSubview:self.branchNm];
    [self.topBackView addSubview:self.pointpraiseBackView];

    [self.branchNm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
    make.right.mas_equalTo(weakSelf.pointpraiseBackView.mas_left).offset(-10);
        
    }];
    
    [self.pointpraiseBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(18);
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(weakSelf.branchNm.mas_right).offset(10);
    }];
    
//  动态点赞个数
    [self.pointpraiseBackView addSubview:self.pointpraiseNo];
    [self.pointpraiseNo mas_makeConstraints:^(MASConstraintMaker *make) {
       //向右边+5，竖直方向不变
        make.center.mas_equalTo(weakSelf.pointpraiseBackView).centerOffset(CGPointMake(5, 0));
    }];
    //排名
    [self addSubview:self.comprehensiveNu];
    [self.comprehensiveNu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.topBackView.mas_bottom).offset(5);
        make.left.equalTo(weakSelf).offset(30);
        make.right.equalTo(weakSelf).offset(-30);
        make.height.mas_equalTo(20);
    }];
    [self addSubview:self.midView];
    //中间view
    [self.midView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.comprehensiveNu.mas_bottom).offset(10);
        make.left.equalTo(weakSelf).offset(30);
//        make.right.equalTo(weakSelf).offset(30);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-60, 50));
        
    }];
    [self.midView addSubview:self.dynamicNuLab];
    [self.midView addSubview:self.activityNuLab];
    [self.midView addSubview:self.commentNoLab];
    
    [self.dynamicNuLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.midView).offset(0);
        make.right.equalTo(weakSelf.activityNuLab.mas_left).offset(0);
        make.centerY.equalTo(weakSelf.midView);
        
        /**
         *  长宽相等 注意，这里不能用 make.height.equalTo(make.width);
         */
        make.height.equalTo(weakSelf.midView.mas_height); /// 约束长度等于宽度
        make.width.equalTo(weakSelf.activityNuLab.mas_width);
        
    }];
    
    [self.activityNuLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.midView);
        make.right.equalTo(weakSelf.commentNoLab.mas_left).offset(0);
        make.height.equalTo(weakSelf.midView);
        make.width.equalTo(weakSelf.commentNoLab);
    }];
    [self.commentNoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.midView);
        make.right.equalTo(weakSelf.midView);
        make.height.equalTo(weakSelf.midView);
        make.width.equalTo(weakSelf.activityNuLab);

    }];
    
    [self addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left .equalTo(weakSelf).offset(20);
        make.right.equalTo(weakSelf).offset(-20);
        make.top.equalTo(weakSelf.midView.mas_bottom).offset(2);
        make.height.mas_equalTo(1);
    }];
//    最新动态
    [self addSubview:self.dContextLab];
    [self.dContextLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(20);
        make.right.equalTo(weakSelf).offset(-20);
        make.top.equalTo(weakSelf.lineView.mas_bottom).offset(10);
        make.height.mas_equalTo(25);
    }];
    
}

- (void)headViewWithData:(id)data{
    self.luheadpic.image = [UIImage imageNamed:@"Rectangle"];
    self.branchNm.text = @"山东省总行";
    self.pointpraiseNo.text = @"100";
    self.comprehensiveNu.text = @"当前排名 90";
    self.dynamicNuLab.text = @"发布动态\n80";
    self.activityNuLab.text = @"发布活动\n70";
    self.commentNoLab.text = @"评论\n20";
    self.dContextLab.text = @"最新评论：【青岛银行年会活动成功举办。。】";
//    self.topBackView.backgroundColor = [UIColor yellowColor];
}
-(UIView *)midView{
    if (_midView == nil) {
        _midView = [[UIView alloc]init];
//        _midView.backgroundColor = [UIColor lightGrayColor];
    }
    return _midView;
}
- (UIView*)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor colorWithHexString:@"#F7F7F7"];
    }
    return _lineView;
}
//头像
-(UIImageView *)luheadpic{
    if (_luheadpic == nil) {
        _luheadpic = [[UIImageView alloc]init];
        _luheadpic.layer.cornerRadius = 45;
        _luheadpic.layer.masksToBounds = YES;
        
    }
    return _luheadpic;
}
-(UIView *)topBackView{
    if (_topBackView == nil) {
        _topBackView = [[UIView alloc]init];
//        _topBackView.backgroundColor = [UIColor lightGrayColor];
    }
    return _topBackView;
}
//名字
-(UILabel *)branchNm{
    if (_branchNm == nil) {
        _branchNm = [[UILabel alloc]init];
        _branchNm.textAlignment = NSTextAlignmentCenter;
        _branchNm.font = [UIFont fontWithName:@"PingFangSC-Semibold" size: 24];
        _branchNm.textColor = [UIColor colorWithRed:38/255.0f green:38/255.0f blue:40/255.0f alpha:1];
    }
    return _branchNm;
}
//红心数量
-(UILabel *)pointpraiseNo{
    if (_pointpraiseNo == nil) {
        _pointpraiseNo = [[UILabel alloc]init];
        _pointpraiseNo.font = [UIFont fontWithName:@"PingFang-SC-Medium" size: 10];
        _pointpraiseNo.textColor = [UIColor whiteColor];
        
    }
    return _pointpraiseNo;
}
-(UIView*)pointpraiseBackView{
    if (_pointpraiseBackView == nil) {
        _pointpraiseBackView = [[UIView alloc]init];
        _pointpraiseBackView.layer.cornerRadius = 9;
        _pointpraiseBackView.layer.masksToBounds = YES;
        _pointpraiseBackView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Group"]];
        
    }
    return _pointpraiseBackView;
}
//当前排名
- (UILabel*)comprehensiveNu{
    if (_comprehensiveNu == nil) {
        _comprehensiveNu = [[UILabel alloc]init];
        _comprehensiveNu.font = [UIFont fontWithName:@"PingFang-SC-Medium" size: 15];
        _comprehensiveNu.textColor = [UIColor colorWithHexString:@"#4a4a4a"];
        _comprehensiveNu.textAlignment = NSTextAlignmentCenter;
    }
    return _comprehensiveNu;
}
//发布文章数量
- (UILabel*)dynamicNuLab{
    if (_dynamicNuLab == nil) {
        _dynamicNuLab = [[UILabel alloc]init];
        _dynamicNuLab.numberOfLines = 0;
        _dynamicNuLab.textAlignment = NSTextAlignmentCenter;
        _dynamicNuLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    }
    return _dynamicNuLab;
}
//发布活动数量
- (UILabel*)activityNuLab{
    if (_activityNuLab == nil) {
        _activityNuLab = [[UILabel alloc]init];
        _activityNuLab.numberOfLines = 0;
        _activityNuLab.textAlignment = NSTextAlignmentCenter;
        _activityNuLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    }
    return _activityNuLab;
}
//评论数量
- (UILabel*)commentNoLab{
    if (_commentNoLab==nil) {
        _commentNoLab = [[UILabel alloc]init];
        _commentNoLab.numberOfLines = 0;
        _commentNoLab.textAlignment = NSTextAlignmentCenter;
        _commentNoLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 12];
    }
    return _commentNoLab;
}
//最新动态
- (UILabel*)dContextLab{
    if (_dContextLab ==nil) {
        _dContextLab = [[UILabel alloc]init];
        _dContextLab.textAlignment = NSTextAlignmentCenter;
        _dContextLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 12];
    }
    return _dContextLab;
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//绘制中间的框
- (void)drawRect:(CGRect)rect {
    [[UIColor colorWithHexString:@"#F9F9F9"] setFill];
    UIRectFill(rect);
    CGContextRef context = UIGraphicsGetCurrentContext();
    /*添加弧形对象
     x:中心点x坐标
     y:中心点y坐标
     radius:半径
     startAngle:起始弧度
     endAngle:终止弧度
     closewise:是否逆时针绘制，0则顺时针绘制
     */
    CGContextAddArc(context, SCREEN_WIDTH/2, -SCREEN_WIDTH/1.5, SCREEN_WIDTH, M_PI, -M_PI, 1);
    //设置属性
    [SDJTBgColorFF3A3A setFill];
    //线条颜色
//    [[UIColor redColor]setStroke];
//  设置线条的颜色
//    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    //绘制
    CGContextDrawPath(context, kCGPathFillStroke);
    //绘制一个矩形 （）
    float fw = SCREEN_WIDTH - 16;
    float fh = 290;
    CGContextMoveToPoint(context, fw, fh-20);  // 开始坐标右下边开始
    CGContextAddArcToPoint(context, fw, fh, fw-20, fh, 10); // 右下角角度
    CGContextAddArcToPoint(context, 16, fh, 16, fh-20, 10); // 左下角角度
    CGContextAddArcToPoint(context, 16, 67, fw-20, 67, 10); // 左上角
    CGContextAddArcToPoint(context, fw, 67, fw, fh-20, 10); // 右上角
    CGContextClosePath(context);
    [[UIColor whiteColor]setFill];
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextDrawPath(context, kCGPathFillStroke); //根据坐标绘制路径
    
    /*
    //绘制头像
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Rectangle"]];
    //开始对imageView进行画图
    UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, NO, 1.0);
    //使用贝塞尔曲线画出一个圆形图
    [[UIBezierPath bezierPathWithRoundedRect:imageView.bounds cornerRadius:imageView.frame.size.width] addClip];
    [imageView drawRect:imageView.bounds];
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    //结束画图
    UIGraphicsEndImageContext();
    [imageView.image drawInRect:CGRectMake(SCREEN_WIDTH/2-45, 20, 90, 90)];
//    标题
    NSString * str = @"李沧区张学鹏支行";
    UIFont * font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
    //段落格式
    NSMutableParagraphStyle *textStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    textStyle.lineBreakMode = NSLineBreakByWordWrapping;
    textStyle.alignment = NSTextAlignmentCenter;//水平居中

    [str drawInRect:CGRectMake(20, 120, self.bounds.size.width - 40, 40) withAttributes:@{NSFontAttributeName:font,NSParagraphStyleAttributeName:textStyle}];
    */

}


@end

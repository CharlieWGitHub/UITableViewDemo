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
  
    
    [self.topBackView addSubview:self.branchNm];
    [self.topBackView addSubview:self.pointpraiseBackView];

    [self.branchNm mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(0);
        make.center.mas_equalTo(0);
    make.right.mas_equalTo(weakSelf.pointpraiseBackView.mas_left).offset(-10);
        
    }];
    
    [self.pointpraiseBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(18);
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(weakSelf.branchNm.mas_right).offset(10);
    }];
    
    /*
    [self addSubview:self.pointpraiseNo];

    //排名
    [self addSubview:self.comprehensiveNu];
    
    [self addSubview:self.dynamicNuLab];
    [self addSubview:self.activityNuLab];
    [self addSubview:self.commentNoLab];
//    最新动态
    [self addSubview:self.dContextLab];
    */
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
    }
    return _comprehensiveNu;
}
//发布文章数量
- (UILabel*)dynamicNuLab{
    if (_dynamicNuLab == nil) {
        _dynamicNuLab = [[UILabel alloc]init];
    }
    return _dynamicNuLab;
}
//发布活动数量
- (UILabel*)activityNuLab{
    if (_activityNuLab == nil) {
        _activityNuLab = [[UILabel alloc]init];
    }
    return _activityNuLab;
}
//评论数量
- (UILabel*)commentNoLab{
    if (_commentNoLab==nil) {
        _commentNoLab = [[UILabel alloc]init];
    }
    return _commentNoLab;
}
//最新动态
- (UILabel*)dContextLab{
    if (_dContextLab ==nil) {
        _dContextLab = [[UILabel alloc]init];
    }
    return _dContextLab;
}

- (void)headViewWithData:(id)data{
    self.luheadpic.image = [UIImage imageNamed:@"Rectangle"];
    self.branchNm.text = @"山东省总行";
//    self.topBackView.backgroundColor = [UIColor yellowColor];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
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

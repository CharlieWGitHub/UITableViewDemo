//
//  ActivityCellTableViewCell.m
//  UITableViewDemo
//
//  Created by 王成龙 on 2018/11/25.
//  Copyright © 2018 CL. All rights reserved.
//

#import "ActivityCellTableViewCell.h"

@implementation ActivityCellTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];

    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.top.mas_equalTo(16);
        make.size.mas_equalTo(CGSizeMake(48, 48));
    }];
    
    [self.bankName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImage.mas_right).offset(10);
        make.right.equalTo(self.contentView);
        make.top.mas_equalTo(16);
        make.height.mas_equalTo(25);
    }];
    
//。。。。
    
}
- (void)setupUI{
    
    [self.contentView addSubview:_headImage];
    [self.contentView addSubview:_bankName];
    [self.contentView addSubview:_publishTime];
    [self.contentView addSubview:_activityImage];
    [self.contentView addSubview:_activityName];
    [self.contentView addSubview:_shareButton];
    [self.contentView addSubview:_timeImg];
    [self.contentView addSubview:_activityTime];
    [self.contentView addSubview:_addressImg];
    [self.contentView addSubview:_activityAddrss];
    [self.contentView addSubview:_tagImg];
    [self.contentView addSubview:_activityTag];
    [self.contentView addSubview:_joinButton];

}
- (void)drawRect:(CGRect)rect{
   
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawPath(context, kCGPathFillStroke);
    //绘制一个矩形 （）
    float fw = SCREEN_WIDTH;
    float fh = 452;
    CGContextMoveToPoint(context, fw, fh-20);  // 开始坐标右下边开始
    CGContextAddArcToPoint(context, fw, fh, fw-20, fh, 10); // 右下角角度
    CGContextAddArcToPoint(context, 16, fh, 16, fh-20, 10); // 左下角角度
    CGContextAddArcToPoint(context, 16, 67, fw-20, 67, 10); // 左上角
    CGContextAddArcToPoint(context, fw, 67, fw, fh-20, 10); // 右上角
    CGContextClosePath(context);
    [[UIColor whiteColor]setFill];
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextDrawPath(context, kCGPathFillStroke); //根据坐标绘制路径
    
}
//- (UIView*)backView{
//    if (_backView==nil) {
//        _backView = [[UIView alloc]init];
//        _backView.backgroundColor = [UIColor whiteColor];
//    }
//    return _backView;
//}
//名字
- (UILabel *)bankName{
    if (_bankName==nil) {
        _bankName = [[UILabel alloc]init];
        _bankName.text = @"山东省总行";
        _bankName.font = [UIFont fontWithName:@"PingFang-SC-Bold" size:16];
        _bankName.textColor = [UIColor colorWithRed:74/255.0 green:74/255.0 blue:74/255.0 alpha:1.0];
    }
    return _bankName;
}
//头像
- (UIImageView *)headImage{
    if (_headImage ==nil) {
        _headImage = [[UIImageView alloc]init];
        _headImage.image = [UIImage imageNamed:@"Oval1"];
    }
    return _headImage;
}
//发布时间
-(UILabel *)publishTime{
    if (_publishTime ==nil) {
        _publishTime = [[UILabel alloc]init];
        _publishTime.text = @"2018-12-12";
        _publishTime.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];
        _publishTime.textColor = [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:1.0];
    }
    return _publishTime;
}
- (UIImageView*)activityImage{
    if (_activityImage==nil) {
        _headImage = [[UIImageView alloc]init];
        _headImage.image = [UIImage imageNamed:@""];
    }
    return _activityImage;
}
- (UILabel*)activityName{
    if (_activityName==nil) {
        _activityName = [[UILabel alloc]init];
        _activityName.text = @"牵手渡鹊桥，相会于恒丰";
        _activityName.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:18];
        _activityName.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    }
    return _activityName;
}
-(UIButton *)shareButton{
    if (_shareButton==nil) {
        _shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareButton setImage:[UIImage imageNamed:@"activityShare"] forState:UIControlStateNormal];
        [_shareButton addTarget:self action:@selector(didClickShareBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shareButton;
}
- (UIImageView *)timeImg{
    if (_timeImg ==nil) {
        _headImage = [[UIImageView alloc]init];
        _headImage.image = [UIImage imageNamed:@"activityTime"];
    }
    return _timeImg;
}
- (UILabel*)activityTime{
    if (_activityTime==nil) {
        _activityTime = [[UILabel alloc]init];
        _activityTime.text = @"2018年06月20号-2018年08月01";
        _activityTime.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];
        _activityTime.textColor = [UIColor colorWithRed:74/255.0 green:74/255.0 blue:74/255.0 alpha:1.0];
    }
    return _activityTime;
}
-(UIImageView *)addressImg{
    if (_addressImg==nil) {
        _addressImg = [[UIImageView alloc]init];
        _addressImg.image = [UIImage imageNamed:@"activityAddress"];
    }
    return _addressImg;
}
-(UILabel *)activityAddrss{
    if (_activityAddrss==nil) {
        _activityAddrss = [[UILabel alloc]init];
        _activityAddrss.text = @"青岛市市南区营业部支行";
        _activityAddrss.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];
        _activityAddrss.textColor = [UIColor colorWithRed:74/255.0 green:74/255.0 blue:74/255.0 alpha:1.0];
    }
    return _activityAddrss;
}
- (UIImageView *)tagImg{
    if (_tagImg==nil) {
        _headImage = [[UIImageView alloc]init];
        _headImage.image = [UIImage imageNamed:@"activityTag"];
    }
    return _tagImg;
}
-(UILabel *)activityTag{
    if (_activityTag==nil) {
        _activityTag = [[UILabel alloc]init];
        _activityTag.text = @"青年、开门红";
        _activityTag.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];
        _activityTag.textColor = [UIColor colorWithRed:74/255.0 green:74/255.0 blue:74/255.0 alpha:1.0];
    }
    return _activityTag;
}
- (UIButton*)joinButton{
    if (_joinButton==nil) {
        _joinButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_joinButton setTitle:@"立即参与" forState:UIControlStateNormal];
        [_joinButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_joinButton setBackgroundColor:[UIColor colorWithRed:238/255.0 green:54/255.0 blue:75/255.0 alpha:1]];
        [_joinButton addTarget:self action:@selector(didClickShareBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _joinButton;
}
//分享按钮
- (void)didClickShareBtn:(UIButton*)shareBtn{
    
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

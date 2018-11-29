//
//  ActivityCellTableViewCell.m
//  UITableViewDemo
//
//  Created by 王成龙 on 2018/11/25.
//  Copyright © 2018 CL. All rights reserved.
//

#import "ActivityCellTableViewCell.h"
#import "UIImage+UIImageFillet.h"


@implementation ActivityCellTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor colorWithHexString:@"#F9F9F9"];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
    }
    return self;
}
- (void)setupUI{
    
    [self.contentView addSubview:self.headImage];
    WEAK_SELF;
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(16);
        make.top.equalTo(weakSelf).offset(26);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    [self.contentView addSubview:self.bankName];
    [self.bankName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(16+50+20);
        make.top.equalTo(weakSelf).offset(30);
        make.size.mas_equalTo(CGSizeMake(250, 20));
    }];
 
    [self.contentView addSubview:self.publishTime];
    [self.publishTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(16+50+20);
        make.top.equalTo(weakSelf.bankName.mas_bottom).offset(5);
        make.size.mas_equalTo(CGSizeMake(250, 20));
    }];
    
    [self.contentView addSubview:self.activityImage];
    [self.activityImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(16);
        make.top.equalTo(weakSelf).offset(90);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-32, 230));
    }];
    
    [self.contentView addSubview:self.activityName];
    [self.activityName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(16);
        make.top.equalTo(weakSelf.activityImage.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-16-40,30));
    }];
   
    [self.contentView addSubview:self.shareButton];
    [self.shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf).offset(-25);
        make.top.equalTo(weakSelf.activityImage.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(25, 25));
    }];
   
    [self.contentView addSubview:self.timeImg];
    [self.timeImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.activityName.mas_bottom).offset(5);
        make.left.equalTo(weakSelf).offset(16);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
   
    [self.contentView addSubview:self.activityTime];
    [self.activityTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.activityName.mas_bottom).offset(5);
        make.left.equalTo(weakSelf.timeImg.mas_right).offset(5);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH - 60, 20));
    }];
    
    [self.contentView addSubview:self.addressImg];
    [self.addressImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.timeImg.mas_bottom).offset(10);
        make.left.equalTo(weakSelf).offset(16);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [self.contentView addSubview:self.activityAddrss];
    [self.activityAddrss mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.addressImg.mas_right).offset(5);
        make.top.equalTo(weakSelf.activityTime.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH -60, 20));
    }];
    
    [self.contentView addSubview:self.tagImg];
    [self.tagImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(16);
        make.top.equalTo(weakSelf.addressImg.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [self.contentView addSubview:self.activityTag];
    [self.activityTag mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.tagImg.mas_right).offset(5);
        make.top.equalTo(weakSelf.activityAddrss.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-60 - 100, 20));
    }];
   
    [self.contentView addSubview:self.joinButton];
    [self.joinButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf).offset(-20);
        make.top.equalTo(weakSelf.activityAddrss.mas_bottom).offset(5);
        make.size.mas_equalTo(CGSizeMake(96, 30));
    }];
    
}
- (void)drawRect:(CGRect)rect{
   
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawPath(context, kCGPathFillStroke);
    //绘制一个矩形 （）
    float fw = SCREEN_WIDTH;
    float fh = 475;
    CGContextMoveToPoint(context, fw, fh-20);  // 开始坐标右下边开始
    CGContextAddArcToPoint(context, fw, fh-10, fw-20, fh-10, 20); // 右下角角度
    CGContextAddArcToPoint(context, 0, fh-10, 0, fh-20, 20); // 左下角角度
    CGContextAddArcToPoint(context, 0, 10, fw-20, 10, 20); // 左上角
    CGContextAddArcToPoint(context, fw, 10, fw, fh-20, 20); // 右上角
    CGContextClosePath(context);
    [[UIColor whiteColor]setFill];
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextDrawPath(context, kCGPathFillStroke); //根据坐标绘制路径
}

//名字
- (UILabel *)bankName{
    if (_bankName==nil) {
        _bankName = [[UILabel alloc]init];
        _bankName.text = @"山东省总行";
        _bankName.font = [UIFont fontWithName:@"PingFang-SC-Bold" size:16];
        _bankName.textColor = [UIColor colorWithRed:74/255.0 green:74/255.0 blue:74/255.0 alpha:1.0];
//        _bankName.backgroundColor = [UIColor orangeColor];
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
//        _publishTime.backgroundColor = [UIColor orangeColor];
        _publishTime.textColor = [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:1.0];
    }
    return _publishTime;
}
//活动图片
- (UIImageView*)activityImage{
    if (_activityImage==nil) {
        _activityImage = [[UIImageView alloc]init];
        _activityImage.image = [UIImage imageNamed:@"Rectangle"];

        _activityImage.layer.cornerRadius = 16;
        _activityImage.layer.masksToBounds = true;

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
        _timeImg = [[UIImageView alloc]init];
        _timeImg.image = [UIImage imageNamed:@"activityTime"];
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
        _tagImg = [[UIImageView alloc]init];
        _tagImg.image = [UIImage imageNamed:@"activityTag"];
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

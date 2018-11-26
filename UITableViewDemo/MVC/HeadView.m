//
//  HeadView.m
//  UITableViewDemo
//
//  Created by 王成龙 on 2018/11/25.
//  Copyright © 2018 CL. All rights reserved.
//

#import "HeadView.h"

@implementation HeadView

- (void)headViewWithData:(id)data{

}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [[UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1] setFill];
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
    //绘制头像
    UIImage *image = [UIImage imageNamed:@"Rectangle"];
    [image drawInRect:CGRectMake(60, 340, 20, 20)];//在坐标中画出图片
    CGContextDrawImage(context, CGRectMake(100, 340, 20, 20), image.CGImage);//使用这个使图片上下颠倒了，参考http://blog.csdn.net/koupoo/article/details/8670024
    
    
    
    
    
}


@end

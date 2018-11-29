//
//  UIImage+UIImageFillet.m
//  UITableViewDemo
//
//  Created by 王成龙 on 2018/11/29.
//  Copyright © 2018 CL. All rights reserved.
//

#import "UIImage+UIImageFillet.h"

@implementation UIImage (UIImageFillet)

- (UIImage*)imageAddFilletWithRaius:(CGFloat)radius size:(CGSize)size{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    CGContextAddPath(ctx, path.CGPath);
    CGContextClip(ctx);
    [self drawInRect:rect];
    CGContextDrawPath(ctx, kCGPathFillStroke);
    UIImage * newImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImg;
}
@end

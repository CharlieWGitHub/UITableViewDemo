//
//  UIImage+UIImageFillet.h
//  UITableViewDemo
//
//  Created by 王成龙 on 2018/11/29.
//  Copyright © 2018 CL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (UIImageFillet)
- (UIImage *)imageAddFilletWithRaius:(CGFloat)radius size:(CGSize)size;

@end

NS_ASSUME_NONNULL_END

//
//  CellModel.m
//  UITableViewDemo
//
//  Created by 王成龙 on 2018/11/28.
//  Copyright © 2018 CL. All rights reserved.
//

#import "CellModel.h"
#import "CustomLib.h"

@implementation CellModel
- (NSString *)getDTxTm{
    NSString * str = @"";
    if (self.dTxTm !=nil) {
        str =[CustomLib getStampChangeToDate:self.dTxTm];
    }
    return str;
}
-(NSInteger)getShowH{
  
    CGFloat hei = [CustomLib measureMutilineStringHeight:self.dContext andFont:[UIFont fontWithName:@"PingFang-SC-Medium" size: 16] andWidthSetup:(SCREEN_WIDTH-20)];
    if (hei>120) {
        return hei;
    }else{
        return 120;
    }
}
//计算文字的高度
- (NSInteger)getContextHeight
{
    CGFloat hei = [CustomLib measureMutilineStringHeight:self.dContext andFont:[UIFont fontWithName:@"PingFang-SC-Medium" size: 16] andWidthSetup:(SCREEN_WIDTH-20)];
    return hei;
}
/*
 * 120 高度 内容大于120 的时候
 1：关闭的时候 「超过120 高度就等与 120」「不足的120 就展示原本高度」
 2：展开的时候 「关闭=120 」「展开就是原本高度」
 高度小于120 的时候
 展示高度
 */
-(NSInteger)getCloseH{
    return 120;
}
-(NSInteger)getMidH{
    if (self.dPictureAdr.count>0) {
        NSInteger cellRH = ((self.dPictureAdr.count - 1)/3 + 1) * (SCREEN_WIDTH-40)/3;
        return cellRH + 40;
    }else{
        return 10;
    }
}
-(NSInteger)getBottomH{
    if (self.comments.count >0) {
//        动态条数 * 25 + 最后一条的高度
        NSInteger bottomH = self.comments.count * 25 + 30 +42;
        return bottomH;
    }else{
        return 60;
        
    }
}

@end

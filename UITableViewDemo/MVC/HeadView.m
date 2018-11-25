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

    self.top = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
    self.top.backgroundColor = [UIColor orangeColor];
    [self addSubview:self.top];
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//
//}


@end

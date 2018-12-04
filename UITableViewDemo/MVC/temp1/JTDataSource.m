
//
//  JTDataSource.m
//  UITableViewDemo
//
//  Created by 王成龙 on 2018/11/27.
//  Copyright © 2018 CL. All rights reserved.
//

#import "JTDataSource.h"

@implementation JTDataSource

- (id)initWithIdentifier:(NSString *)identifier configureBlock:(CellConfigureBefore)before {
    if(self = [super init]) {
        _cellIdentifier = identifier;
        _cellConfigureBefore = [before copy];
    }
    return self;
}
- (void)addDataArray:(NSArray *)datas{
    if(!datas) return;
    if (self.dataArray.count>0) {
        [self.dataArray removeAllObjects];
    }
    [self.dataArray addObjectsFromArray:datas];
}
- (id)modelsAtIndexPath:(NSIndexPath *)indexPath {
    return self.dataArray.count > indexPath.row ? self.dataArray[indexPath.row] : nil;
}
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return !self.dataArray ? 0: self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    id model = [self modelsAtIndexPath:indexPath];
    if(self.cellConfigureBefore) {
        self.cellConfigureBefore(cell, model,indexPath);
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//  预设高度
    return 480;
}
-(NSMutableArray *)dataArray
{
    if (_dataArray ==nil) {
        _dataArray = [NSMutableArray arrayWithCapacity:0];
    }return _dataArray;
}


//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    //设置Cell的动画效果为3D效果
//    //设置x和y的初始值为0.1；
////    cell.layer.transform = CATransform3DMakeScale(0.6, 0.6, 1);
////    //x和y的最终值为1
////    [UIView animateWithDuration:0.5 animations:^{
////        cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
////    }];
//
////    ***********************  向左边插入  //
////    图层一旦创建，你就可以通过矩阵变换来改变一个图层的几何形状。CATransform3D的数据结构定义一个同质的三维变换（4×4 CGFloat值的矩阵），用于图层的旋转，缩放，偏移，歪斜和应用的透视。
//
////    CATransform3D translation;  //变换矩阵
////    translation = CATransform3DMakeTranslation(150, 0, 0);  //变换函数
////    //    tx：X轴偏移位置，往下为正数。
////    //    ty：Y轴偏移位置，往右为正数。
////    //    tz：Z轴偏移位置，往外为正数。
////    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
////    cell.layer.shadowOffset = CGSizeMake(10, 10);
////    cell.alpha = 0;
////    cell.layer.transform = translation;
////    [UIView beginAnimations:@"translation" context:NULL]; //标记动画块开始
////    [UIView setAnimationDuration:0.7];
////    cell.layer.transform = CATransform3DIdentity;//CATransform3DIdentity是单位矩阵，该矩阵没有缩放、旋转、歪斜、透视。把该矩阵应用到图层上面，会把图层几何属性修改为默认值。
////    cell.alpha = 1;
////    cell.layer.shadowOffset = CGSizeMake(0, 0);
////    [UIView commitAnimations]; //标记动画块结束
//
//
/////****************由小变大
//    CATransform3D transform = CATransform3DIdentity;
//    transform = CATransform3DRotate(transform, 0, 0, 0, 1);//渐变
//    transform = CATransform3DTranslate(transform, -100, 0, 0);//左边水平移动
//    transform = CATransform3DScale(transform, 0, 0, 0);//由小变大
//    cell.layer.transform = transform;
//    cell.layer.opacity = 0.0;
//    [UIView animateWithDuration:0.6 animations:^{
//        cell.layer.transform = CATransform3DIdentity;
//        cell.layer.opacity = 1;
//
//    }];
//
//}
@end

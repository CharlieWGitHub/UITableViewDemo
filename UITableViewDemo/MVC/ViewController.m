//
//  ViewController.m
//  UITableViewDemo
//
//  Created by 王成龙 on 2018/11/14.
//  Copyright © 2018 CL. All rights reserved.
//

#import "ViewController.h"
#import "JTJGHandle.h"
#import "DynamicCellTableViewCell.h"
#import "ActivityCellTableViewCell.h"
#import "HeadView.h"

static NSString * const ACTIVITYCELL = @"activityCell";//活动
static NSString * const DYNAMICCELL = @"dynamicCell";//动态
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView * myTab;
@property (nonatomic, assign)NSInteger pageNum;
@property (nonatomic, strong)HeadView * headView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.pageNum = 0;
//    [self loadData];
    [self.view addSubview:self.myTab];


    self.headView = [self.headView initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
    [self.headView headViewWithData:@{}];
    _myTab.tableHeaderView = self.headView;

    // Do any additional setup after loading the view, typically from a nib.
}
- (void)loadData{

    JTParamsBaseModel *params = [[JTParamsBaseModel alloc] init];
    params.size = SizeNum;
    params.page = [NSString stringWithFormat:@"%ld",(long)self.pageNum];
    params.sort = @"tx_tm";
    params.id = [JTUserInfoTool shareInstance].data.userId;
//    if (self.titleStr.length>0) {
//        params.title = self.titleStr;
//    }
//    if (self.retrieval.length>0) {
//        params.retrieval = self.retrieval;
//    }
    [JTJGHandle loadOrgAgencyCircleParams:params success:^(CellModel * _Nonnull allDataModel) {
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
    
}
//- (void)myTable{
//
//        _myTab = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
//        _myTab.delegate = self;
//        _myTab.dataSource = self;

//        [self.view addSubview:_myTab];
//
//}
-(UITableView *)myTab{
    if (!_myTab) {
        _myTab = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _myTab.delegate = self;
        _myTab.dataSource = self;
                _myTab.estimatedRowHeight = 0;
                _myTab.estimatedSectionFooterHeight = 0;
                _myTab.estimatedSectionHeaderHeight = 0;
//        [_myTab registerClass:[DynamicCellTableViewCell class] forCellReuseIdentifier:DYNAMICCELL];
//        [_myTab registerClass:[ActivityCellTableViewCell class] forCellReuseIdentifier:ACTIVITYCELL];
    }
    return _myTab;
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
//    NSLog(@"cellForSec=%ld cellRows=%ld",(long)indexPath.section,(long)indexPath.row);

    static NSString * iden = @"iden";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = [NSString stringWithFormat:@"我是第%ld个",(long)indexPath.row];
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    NSLog(@"**********************");
    return 3;
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    NSLog(@"______________________");
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"heightForSec=%ld ForRows=%ld",(long)indexPath.section,(long)indexPath.row);
    if (indexPath.section ==0) {
        return 70;
    }else if (indexPath.section ==1){
        return 50;
    }
    return 44;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"您选择的是=第%ld组 第%ld行",(long)indexPath.section,(long)indexPath.row);
//刷新整个section
    //    NSIndexSet *set = [[NSIndexSet alloc]initWithIndex:indexPath.section];
//    [self.myTab reloadSections:set withRowAnimation:UITableViewRowAnimationFade];
//当前所要刷新的cell
    NSIndexPath *indexPathTemp = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
    NSArray <NSIndexPath *> *indexPathArray = @[indexPathTemp];
    [tableView reloadRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationAutomatic];

    //    [self.myTab reloadData];
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //设置Cell的动画效果为3D效果
    //设置x和y的初始值为0.1；
//    cell.layer.transform = CATransform3DMakeScale(0.6, 0.6, 1);
//    //x和y的最终值为1
//    [UIView animateWithDuration:0.5 animations:^{
//        cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
//    }];
    
//    ***********************  向左边插入  //
//    图层一旦创建，你就可以通过矩阵变换来改变一个图层的几何形状。CATransform3D的数据结构定义一个同质的三维变换（4×4 CGFloat值的矩阵），用于图层的旋转，缩放，偏移，歪斜和应用的透视。

//    CATransform3D translation;  //变换矩阵
//    translation = CATransform3DMakeTranslation(150, 0, 0);  //变换函数
//    //    tx：X轴偏移位置，往下为正数。
//    //    ty：Y轴偏移位置，往右为正数。
//    //    tz：Z轴偏移位置，往外为正数。
//    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
//    cell.layer.shadowOffset = CGSizeMake(10, 10);
//    cell.alpha = 0;
//    cell.layer.transform = translation;
//    [UIView beginAnimations:@"translation" context:NULL]; //标记动画块开始
//    [UIView setAnimationDuration:0.7];
//    cell.layer.transform = CATransform3DIdentity;//CATransform3DIdentity是单位矩阵，该矩阵没有缩放、旋转、歪斜、透视。把该矩阵应用到图层上面，会把图层几何属性修改为默认值。
//    cell.alpha = 1;
//    cell.layer.shadowOffset = CGSizeMake(0, 0);
//    [UIView commitAnimations]; //标记动画块结束
    
    
///****************由小变大
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DRotate(transform, 0, 0, 0, 1);//渐变
    transform = CATransform3DTranslate(transform, -100, 0, 0);//左边水平移动
    transform = CATransform3DScale(transform, 0, 0, 0);//由小变大
    cell.layer.transform = transform;
    cell.layer.opacity = 0.0;
    [UIView animateWithDuration:0.6 animations:^{
        cell.layer.transform = CATransform3DIdentity;
        cell.layer.opacity = 1;
        
    }];

}



@end

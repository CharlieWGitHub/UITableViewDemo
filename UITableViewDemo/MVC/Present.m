//
//  Present.m
//  UITableViewDemo
//
//  Created by 王成龙 on 2018/11/28.
//  Copyright © 2018 CL. All rights reserved.
//

#import "Present.h"
#import "CellModel.h"

@implementation Present
- (instancetype)init{
    if (self = [super init]) {
        [self loadData];
    }
    return self;
}
-(NSMutableArray *)dataArray{
    if (_dataArray==nil) {
        _dataArray = [NSMutableArray arrayWithCapacity:0 ];
    }
    return _dataArray;
}
- (void)loadData{
    
    NSArray *temArray =
    @[
      @{@"bankName":@"Hank",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"Rectangle"},
      @{@"bankName":@"Cooci",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"Rectangle"},
      @{@"bankName":@"Kody",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"Rectangle"},
     
      @{@"bankName":@"小雁子",@"headImage":@"Oval1",@"publishTime":@"59",@"activityImage":@"Rectangle"},
      @{@"bankName":@"Lina",@"headImage":@"Oval1",@"publishTime":@"49",@"activityImage":@"Rectangle"}];
//    for (int i = 0; i<temArray.count; i++) {
//        CellModel *m = [CellModel mj_objectWithKeyValues:temArray[i]];
//        [self.dataArray addObject:m];
//    }
    self.dataArray = [NSMutableArray arrayWithArray:[CellModel mj_objectArrayWithKeyValuesArray:temArray]];
}
@end

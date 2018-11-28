
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
    NSLog(@"===%@",self.dataArray);
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
    return 452;

}
-(NSMutableArray *)dataArray
{
    if (_dataArray ==nil) {
        _dataArray = [NSMutableArray arrayWithCapacity:0  ];
    }return _dataArray;
}


@end

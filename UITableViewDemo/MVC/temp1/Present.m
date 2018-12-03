//
//  Present.m
//  UITableViewDemo
//
//  Created by 王成龙 on 2018/11/28.
//  Copyright © 2018 CL. All rights reserved.
//

#import "Present.h"
#import "CellModel.h"
#import "JTJGHandle.h"

@implementation Present
{
    NSInteger pageNum;
}
- (instancetype)init{
    if (self = [super init]) {
        [self loadData];
        pageNum = 0;
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

    JTParamsBaseModel *params = [[JTParamsBaseModel alloc] init];
    params.size = SizeNum;
    params.page = [NSString stringWithFormat:@"%ld",(long)self->pageNum];
    params.sort = @"tx_tm";
    params.id = [JTUserInfoTool shareInstance].data.userId;
    //    if (self.titleStr.length>0) {
    params.title = @"";
    //    }
    //    if (self.retrieval.length>0) {
    params.retrieval = @"";
    //    }
    [JTJGHandle loadOrgAgencyCircleParams:params success:^(CellModel * _Nonnull allDataModel) {
        
    } failure:^(NSError * _Nonnull error) {
   
    }];
    
}





@end

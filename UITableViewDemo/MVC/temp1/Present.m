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
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataArray;
}

- (void)loadData{
    
    NSArray * activityDynamics = @[
  @{
      @"type":@"Dynamic",
      @"pointpraiseNo":@"2",
      @"good":@"1",
      @"dTxTm":@"1543821703000",
      @"dPictureAdr":@[@"https://img2.woyaogexing.com/2018/11/17/e331f58066c74aeb87f49e01fa6e9817!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/15224e46911348b3ac51bcc0c2fe5988!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/961bb159dae847698907c12368500e82!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/be075b12e5244c868796bef070cfe484!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/9a3579d1558f416db643ef58de8caffa!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/81818c9ba02948c79eafa49e74337617!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/16/480032466db54a7bbaa14e654dfa2a0c!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/16/fa2c549de378405d9220bc5c36c806fd!400x400.jpeg"],
      @"dLuuserdId":@"ZM001",
      @"dLuheadpic":@"",
      @"dId":@"174",
      @"dContext":@"Masonry源码链接：Masonry,如果你项目使用Swift，建议你使用SnapKit",
      @"dContacts":@"@importMasonry.h",
      @"dCommentIf":@"0",
      @"dBranchNo":@"820181203",
      @"dBranchNm":@"如何使用Masonry",
      @"commentNo":@"2",
      @"comments":@[@{
                        @"activityId":@"",
                        @"branchNm":@"建议你使用SnapKit",
                        @"branchNo":@"810000000",
                        @"context":@"使用前导入Masonry库",
                        @"dynamicId":@"174",
                        @"id":@"284",
                        @"ludelete":@"1",
                        @"luheadpic":@"",
                        @"luuserid":@"sd001",
                        @"luusername":@"sd001",
                        @"orgCode":@"0",
                        @"positionId":@"0",
                        @"targetUser":@"810000000",
                        @"targetUserId":@"",
                        @"title":@"",
                        @"txTm":@"1543902541"
                        },@{
                        @"activityId":@"",
                        @"branchNm":@"Masonry如何约束宽高相等",
                        @"branchNo":@"810000000",
                        @"context":@"使用前导入Masonry库",
                        @"dynamicId":@"174",
                        @"id":@"284",
                        @"ludelete":@"1",
                        @"luheadpic":@"",
                        @"luuserid":@"sd001",
                        @"luusername":@"sd001",
                        @"orgCode":@"0",
                        @"positionId":@"0",
                        @"targetUser":@"810000000",
                        @"targetUserId":@"",
                        @"title":@"",
                        @"txTm":@"1543902541"
                        }]
      },
  @{
      @"aBranchNo":@"980000000",
      @"aBranchaNm":@"山东省总行",
      @"aContext":@"交通银行还款日期都是什么",
      @"aId": @"187",
      @"aInformation":@"18866552233",
      @"aLudelete":@"0",
      @"aLuuseraId" :@"ZH001",
      @"aPctureadr":@"http://39.98.73.11:9090/oms/upload/default/2018/11-29/ef38ccf2e01a4733b6b358177a867fbe.jpg",
      @"aPersonNm":@"周润发",
      @"aReward":@"一等奖海信新风系统二等奖小米电动车三等奖家居四件套",
      @"aSponsorNm":@"青岛银行市南支行",
      @"aTitle":@"企业年会",
      @"activityJtm" :@"1514649600000",
      @"activityKtm":@"1514476800000",
      @"activityLabel":@"其他,开门红,团建活动,理财,讲座",
      @"activityOb":@"青岛银行员工",
      @"activityOther" : @"187",
      @"activityPe" :@"200人以上",
      @"activityPlace":@"青岛银行市南支行大礼堂",
      @"activityTy":@"文体娱乐",
//      @"dLuheadpic":@"http://39.98.73.11:9090/oms/upload/orgpic/2018/11-26/20181126140744001-ZH.png",
      @"dTxTm":@"1543456317000",
      @"type":@"Activity",
      },
  @{
      @"type":@"Dynamic",
      @"pointpraiseNo":@"2",
      @"good":@"1",
      @"dTxTm":@"1543821703000",
      @"dPictureAdr":@[@"https://img2.woyaogexing.com/2018/11/17/e331f58066c74aeb87f49e01fa6e9817!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/15224e46911348b3ac51bcc0c2fe5988!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/961bb159dae847698907c12368500e82!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/be075b12e5244c868796bef070cfe484!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/9a3579d1558f416db643ef58de8caffa!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/81818c9ba02948c79eafa49e74337617!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/16/480032466db54a7bbaa14e654dfa2a0c!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/16/fa2c549de378405d9220bc5c36c806fd!400x400.jpeg"],
      @"dLuuserdId":@"ZM001",
      @"dLuheadpic":@"",
      @"dId":@"174",
      @"dContext":@"Masonry源码链接：Masonry,如果你项目使用Swift，建议你使用SnapKit",
      @"dContacts":@"@importMasonry.h",
      @"dCommentIf":@"0",
      @"dBranchNo":@"820181203",
      @"dBranchNm":@"如何使用Masonry",
      @"commentNo":@"2",
      @"comments":@[@{
                        @"activityId":@"",
                        @"branchNm":@"建议你使用SnapKit",
                        @"branchNo":@"810000000",
                        @"context":@"使用前导入Masonry库",
                        @"dynamicId":@"174",
                        @"id":@"284",
                        @"ludelete":@"1",
                        @"luheadpic":@"",
                        @"luuserid":@"sd001",
                        @"luusername":@"sd001",
                        @"orgCode":@"0",
                        @"positionId":@"0",
                        @"targetUser":@"810000000",
                        @"targetUserId":@"",
                        @"title":@"",
                        @"txTm":@"1543902541"
                        },@{
                        @"activityId":@"",
                        @"branchNm":@"Masonry如何约束宽高相等",
                        @"branchNo":@"810000000",
                        @"context":@"使用前导入Masonry库",
                        @"dynamicId":@"174",
                        @"id":@"284",
                        @"ludelete":@"1",
                        @"luheadpic":@"",
                        @"luuserid":@"sd001",
                        @"luusername":@"sd001",
                        @"orgCode":@"0",
                        @"positionId":@"0",
                        @"targetUser":@"810000000",
                        @"targetUserId":@"",
                        @"title":@"",
                        @"txTm":@"1543902541"
                        }]
      },
  @{
      @"aBranchNo":@"980000000",
      @"aBranchaNm":@"山东省总行",
      @"aContext":@"交通银行还款日期都是什么",
      @"aId": @"187",
      @"aInformation":@"18866552233",
      @"aLudelete":@"0",
      @"aLuuseraId" :@"ZH001",
      @"aPctureadr":@"http://39.98.73.11:9090/oms/upload/default/2018/11-29/ef38ccf2e01a4733b6b358177a867fbe.jpg",
      @"aPersonNm":@"周润发",
      @"aReward":@"一等奖海信新风系统二等奖小米电动车三等奖家居四件套",
      @"aSponsorNm":@"青岛银行市南支行",
      @"aTitle":@"企业年会",
      @"activityJtm" :@"1514649600000",
      @"activityKtm":@"1514476800000",
      @"activityLabel":@"其他,开门红,团建活动,理财,讲座",
      @"activityOb":@"青岛银行员工",
      @"activityOther" : @"187",
      @"activityPe" :@"200人以上",
      @"activityPlace":@"青岛银行市南支行大礼堂",
      @"activityTy":@"文体娱乐",
      //      @"dLuheadpic":@"http://39.98.73.11:9090/oms/upload/orgpic/2018/11-26/20181126140744001-ZH.png",
      @"dTxTm":@"1543456317000",
      @"type":@"Activity",
      }
  ];
    
    self.dataArray = [NSMutableArray arrayWithArray:[CellModel mj_objectArrayWithKeyValuesArray:activityDynamics]];
//    [self.dataSource addDataArray:self.dataArray];
    
/*
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
  */
    
}





@end

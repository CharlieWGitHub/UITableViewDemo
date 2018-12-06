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
#import "JTDataSource.h"
#import "Present.h"
#import "CellModel.h"
#import "UIImageView+WebCache.h"


static NSString * const ACTIVITYCELL = @"activityCell";//活动
static NSString * const DYNAMICCELL = @"dynamicCell";//动态
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView * myTab;
@property (nonatomic, assign)NSInteger pageNum;
@property (nonatomic, strong)HeadView * headView;
//@property (nonatomic ,strong)JTDataSource *dataSource;
//@property (nonatomic, strong)Present * pt;
@property (nonatomic ,strong) NSMutableArray * dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.pageNum = 0;
    [self.view addSubview:self.myTab];
    [self creatSometing];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)creatSometing{
    self.myTab.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    self.myTab.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}
- (void)loadNewData{
    
    NSArray * activityDynamics = @[
                                   @{
                                       @"type":@"Dynamic",
                                       @"pointpraiseNo":@"2",
                                       @"good":@"1",
                                       @"dTxTm":@"1543821703000",
                                       @"dPictureAdr":@[@"https://img2.woyaogexing.com/2018/11/17/e331f58066c74aeb87f49e01fa6e9817!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/15224e46911348b3ac51bcc0c2fe5988!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/961bb159dae847698907c12368500e82!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/be075b12e5244c868796bef070cfe484!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/9a3579d1558f416db643ef58de8caffa!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/81818c9ba02948c79eafa49e74337617!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/16/480032466db54a7bbaa14e654dfa2a0c!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/16/fa2c549de378405d9220bc5c36c806fd!400x400.jpeg"],
                                       @"dLuuserdId":@"ZM001",
                                       @"dLuheadpic":@"https://img2.woyaogexing.com/2018/11/16/fa2c549de378405d9220bc5c36c806fd!400x400.jpeg",
                                       @"dId":@"174",
                                       @"dContext":@"Masonry源码链接：Masonry,如果你项目使用Swift，建议你使用SnapKit张首晟自20世纪90年代以来一直担任斯坦福大学物理系教授。他是世界上第一个被实验结果证实其拓扑绝缘体理论预言的学者。他的团队提出的“量子自旋霍尔效应”被《科学》杂志评为2007年“全球十大重要科学突破”之一。2012年，张首晟曾在中国科协年会开幕式上作特邀报告《创新在中国》（清华大学校报《新清华》刊登过他的讲座录音记录）。张首晟是杨振宁的学生。在那次报告里，他说：“杨先生的建树是我们这些后辈望尘莫及的，那我们到底能不能实现青出于蓝而胜出蓝呢？我是非常有信心的。今后20年、30年，我的学生肯定会超过他的学生。",
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
                                       @"aPctureadr":@"https://img2.woyaogexing.com/2018/11/16/fa2c549de378405d9220bc5c36c806fd!400x400.jpeg",
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
                                        @"dLuheadpic":@"https://img2.woyaogexing.com/2018/11/17/81818c9ba02948c79eafa49e74337617!400x400.jpeg",
                                       @"dTxTm":@"1543456317000",
                                       @"type":@"Activity",
                                       },
                                   @{
                                       @"type":@"Dynamic",
                                       @"pointpraiseNo":@"2",
                                       @"good":@"1",
                                       @"dTxTm":@"1543821703000",
                                       @"dPictureAdr":@[@"https://img2.woyaogexing.com/2018/11/17/9a3579d1558f416db643ef58de8caffa!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/81818c9ba02948c79eafa49e74337617!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/16/480032466db54a7bbaa14e654dfa2a0c!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/16/fa2c549de378405d9220bc5c36c806fd!400x400.jpeg"],
                                       @"dLuuserdId":@"ZM001",
                                       @"dLuheadpic":@"https://img2.woyaogexing.com/2018/11/16/480032466db54a7bbaa14e654dfa2a0c!400x400.jpeg",
                                       @"dId":@"174",
                                       @"dContext":@"Masonry源码链接：Masonry,如果你项目使用Swift，建议你使用SnapKit",
                                       @"dContacts":@"@importMasonry.h",
                                       @"dCommentIf":@"0",
                                       @"dBranchNo":@"820181203",
                                       @"dBranchNm":@"如何使用Masonry",
                                       @"commentNo":@"2",
                                       @"comments":@[]
                                       },
                                   @{
                                       @"aBranchNo":@"980000000",
                                       @"aBranchaNm":@"山东省总行",
                                       @"aContext":@"交通银行还款日期都是什么",
                                       @"aId": @"187",
                                       @"aInformation":@"18866552233",
                                       @"aLudelete":@"0",
                                       @"aLuuseraId" :@"ZH001",
                                       @"aPctureadr":@"https://img2.woyaogexing.com/2018/11/16/fa2c549de378405d9220bc5c36c806fd!400x400.jpeg",
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
                                    
                                       @"dLuheadpic":@"https://img2.woyaogexing.com/2018/11/16/fa2c549de378405d9220bc5c36c806fd!400x400.jpeg",
                                       @"dTxTm":@"1543456317000",
                                       @"type":@"Activity",
                                       }
                                   ,@{
                                       @"type":@"Dynamic",
                                       @"pointpraiseNo":@"2",
                                       @"good":@"1",
                                       @"dTxTm":@"1543821703000",
                                       @"dPictureAdr":@[@"https://img2.woyaogexing.com/2018/11/17/e331f58066c74aeb87f49e01fa6e9817!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/15224e46911348b3ac51bcc0c2fe5988!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/961bb159dae847698907c12368500e82!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/be075b12e5244c868796bef070cfe484!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/9a3579d1558f416db643ef58de8caffa!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/81818c9ba02948c79eafa49e74337617!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/16/480032466db54a7bbaa14e654dfa2a0c!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/16/fa2c549de378405d9220bc5c36c806fd!400x400.jpeg"],
                                       @"dLuuserdId":@"ZM001",
                                       @"dLuheadpic":@"https://img2.woyaogexing.com/2018/11/16/fa2c549de378405d9220bc5c36c806fd!400x400.jpeg",
                                       @"dId":@"174",
                                       @"dContext":@"Masonry源码链接：Masonry,如果你项目使用Swift，建议你使用SnapKit张首晟自20世纪90年代以来一直担任斯坦福大学物理系教授。他是世界上第一个被实验结果证实其拓扑绝缘体理论预言的学者。他的团队提出的“量子自旋霍尔效应”被《科学》杂志评为2007年“全球十大重要科学突破”之一。2012年，张首晟曾在中国科协年会开幕式上作特邀报告《创新在中国》（清华大学校报《新清华》刊登过他的讲座录音记录）。张首晟是杨振宁的学生。在那次报告里，他说：“杨先生的建树是我们这些后辈望尘莫及的，那我们到底能不能实现青出于蓝而胜出蓝呢？我是非常有信心的。今后20年、30年，我的学生肯定会超过他的学生。",
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
                                       @"aPctureadr":@"https://img2.woyaogexing.com/2018/11/16/fa2c549de378405d9220bc5c36c806fd!400x400.jpeg",
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
                                       @"dLuheadpic":@"https://img2.woyaogexing.com/2018/11/17/81818c9ba02948c79eafa49e74337617!400x400.jpeg",
                                       @"dTxTm":@"1543456317000",
                                       @"type":@"Activity",
                                       },
                                   @{
                                       @"type":@"Dynamic",
                                       @"pointpraiseNo":@"2",
                                       @"good":@"1",
                                       @"dTxTm":@"1543821703000",
                                       @"dPictureAdr":@[@"https://img2.woyaogexing.com/2018/11/17/9a3579d1558f416db643ef58de8caffa!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/81818c9ba02948c79eafa49e74337617!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/16/480032466db54a7bbaa14e654dfa2a0c!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/16/fa2c549de378405d9220bc5c36c806fd!400x400.jpeg"],
                                       @"dLuuserdId":@"ZM001",
                                       @"dLuheadpic":@"https://img2.woyaogexing.com/2018/11/16/480032466db54a7bbaa14e654dfa2a0c!400x400.jpeg",
                                       @"dId":@"174",
                                       @"dContext":@"Masonry源码链接：Masonry,如果你项目使用Swift，建议你使用SnapKit",
                                       @"dContacts":@"@importMasonry.h",
                                       @"dCommentIf":@"0",
                                       @"dBranchNo":@"820181203",
                                       @"dBranchNm":@"如何使用Masonry",
                                       @"commentNo":@"2",
                                       @"comments":@[]
                                       },
                                   @{
                                       @"aBranchNo":@"980000000",
                                       @"aBranchaNm":@"山东省总行",
                                       @"aContext":@"交通银行还款日期都是什么",
                                       @"aId": @"187",
                                       @"aInformation":@"18866552233",
                                       @"aLudelete":@"0",
                                       @"aLuuseraId" :@"ZH001",
                                       @"aPctureadr":@"https://img2.woyaogexing.com/2018/11/16/fa2c549de378405d9220bc5c36c806fd!400x400.jpeg",
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
                                       
                                       @"dLuheadpic":@"https://img2.woyaogexing.com/2018/11/16/fa2c549de378405d9220bc5c36c806fd!400x400.jpeg",
                                       @"dTxTm":@"1543456317000",
                                       @"type":@"Activity",
                                       },@{
                                       @"type":@"Dynamic",
                                       @"pointpraiseNo":@"2",
                                       @"good":@"1",
                                       @"dTxTm":@"1543821703000",
                                       @"dPictureAdr":@[@"https://img2.woyaogexing.com/2018/11/17/e331f58066c74aeb87f49e01fa6e9817!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/15224e46911348b3ac51bcc0c2fe5988!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/961bb159dae847698907c12368500e82!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/be075b12e5244c868796bef070cfe484!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/9a3579d1558f416db643ef58de8caffa!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/81818c9ba02948c79eafa49e74337617!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/16/480032466db54a7bbaa14e654dfa2a0c!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/16/fa2c549de378405d9220bc5c36c806fd!400x400.jpeg"],
                                       @"dLuuserdId":@"ZM001",
                                       @"dLuheadpic":@"https://img2.woyaogexing.com/2018/11/16/fa2c549de378405d9220bc5c36c806fd!400x400.jpeg",
                                       @"dId":@"174",
                                       @"dContext":@"Masonry源码链接：Masonry,如果你项目使用Swift，建议你使用SnapKit张首晟自20世纪90年代以来一直担任斯坦福大学物理系教授。他是世界上第一个被实验结果证实其拓扑绝缘体理论预言的学者。他的团队提出的“量子自旋霍尔效应”被《科学》杂志评为2007年“全球十大重要科学突破”之一。2012年，张首晟曾在中国科协年会开幕式上作特邀报告《创新在中国》（清华大学校报《新清华》刊登过他的讲座录音记录）。张首晟是杨振宁的学生。在那次报告里，他说：“杨先生的建树是我们这些后辈望尘莫及的，那我们到底能不能实现青出于蓝而胜出蓝呢？我是非常有信心的。今后20年、30年，我的学生肯定会超过他的学生。",
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
                                       @"aPctureadr":@"https://img2.woyaogexing.com/2018/11/16/fa2c549de378405d9220bc5c36c806fd!400x400.jpeg",
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
                                       @"dLuheadpic":@"https://img2.woyaogexing.com/2018/11/17/81818c9ba02948c79eafa49e74337617!400x400.jpeg",
                                       @"dTxTm":@"1543456317000",
                                       @"type":@"Activity",
                                       },
                                   @{
                                       @"type":@"Dynamic",
                                       @"pointpraiseNo":@"2",
                                       @"good":@"1",
                                       @"dTxTm":@"1543821703000",
                                       @"dPictureAdr":@[@"https://img2.woyaogexing.com/2018/11/17/9a3579d1558f416db643ef58de8caffa!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/81818c9ba02948c79eafa49e74337617!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/16/480032466db54a7bbaa14e654dfa2a0c!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/16/fa2c549de378405d9220bc5c36c806fd!400x400.jpeg"],
                                       @"dLuuserdId":@"ZM001",
                                       @"dLuheadpic":@"https://img2.woyaogexing.com/2018/11/16/480032466db54a7bbaa14e654dfa2a0c!400x400.jpeg",
                                       @"dId":@"174",
                                       @"dContext":@"Masonry源码链接：Masonry,如果你项目使用Swift，建议你使用SnapKit",
                                       @"dContacts":@"@importMasonry.h",
                                       @"dCommentIf":@"0",
                                       @"dBranchNo":@"820181203",
                                       @"dBranchNm":@"如何使用Masonry",
                                       @"commentNo":@"2",
                                       @"comments":@[]
                                       },
                                   @{
                                       @"aBranchNo":@"980000000",
                                       @"aBranchaNm":@"山东省总行",
                                       @"aContext":@"交通银行还款日期都是什么",
                                       @"aId": @"187",
                                       @"aInformation":@"18866552233",
                                       @"aLudelete":@"0",
                                       @"aLuuseraId" :@"ZH001",
                                       @"aPctureadr":@"https://img2.woyaogexing.com/2018/11/16/fa2c549de378405d9220bc5c36c806fd!400x400.jpeg",
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
                                       
                                       @"dLuheadpic":@"https://img2.woyaogexing.com/2018/11/16/fa2c549de378405d9220bc5c36c806fd!400x400.jpeg",
                                       @"dTxTm":@"1543456317000",
                                       @"type":@"Activity",
                                       },@{
                                       @"type":@"Dynamic",
                                       @"pointpraiseNo":@"2",
                                       @"good":@"1",
                                       @"dTxTm":@"1543821703000",
                                       @"dPictureAdr":@[@"https://img2.woyaogexing.com/2018/11/17/e331f58066c74aeb87f49e01fa6e9817!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/15224e46911348b3ac51bcc0c2fe5988!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/961bb159dae847698907c12368500e82!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/be075b12e5244c868796bef070cfe484!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/9a3579d1558f416db643ef58de8caffa!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/81818c9ba02948c79eafa49e74337617!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/16/480032466db54a7bbaa14e654dfa2a0c!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/16/fa2c549de378405d9220bc5c36c806fd!400x400.jpeg"],
                                       @"dLuuserdId":@"ZM001",
                                       @"dLuheadpic":@"https://img2.woyaogexing.com/2018/11/16/fa2c549de378405d9220bc5c36c806fd!400x400.jpeg",
                                       @"dId":@"174",
                                       @"dContext":@"Masonry源码链接：Masonry,如果你项目使用Swift，建议你使用SnapKit张首晟自20世纪90年代以来一直担任斯坦福大学物理系教授。他是世界上第一个被实验结果证实其拓扑绝缘体理论预言的学者。他的团队提出的“量子自旋霍尔效应”被《科学》杂志评为2007年“全球十大重要科学突破”之一。2012年，张首晟曾在中国科协年会开幕式上作特邀报告《创新在中国》（清华大学校报《新清华》刊登过他的讲座录音记录）。张首晟是杨振宁的学生。在那次报告里，他说：“杨先生的建树是我们这些后辈望尘莫及的，那我们到底能不能实现青出于蓝而胜出蓝呢？我是非常有信心的。今后20年、30年，我的学生肯定会超过他的学生。",
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
                                       @"aPctureadr":@"https://img2.woyaogexing.com/2018/11/16/fa2c549de378405d9220bc5c36c806fd!400x400.jpeg",
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
                                       @"dLuheadpic":@"https://img2.woyaogexing.com/2018/11/17/81818c9ba02948c79eafa49e74337617!400x400.jpeg",
                                       @"dTxTm":@"1543456317000",
                                       @"type":@"Activity",
                                       },
                                   @{
                                       @"type":@"Dynamic",
                                       @"pointpraiseNo":@"2",
                                       @"good":@"1",
                                       @"dTxTm":@"1543821703000",
                                       @"dPictureAdr":@[@"https://img2.woyaogexing.com/2018/11/17/9a3579d1558f416db643ef58de8caffa!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/17/81818c9ba02948c79eafa49e74337617!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/16/480032466db54a7bbaa14e654dfa2a0c!400x400.jpeg",@"https://img2.woyaogexing.com/2018/11/16/fa2c549de378405d9220bc5c36c806fd!400x400.jpeg"],
                                       @"dLuuserdId":@"ZM001",
                                       @"dLuheadpic":@"https://img2.woyaogexing.com/2018/11/16/480032466db54a7bbaa14e654dfa2a0c!400x400.jpeg",
                                       @"dId":@"174",
                                       @"dContext":@"Masonry源码链接：Masonry,如果你项目使用Swift，建议你使用SnapKit",
                                       @"dContacts":@"@importMasonry.h",
                                       @"dCommentIf":@"0",
                                       @"dBranchNo":@"820181203",
                                       @"dBranchNm":@"如何使用Masonry",
                                       @"commentNo":@"2",
                                       @"comments":@[]
                                       },
                                   @{
                                       @"aBranchNo":@"980000000",
                                       @"aBranchaNm":@"山东省总行",
                                       @"aContext":@"交通银行还款日期都是什么",
                                       @"aId": @"187",
                                       @"aInformation":@"18866552233",
                                       @"aLudelete":@"0",
                                       @"aLuuseraId" :@"ZH001",
                                       @"aPctureadr":@"https://img2.woyaogexing.com/2018/11/16/fa2c549de378405d9220bc5c36c806fd!400x400.jpeg",
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
                                       
                                       @"dLuheadpic":@"https://img2.woyaogexing.com/2018/11/16/fa2c549de378405d9220bc5c36c806fd!400x400.jpeg",
                                       @"dTxTm":@"1543456317000",
                                       @"type":@"Activity",
                                       }
                                   ];
    
    self.dataArray = [NSMutableArray arrayWithArray:[CellModel mj_objectArrayWithKeyValuesArray:activityDynamics]];
    [self.headView headViewWithData:@{}];
    [self.myTab.mj_header endRefreshing];
    [self.myTab reloadData];
}

- (void)loadMoreData{
    
    
    [self.myTab.mj_footer endRefreshing];
}

- (HeadView *)headView{
    if (!_headView) {
        _headView = [[HeadView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
    }
    return _headView;
}
-(UITableView *)myTab{
    if (!_myTab) {
        _myTab = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [_myTab setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        _myTab.estimatedRowHeight = 0;
        _myTab.dataSource = self;
        _myTab.delegate   = self;
        _myTab.estimatedSectionFooterHeight = 0;
        _myTab.estimatedSectionHeaderHeight = 0;
        _myTab.tableHeaderView = self.headView;
        [_myTab registerClass:[DynamicCellTableViewCell class] forCellReuseIdentifier:DYNAMICCELL];
        [_myTab registerClass:[ActivityCellTableViewCell class] forCellReuseIdentifier:ACTIVITYCELL];
    }
    return _myTab;
}

-(NSMutableArray *)dataArray{
    if (_dataArray==nil) {
        _dataArray = [NSMutableArray arrayWithCapacity:0 ];
    }return _dataArray;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //  预设高度
    CellModel * model = [self modelsAtIndexPath:indexPath];
    if ([model.type isEqualToString:@"Activity"]) {
        return 480;
    }else{
        if (model.getContextHeight>120) {
            return model.getMidH + model.getBottomH + model.getContextHeight+60;
        }else{
            return model.getMidH + model.getBottomH + 200;
        }
    }
}
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return !self.dataArray ? 0: self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        CellModel * model = [self modelsAtIndexPath:indexPath];
        NSString * iden = [model.type isEqualToString:@"Activity"]?@"activityCell":@"dynamicCell";
        NSLog(@"id = %@",iden);
        if ([model.type isEqualToString:@"Activity"]) {
            ActivityCellTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:iden forIndexPath:indexPath];
            [cell setCellContentWithModel:model];
            return cell;
        } else {
            DynamicCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden forIndexPath:indexPath];
            [cell setCellContentWithModel:model];
            return cell;
        }
}
- (id)modelsAtIndexPath:(NSIndexPath *)indexPath {
    return self.dataArray.count > indexPath.row ? self.dataArray[indexPath.row] : nil;
}
@end

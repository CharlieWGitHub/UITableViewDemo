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


#import "UIImageView+YYWebImage.h"
#import "UIImage+YYWebImage.h"


static NSString * const ACTIVITYCELL = @"activityCell";//活动
static NSString * const DYNAMICCELL = @"dynamicCell";//动态
@interface ViewController ()
@property (nonatomic, strong)UITableView * myTab;
@property (nonatomic, assign)NSInteger pageNum;
@property (nonatomic, strong)HeadView * headView;
@property (nonatomic ,strong)JTDataSource *dataSource;
@property (nonatomic, strong)Present * pt;
@property (nonatomic ,strong) NSMutableArray * dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.pageNum = 0;
    [self creatSometing];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)creatSometing{
  
    [self.view addSubview:self.myTab];
    [self loadNewData];
    self.myTab.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    self.myTab.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];

    self.dataSource = [[JTDataSource alloc]initWithIdentifier:ACTIVITYCELL configureBlock:^(ActivityCellTableViewCell * cell, CellModel* model, NSIndexPath *indexPath) {
        cell.headImage.image = [UIImage imageNamed:@"Oval1"];
        cell.bankName.text = model.bankName;
        cell.publishTime.text = model.publishTime;
//        [cell.activityImage sd_setImageWithURL:[NSURL URLWithString:model.activityImage] placeholderImage:[UIImage imageNamed:@"Rectangle"]];
        
//        [cell.activityImage ]
//        [[UIImage imageNamed:@"Rectangle"] imageAddFilletWithRaius:16 size:CGSizeMake(SCREEN_WIDTH-32, 200)];
        cell.activityName.text = @"牵手度企鹅，相会于恒丰";
        cell.activityTime.text = @"2018年06月20日-2018年08月09日";
        cell.activityAddrss.text = @"青岛市市南区营业部支行";
        cell.activityTag.text = @"开门红，讲座";
//        [cell.activityImage yy_setImageWithURL:[NSURL URLWithString:model.activityImage] placeholder:[UIImage imageNamed:@"Rectangle"]];
      
        [cell.activityImage yy_setImageWithURL:[NSURL URLWithString:model.activityImage]
                         placeholder:nil options: YYWebImageOptionSetImageWithFadeAnimation
                            progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                                CGFloat  progress = (float)receivedSize / expectedSize;
                                NSLog(@"进度：%f",progress);
                            }
                           transform:^UIImage *(UIImage *image, NSURL *url) {
                               image = [image yy_imageByResizeToSize:CGSizeMake(SCREEN_WIDTH-32, 230) contentMode:UIViewContentModeScaleAspectFill];
                               return [image yy_imageByRoundCornerRadius:20];
                           }
                          completion:^(UIImage *image, NSURL *url, YYWebImageFromType from, YYWebImageStage stage, NSError *error) {
                              if (from == YYWebImageFromDiskCache) {
                                  NSLog(@"load from disk cache");
                              }
                          }];
        
    }];
    
    self.dataSource = [[JTDataSource alloc]initWithIdentifier:DYNAMICCELL configureBlock:^(DynamicCellTableViewCell * cell, CellModel * model, NSIndexPath *indexPath) {
        cell.dLuheadpic.image = [UIImage imageNamed:@"Rectangle"];
        cell.dBranchNm.text = @"总行营业部";
        cell.dTxTm.text = @"2018-09-09";
        cell.dContext.text = @"其实Masonry封装的API和苹果官方的思路是非常一致的，如果你经常用storyBoard或者Xib来自动布局的话，上手Masonry应该是很容易的。";
        
    }];
    
    [self.headView headViewWithData:@{}];
    self.myTab.tableHeaderView = self.headView;
    self.myTab.dataSource = self.dataSource;
    self.myTab.delegate = self.dataSource;


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
//        _myTab.delegate = self;
//        _myTab.dataSource = self;
        [_myTab setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        _myTab.estimatedRowHeight = 0;
        _myTab.estimatedSectionFooterHeight = 0;
        _myTab.estimatedSectionHeaderHeight = 0;
        [_myTab registerClass:[DynamicCellTableViewCell class] forCellReuseIdentifier:DYNAMICCELL];
//        [_myTab registerClass:[ActivityCellTableViewCell class] forCellReuseIdentifier:ACTIVITYCELL];
    }
    return _myTab;
}
- (void)loadDataA{
    
    NSArray * activityDynamics = @[@{
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
                              }];
    
    NSLog(@"--%@",activityDynamics);
    self.dataArray = [NSMutableArray arrayWithArray:[CellModel mj_objectArrayWithKeyValuesArray:activityDynamics]];
    [self.dataSource addDataArray:self.dataArray];
    

}
- (void)loadNewData{
   
    NSArray *temArray =@[@{@"bankName":@"Hank",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543485960652&di=4287d42576796b8e747e7183160f7e34&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F14%2F03%2F02%2F58V58PICTFk_1024.jpg"},
      @{@"bankName":@"Cooci",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543485960652&di=4287d42576796b8e747e7183160f7e34&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F14%2F03%2F02%2F58V58PICTFk_1024.jpg"},
      @{@"bankName":@"Kody",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543485960652&di=4287d42576796b8e747e7183160f7e34&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F14%2F03%2F02%2F58V58PICTFk_1024.jpg"},
      
      @{@"bankName":@"小雁子",@"headImage":@"Oval1",@"publishTime":@"59",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543485960652&di=4287d42576796b8e747e7183160f7e34&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F14%2F03%2F02%2F58V58PICTFk_1024.jpg"},
      @{@"bankName":@"Lina",@"headImage":@"Oval1",@"publishTime":@"49",@"activityImage":@"Rectangle"},@{@"bankName":@"Hank",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543485960652&di=4287d42576796b8e747e7183160f7e34&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F14%2F03%2F02%2F58V58PICTFk_1024.jpg"},
      @{@"bankName":@"Cooci",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543485960652&di=4287d42576796b8e747e7183160f7e34&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F14%2F03%2F02%2F58V58PICTFk_1024.jpg"},
      @{@"bankName":@"Kody",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543485960652&di=4287d42576796b8e747e7183160f7e34&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F14%2F03%2F02%2F58V58PICTFk_1024.jpg"},
      
      @{@"bankName":@"小雁子",@"headImage":@"Oval1",@"publishTime":@"59",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543485960652&di=4287d42576796b8e747e7183160f7e34&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F14%2F03%2F02%2F58V58PICTFk_1024.jpg"},
      @{@"bankName":@"Lina",@"headImage":@"Oval1",@"publishTime":@"49",@"activityImage":@"Rectangle"},@{@"bankName":@"Hank",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543485960652&di=4287d42576796b8e747e7183160f7e34&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F14%2F03%2F02%2F58V58PICTFk_1024.jpg"},
      @{@"bankName":@"Cooci",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543485960652&di=4287d42576796b8e747e7183160f7e34&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F14%2F03%2F02%2F58V58PICTFk_1024.jpg"},
      @{@"bankName":@"Kody",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543485960652&di=4287d42576796b8e747e7183160f7e34&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F14%2F03%2F02%2F58V58PICTFk_1024.jpg"},
      
      @{@"bankName":@"小雁子",@"headImage":@"Oval1",@"publishTime":@"59",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543485960652&di=4287d42576796b8e747e7183160f7e34&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F14%2F03%2F02%2F58V58PICTFk_1024.jpg"},
      @{@"bankName":@"Lina",@"headImage":@"Oval1",@"publishTime":@"49",@"activityImage":@"Rectangle"},@{@"bankName":@"Hank",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543485960652&di=4287d42576796b8e747e7183160f7e34&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F14%2F03%2F02%2F58V58PICTFk_1024.jpg"},
      @{@"bankName":@"Cooci",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543485960652&di=4287d42576796b8e747e7183160f7e34&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F14%2F03%2F02%2F58V58PICTFk_1024.jpg"},
      @{@"bankName":@"Kody",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543485960652&di=4287d42576796b8e747e7183160f7e34&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F14%2F03%2F02%2F58V58PICTFk_1024.jpg"},
      
      @{@"bankName":@"小雁子",@"headImage":@"Oval1",@"publishTime":@"59",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543485960652&di=4287d42576796b8e747e7183160f7e34&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F14%2F03%2F02%2F58V58PICTFk_1024.jpg"},
      @{@"bankName":@"Lina",@"headImage":@"Oval1",@"publishTime":@"49",@"activityImage":@"Rectangle"},@{@"bankName":@"Hank",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543485960652&di=4287d42576796b8e747e7183160f7e34&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F14%2F03%2F02%2F58V58PICTFk_1024.jpg"},
      @{@"bankName":@"Cooci",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543485960652&di=4287d42576796b8e747e7183160f7e34&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F14%2F03%2F02%2F58V58PICTFk_1024.jpg"},
  @{@"bankName":@"Lina",@"headImage":@"Oval1",@"publishTime":@"49",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543485960652&di=4287d42576796b8e747e7183160f7e34&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F14%2F03%2F02%2F58V58PICTFk_1024.jpg"}];
    
    self.dataArray = [NSMutableArray arrayWithArray:[CellModel mj_objectArrayWithKeyValuesArray:temArray]];
    [self.dataSource addDataArray:self.dataArray];

    [self.myTab reloadData];
    [self.myTab.mj_header endRefreshing];
}
- (void)loadMoreData{
    
    NSLog(@"==%lu",(unsigned long)self.dataArray.count);
    [self.dataArray addObjectsFromArray:self.dataArray];
    NSLog(@"==%lu",(unsigned long)self.dataArray.count);
    [self.dataSource addDataArray:self.dataArray];
    [self.myTab reloadData];
    [self.myTab.mj_footer endRefreshing];

}
-(NSMutableArray *)dataArray{
    if (_dataArray==nil) {
        _dataArray = [NSMutableArray arrayWithCapacity:0 ];
    }return _dataArray;
}


@end

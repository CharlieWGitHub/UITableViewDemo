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
//        [_myTab registerClass:[DynamicCellTableViewCell class] forCellReuseIdentifier:DYNAMICCELL];
        [_myTab registerClass:[ActivityCellTableViewCell class] forCellReuseIdentifier:ACTIVITYCELL];
    }
    return _myTab;
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

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
   
    self.myTab.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    self.myTab.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];

    self.dataSource = [[JTDataSource alloc]initWithIdentifier:ACTIVITYCELL configureBlock:^(ActivityCellTableViewCell * cell, CellModel* model, NSIndexPath *indexPath) {
        cell.headImage.image = [UIImage imageNamed:@"Oval1"];
        cell.bankName.text = model.bankName;
        cell.publishTime.text = model.publishTime;
        [cell.activityImage sd_setImageWithURL:[NSURL URLWithString:model.activityImage] placeholderImage:[UIImage imageNamed:@"Rectangle"]];
//        [[UIImage imageNamed:@"Rectangle"] imageAddFilletWithRaius:16 size:CGSizeMake(SCREEN_WIDTH-32, 200)];
        cell.activityName.text = @"牵手度企鹅，相会于恒丰";
        cell.activityTime.text = @"2018年06月20日-2018年08月09日";
        cell.activityAddrss.text = @"青岛市市南区营业部支行";
        cell.activityTag.text = @"开门红，讲座";
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
   
    NSArray *temArray =
    @[
      @{@"bankName":@"Hank",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543485960654&di=1468011dc7c87de465a665e63fc9c9eb&imgtype=0&src=http%3A%2F%2Fwx2.sinaimg.cn%2Flarge%2F006nLajtly1fk65lrevkqj30dw0dwadz.jpg"},
      @{@"bankName":@"Cooci",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543485960653&di=7aceee7e18e27fb1756feddf38ec8750&imgtype=0&src=http%3A%2F%2Fwx4.sinaimg.cn%2Flarge%2F67b2eab9ly1flwuchb5vlj20dw0dwdi1.jpg"},
      @{@"bankName":@"Kody",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543485960652&di=c5e95928c0e0a2f35bd5327cc449555a&imgtype=0&src=http%3A%2F%2Fgbres.dfcfw.com%2FFiles%2Fpicture%2F20181027%2F45CFDF18A401B77C64CDDFF59F6E1A6A.jpg"},
      
      @{@"bankName":@"小雁子",@"headImage":@"Oval1",@"publishTime":@"59",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543485960652&di=4287d42576796b8e747e7183160f7e34&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F14%2F03%2F02%2F58V58PICTFk_1024.jpg"},
      @{@"bankName":@"Lina",@"headImage":@"Oval1",@"publishTime":@"49",@"activityImage":@"Rectangle"},@{@"bankName":@"Hank",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543485960652&di=10a906f6e81b7f63c3ce15f7280325fc&imgtype=0&src=http%3A%2F%2Fgbres.dfcfw.com%2FFiles%2Fpicture%2F20180123%2Fsize500%2F8500AF041D0CBA36227FB1FFCD9E1B05.gif"},
      @{@"bankName":@"Cooci",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543486028417&di=112ac19feb445d6cf5c81e169290134b&imgtype=0&src=http%3A%2F%2Fimg3.h1365.cn%2Fhb1%2Fyl2%2F10%2F881811554923124.jpg"},
      @{@"bankName":@"Kody",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543486028416&di=8735d9722df9dad7edd4b97ad2e5d3d1&imgtype=0&src=http%3A%2F%2Fwx4.sinaimg.cn%2Flarge%2F006DbPTnly1fvirky6v63j30dw0dwq3w.jpg"},
      
      @{@"bankName":@"小雁子",@"headImage":@"Oval1",@"publishTime":@"59",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543486028416&di=56cbe925e70236faeac7e7f3da8a73f0&imgtype=0&src=http%3A%2F%2Fpic25.nipic.com%2F20121130%2F9393861_161841181000_2.jpg"},
      @{@"bankName":@"Lina",@"headImage":@"Oval1",@"publishTime":@"49",@"activityImage":@"Rectangle"},@{@"bankName":@"Hank",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543486028415&di=7f59717443198960fd40137a6cb91477&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F15%2F35%2F99%2F07A58PICGRm_1024.jpg"},
      @{@"bankName":@"Cooci",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543486028414&di=f5603bfe6c7605066dcf5c5f0db820bd&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F15%2F36%2F60%2F00W58PICmGB_1024.jpg"},
      @{@"bankName":@"Kody",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543486075283&di=7dbbd5dfc9a22aaca5650d669d56e24e&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F15%2F35%2F53%2F40z58PIC4a2_1024.jpg"},
      
      @{@"bankName":@"小雁子",@"headImage":@"Oval1",@"publishTime":@"59",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543486075281&di=f9f6058756a4d0a1a4eaf6128f94a8e5&imgtype=0&src=http%3A%2F%2Fpic43.nipic.com%2F20140703%2F18178876_080001938000_2.jpg"},
      @{@"bankName":@"Lina",@"headImage":@"Oval1",@"publishTime":@"49",@"activityImage":@"Rectangle"},@{@"bankName":@"Hank",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1543476067&di=9a83aae7ad4d2fdf58055224be46981d&src=http://uploads.xuexila.com/allimg/1512/623-151230152159461.jpg"},
      @{@"bankName":@"Cooci",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1543476067&di=914206412ae6dd47efb71a5cd2cc66de&src=http://img.mp.sohu.com/q_mini,c_zoom,w_640/upload/20170602/4d58e6f3d6ec4e89a898c09fbf9bb68b_th.jpg"},
      @{@"bankName":@"Kody",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1543476067&di=533bd9e67e26edb6175ebeddc4b636fc&src=http://www.shuoshuokong.org/uploads/allimg/170219/2-1F219193053-50.jpg"},
      
      @{@"bankName":@"小雁子",@"headImage":@"Oval1",@"publishTime":@"59",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1543476067&di=24b7ff0b430700094f70c1989d163299&src=http://img1.qunarzz.com/travel/d5/1511/72/6a4428585891c5f7.jpg_r_650x433x95_27612056.jpg"},
      @{@"bankName":@"Lina",@"headImage":@"Oval1",@"publishTime":@"49",@"activityImage":@"Rectangle"},@{@"bankName":@"Hank",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1543476067&di=e4a14bcfe038935e4f4ff2d2cb0b16a6&src=http://s9.rr.itc.cn/r/wapChange/20173_22_16/a3bemv5668630595333.jpeg"},
      @{@"bankName":@"Cooci",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1543476067&di=bb8525c1d6a9134fa6ec54ed16c8066c&src=http://img.mp.sohu.com/q_mini,c_zoom,w_640/upload/20170704/ca52d05be7ac49129131e8dd967ee192_th.jpg"},
      @{@"bankName":@"Kody",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1543476067&di=b15f1a2c6def099d2e836d72f49dbe8c&src=http://s9.rr.itc.cn/r/wapChange/20173_28_2/a7ngde0387351025619.jpeg"},
      
      @{@"bankName":@"小雁子",@"headImage":@"Oval1",@"publishTime":@"59",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1543476067&di=7790a49e3aaedb1bbb492e92b176ec76&src=http://img.zcool.cn/community/016b85580f0a1ba84a0d304f5c8231.jpg"},
      @{@"bankName":@"Lina",@"headImage":@"Oval1",@"publishTime":@"49",@"activityImage":@"Rectangle"},@{@"bankName":@"Hank",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1543476067&di=a6efea3af4cc7a5c2d29403c58ec5538&src=http://5b0988e595225.cdn.sohucs.com/images/20180625/40f94ba63ea54b9aabc610cf38b72367.gif"},
      @{@"bankName":@"Cooci",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1543476067&di=cb956e2229f50b418741928ded899d55&src=http://img.mp.sohu.com/upload/20170719/c7cc4948e32c4ce9834de0804b7c6bd6_th.png"},
      @{@"bankName":@"Kody",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543486265754&di=dbc89fd977f4cfecb9979dd46567de37&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F17%2F84%2F66%2F09W58PIC9BQ_1024.jpg"},
      
      @{@"bankName":@"小雁子",@"headImage":@"Oval1",@"publishTime":@"59",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543486265754&di=3efbc08b97509d9f620eed1433782fb5&imgtype=0&src=http%3A%2F%2Fpic34.photophoto.cn%2F20150117%2F0005018328326028_b.jpg"},
      @{@"bankName":@"Lina",@"headImage":@"Oval1",@"publishTime":@"49",@"activityImage":@"Rectangle"},@{@"bankName":@"Hank",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543486265753&di=c7c1785d618c79f92001dd3e6a288404&imgtype=0&src=http%3A%2F%2Fpic28.photophoto.cn%2F20130827%2F0005018376937114_b.jpg"},
      @{@"bankName":@"Cooci",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543486265752&di=9ab03955e09458c3cb0dc250444b7ac6&imgtype=0&src=http%3A%2F%2Fpic33.photophoto.cn%2F20141119%2F0005018312859656_b.jpg"},
      @{@"bankName":@"Kody",@"headImage":@"Oval1",@"publishTime":@"99",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543486265752&di=64b28b5d8231f03ea3c878c5acc849be&imgtype=0&src=http%3A%2F%2Fpic29.photophoto.cn%2F20131124%2F0005018358111204_b.jpg"},
      
      @{@"bankName":@"小雁子",@"headImage":@"Oval1",@"publishTime":@"59",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543486265752&di=0a27867ad635a268364f47495d615acf&imgtype=0&src=http%3A%2F%2Fpic43.nipic.com%2F20140711%2F19187786_140828149528_2.jpg"},
      @{@"bankName":@"Lina",@"headImage":@"Oval1",@"publishTime":@"49",@"activityImage":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543486265752&di=fc36700624697c06c7ff9976d7f0fe75&imgtype=0&src=http%3A%2F%2Fc.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2F242dd42a2834349b193b6c82caea15ce36d3bef3.jpg"}];
    //    for (int i = 0; i<temArray.count; i++) {
    //        CellModel *m = [CellModel mj_objectWithKeyValues:temArray[i]];
    //        [self.dataArray addObject:m];
    //    }
    
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
//



@end

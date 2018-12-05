//
//  MVVMViewController.m
//  UITableViewDemo
//
//  Created by 王成龙 on 2018/11/20.
//  Copyright © 2018 CL. All rights reserved.
//

#import "MVVMViewController.h"
#import "UIImageView+YYWebImage.h"
#import "UIImage+YYWebImage.h"
#import "YYMemoryCache.h"
#import "YYDiskCache.h"

@interface MVVMViewController ()

@end

@implementation MVVMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    YYImageCache *cache = [YYWebImageManager sharedManager].cache;
    // 获取缓存大小

    NSUInteger totalCost = [[cache memoryCache ]totalCost];
    NSUInteger totalCount = [[cache memoryCache]totalCount];
    NSUInteger totalDisCost = [[cache diskCache ]totalCost];
    NSUInteger totalDisCount = [[cache diskCache ]totalCount];
    
    NSLog(@"\ntotalCost=%lu\ntotalCount=%lu\ntotalDisCost=%lu\ntotalDisCount=%lu",(unsigned long)totalCost,(unsigned long)totalCount,(unsigned long)totalDisCost,(unsigned long)totalDisCount);
    
    // Do any additional setup after loading the view.
}
- (IBAction)beginExit:(id)sender {
    // 清空缓存
    YYImageCache *cache = [YYWebImageManager sharedManager].cache;
    [cache.memoryCache removeAllObjects];
    [cache.diskCache removeAllObjects];
  
//  count -1
    NSInteger count1 = 0/3;
    NSInteger count2 = 1/3;
    NSInteger count3 = 2/3;
    
    NSInteger count4 = 3/3;
    NSInteger count5 = 4/3;
    NSInteger count6 = 5/3;
    
    NSInteger count7 = 6/3;
    NSInteger count8 = 7/3;
    NSInteger count9 = 8/3;
    NSLog(@"%ld%ld%ld\n%ld%ld%ld\n%ld%ld%ld",(long)count1,(long)count2,(long)count3,(long)count4,(long)count5,(long)count6,(long)count7,(long)count8,(long)count9);
//
//    [[JTUserInfoTool shareInstance]removeTokenFromSanbox];
//
//    UIViewController * mainTabBar = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"loginVC"];
//    SDJTKEYWINDOW.rootViewController = mainTabBar;
//
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

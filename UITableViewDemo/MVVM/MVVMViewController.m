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

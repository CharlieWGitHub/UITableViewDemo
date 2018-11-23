//
//  MVVMViewController.m
//  UITableViewDemo
//
//  Created by 王成龙 on 2018/11/20.
//  Copyright © 2018 CL. All rights reserved.
//

#import "MVVMViewController.h"

@interface MVVMViewController ()

@end

@implementation MVVMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)beginExit:(id)sender {
    
    
    [[JTUserInfoTool shareInstance]removeTokenFromSanbox];
    
    UIViewController * mainTabBar = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"loginVC"];
    SDJTKEYWINDOW.rootViewController = mainTabBar;
    
    
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

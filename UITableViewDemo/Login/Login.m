//
//  Login.m
//  UITableViewDemo
//
//  Created by 王成龙 on 2018/11/21.
//  Copyright © 2018 CL. All rights reserved.
//

#import "Login.h"
#import "JTUserInfoTool.h"
#import "JTParamsBaseModel.h"
#import "LoginHandle.h"

@interface Login ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passTextField;

@end

@implementation Login

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)BeginLogin:(id)sender {
// 账号密码 输入合法后 发起登录请求
    //请求合法后进入APP
    
    JTParamsBaseModel *params = [[JTParamsBaseModel alloc]init];
    params.principal           =  _nameTextField.text;
    params.password          =  _passTextField.text;
    
//    WEAK_SELF;
    [LoginHandle loadLoginHttpRequestWithParams:params view:self.view success:^(JTUserInfoTool *infoModel) {
       
//        STRONG_SELF;
//        [MBProgressHUD hideHUDForView:strongSelf.view];
        
        infoModel = [JTUserInfoTool shareInstance];
        [JTUserInfoTool shareInstance].userName = params.principal;
        [[JTUserInfoTool shareInstance] saveUserInfoToSanbox];
        
        UITabBarController * mainTabBar = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"mainTabBar"];
        SDJTKEYWINDOW.rootViewController = mainTabBar;
        
    } failure:^(NSError *error) {
        
    }];
    
    
 
    
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

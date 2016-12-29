//
//  LSLoginViewController.m
//  LiveStreaming
//
//  Created by 李保东 on 16/12/29.
//  Copyright © 2016年 李保东. All rights reserved.
//

#import "LSLoginViewController.h"
#import "LSMainTabBarViewController.h"

@interface LSLoginViewController ()

// 快速登录入口按钮
@property(nonatomic,strong)UIButton *loginBtn;

@end

@implementation LSLoginViewController

#pragma mark - Init
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:self.loginBtn];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.loginBtn.bounds =CGRectMake(0, 0, 200, 40);
    self.loginBtn.center =CGPointMake(SCREEN_WIDTH *0.5, SCREEN_HEIGHT -100);
}

#pragma mark - Private Methods

#pragma mark - Action Methods
-(void)loginBtnClicked:(UIButton *)btn {
    DDLog(@"点击了登录按钮");
    
    [[DisplayHelper shareDisplayHelper]showLoading:self.view noteText:@"登录中..."];
    WS(ws);
    // 模拟登录功能
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[DisplayHelper shareDisplayHelper]hideLoading:ws.view];
        [UIApplication sharedApplication].keyWindow.rootViewController =[[LSMainTabBarViewController alloc]init];
        
        // 保存登录状态
        [LSUserTools saveLoginData:YES];
        [DisplayHelper displaySuccessAlert:@"登录成功"];


    });
}

#pragma mark - Delegate

#pragma mark - Setter & Getter

-(UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        _loginBtn.backgroundColor =[UIColor redColor];
        [_loginBtn setTitle:@"快速登录" forState:UIControlStateNormal];
        [_loginBtn addTarget:self action:@selector(loginBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _loginBtn;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

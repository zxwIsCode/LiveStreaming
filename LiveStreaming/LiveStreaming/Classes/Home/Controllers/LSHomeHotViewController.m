//
//  CMHomeViewController.m
//  ComeMoneyHere
//
//  Created by 李保东 on 16/11/15.
//  Copyright © 2016年 DaviD. All rights reserved.
//

#import "LSHomeHotViewController.h"
#import "LSHomeHotCell.h"

@interface LSHomeHotViewController ()<UITableViewDelegate,UITableViewDataSource>

//@property(nonatomic,strong)NSArray *testArray;

@property(nonatomic,strong)UITableView *tableView;

// 热门的数组
@property(nonatomic,strong)NSMutableArray *hotDataArray;

// 广告数组
@property(nonatomic,strong)NSMutableArray *adsArray;

@end

@implementation LSHomeHotViewController

#pragma mark - Init
- (void)viewDidLoad {

    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.view.backgroundColor =[UIColor blueColor];
    
}

#pragma mark - Private Methods

#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.hotDataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LSHomeHotCell *cell =[LSHomeHotCell updateWithTableView:tableView];
    if (cell) {
        
    }
    return cell;    
}

-(void)testPersonNet {
    
    CMHttpRequestModel *model =[[CMHttpRequestModel alloc]init];
    NSDictionary *paramsDic =@{@"pid":@(10)};
    
    model.appendUrl =kTestDonationGetPersonURL;
    model.paramDic =[paramsDic mutableCopy];
    model.callback =^(CMHttpResponseModel *result, NSError *error) {
        
        if (result.state ==CMReponseCodeState_Success) {// 成功,做自己的逻辑
            DDLog(@"%@",result.data);
        }else {// 失败,弹框提示
//            mAlertView(@"提示", result.alertMsg);
            [CMHttpStateTools showHtttpStateView:result.state];

            DDLog(@"%@",result.error);
        }
        
    };
    [[CMHTTPSessionManager sharedHttpSessionManager] sendHttpRequestParam:model];
    
}
#pragma mark - 子类继承

-(CMNavType)getNavType {
    return CMNavTypeOnlyTitle;
}

#pragma mark - Setter & Getter

-(NSMutableArray *)hotDataArray {
    if (!_hotDataArray) {
        _hotDataArray =[NSMutableArray array];
    }
    return _hotDataArray;
}
-(NSMutableArray *)adsArray {
    if (!_adsArray) {
        _adsArray =[NSMutableArray array];
    }
    return _adsArray;
}
-(UITableView *)tableView {
    if (!_tableView) {
        _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT -NavigationBar_BarHeight) style:UITableViewStylePlain];
        _tableView.delegate =self;
        _tableView.dataSource =self;
        _tableView.bounces =NO;
        //cell无数据时，不显示间隔线
        UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
        [_tableView setTableFooterView:v];
    }
    return _tableView;
}


@end

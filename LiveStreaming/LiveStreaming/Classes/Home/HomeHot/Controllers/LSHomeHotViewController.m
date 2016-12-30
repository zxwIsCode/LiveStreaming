//
//  CMHomeViewController.m
//  ComeMoneyHere
//
//  Created by 李保东 on 16/11/15.
//  Copyright © 2016年 DaviD. All rights reserved.
//

#import "LSHomeHotViewController.h"
#import "LSHomeHotCell.h"
#import "MJRefresh.h"
#import "LSHomeHotModel.h"

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
//    self.view.backgroundColor =[UIColor blueColor];
    
    [self initAllDatas];
    

}

#pragma mark - Private Methods
-(void)initAllDatas {
    CMHttpRequestModel *model =[[CMHttpRequestModel alloc]init];
    
    model.appendUrl =kHomeGetHotLive;
    model.type =CMHttpType_GET;
    WS(ws);
    model.callback =^(CMHttpResponseModel *result, NSError *error) {
        
        if (result.state ==CMReponseCodeState_Success) {// 成功,做自己的逻辑
            NSArray *allHotArray =result.data[@"list"];
            for (NSDictionary *dicItem in allHotArray) {
                LSHomeHotModel *hotModel = [LSHomeHotModel updateWithDic:dicItem];
                [ws.hotDataArray addObject:hotModel];
            }
            [ws.tableView reloadData];
            DDLog(@"%@",result.data);
        }else {// 失败,弹框提示
            [CMHttpStateTools showHtttpStateView:result.state];
            
            DDLog(@"%@",result.error);
        }
        
    };
    [[CMHTTPSessionManager sharedHttpSessionManager] sendHttpRequestParam:model];
}

#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
//    return self.hotDataArray.count +1;
    return self.hotDataArray.count +1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row ==0) {
        return 100;
    }
    return (54 +300 +10) *kAppScale;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row ==0) {
        static NSString *ID = @"AdsCellId";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
            cell.selectedBackgroundView =[[UIView alloc]init];
            cell.backgroundColor =[UIColor redColor];
        }
        return cell;

    }
    LSHomeHotCell *cell =[LSHomeHotCell updateWithTableView:tableView];
    if (cell) {
        
//        cell.backgroundColor =[UIColor lightGrayColor];
        cell.hotModel =self.hotDataArray[indexPath.row -1];
    }
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    
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

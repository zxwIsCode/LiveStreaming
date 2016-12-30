//
//  LSHomeContactViewController.m
//  LiveStreaming
//
//  Created by 李保东 on 16/12/29.
//  Copyright © 2016年 李保东. All rights reserved.
//

#import "LSHomeContactViewController.h"
#import "LSHomeHotViewController.h"
#import "LSHomeNewViewController.h"
#import "LSHomeCaseViewController.h"
#import "LSSegmentView.h"

// 每个item的宽度
#define NavBarItemWidth  SCREEN_WIDTH/5.0

//nav上的SegmentWidth
#define NavBarSegmentWidth NavBarItemWidth*3

#define NavBarItemHeight 44



@interface LSHomeContactViewController ()

// 首页热门直播
@property(nonatomic,strong)LSHomeHotViewController *homeHotVC;
// 首页新直播
@property(nonatomic,strong)LSHomeNewViewController *homeNewVC;
// 首页关注的直播
@property(nonatomic,strong)LSHomeCaseViewController *homeCaseVC;

@property(nonatomic,strong)UIButton *searchBtn;
// 皇冠的button
@property(nonatomic,strong)UIButton *crownBtn;
@property(nonatomic,strong)LSSegmentView *segmentView;



@end

@implementation LSHomeContactViewController

#pragma mark - Init
- (void)loadView
{
    CGRect rect = [[UIScreen mainScreen] bounds];
    rect.size.height -= NavigationBar_BarHeight;
    UIView *view = [[UIView alloc] initWithFrame:rect];
    view.backgroundColor = [UIColor whiteColor];
    self.view = view;
    ///switch View

    [self.navigationController.navigationBar addSubview:self.segmentView];
    
//    CGFloat originY = CGRectGetMaxY(self.segmentView.frame);
    self.pageContentFrame = CGRectMake(0,
                                       0,
                                       rect.size.width,
                                       rect.size.height);
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.segmentView.conditions = @[@"最热",@"最新", @"关注"];
    [self.navigationController.navigationBar addSubview:self.searchBtn];
    [self.navigationController.navigationBar addSubview:self.crownBtn];


    self.contentControllers = (NSArray<NHPageContentViewControllerDelegate> *)[NSArray arrayWithObjects:self.homeHotVC, self.homeNewVC,self.homeCaseVC, nil];

//    [self.navigationController.navigationBar addSubview:self.searchBtn];

    
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.searchBtn.frame =CGRectMake(0, 0, NavBarItemWidth, NavBarItemHeight);
    
    self.crownBtn.frame =CGRectMake(NavBarItemWidth +NavBarSegmentWidth, 0, NavBarItemWidth, NavBarItemHeight);
    
//    self.searchBtn.backgroundColor =[UIColor brownColor];
//    self.crownBtn.backgroundColor =[UIColor yellowColor];
//    self.segmentView.backgroundColor =[UIColor greenColor];
}

#pragma mark Action Methods
- (void)changeViewController:(LSSegmentView *)segment
{
    self.currentIdx = segment.currentIndex;
}

// 点击皇冠按钮
-(void)crownBtnClick:(UIButton *)btn {
    DDLog(@"点击皇冠按钮");

}
// 点击搜索按钮
-(void)searchBtnClick:(UIButton *)btn {
    DDLog(@"点击搜索按钮");
}
#pragma mark - 继承父类
- (void)didShowControllerAtIndex:(NSInteger)idx
{
    self.segmentView.currentIndex = idx;
}

-(CMNavType)getNavType {
    return CMNavTypeNone;
}
#pragma mark - Setter & Getter

- (LSSegmentView *)segmentView
{
    if (!_segmentView)
    {
        _segmentView = [[LSSegmentView alloc] initWithFrame:CGRectMake(NavBarItemWidth,0, NavBarSegmentWidth, NavBarItemHeight)];
//        _segmentView.layer.borderWidth =1;
//        _segmentView.layer.borderColor =UIColorFromHexValue(0xdcdcdc).CGColor;
        [_segmentView addTarget:self
                         action:@selector(changeViewController:)
               forControlEvents:UIControlEventValueChanged];
    }
    
    return _segmentView;
}

-(UIButton *)searchBtn {
    if (!_searchBtn) {
        _searchBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        [_searchBtn setImage:[UIImage imageNamed:@"search_15x14"] forState:UIControlStateNormal];
        [_searchBtn addTarget:self action:@selector(searchBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _searchBtn;
}
-(UIButton *)crownBtn {
    if (!_crownBtn) {
        _crownBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        [_crownBtn setImage:[UIImage imageNamed:@"head_crown_24x24"] forState:UIControlStateNormal];
        [_crownBtn addTarget:self action:@selector(crownBtnClick:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _crownBtn;
}

-(LSHomeHotViewController *)homeHotVC {
    if (!_homeHotVC) {
        _homeHotVC =[[LSHomeHotViewController alloc]init];
        _homeHotVC.nav =self.navigationController;
    }
    return _homeHotVC;
}
-(LSHomeNewViewController *)homeNewVC {
    if (!_homeNewVC) {
        _homeNewVC =[[LSHomeNewViewController alloc]init];
        _homeNewVC.nav =self.navigationController;
    }
    return _homeNewVC;
}

-(LSHomeCaseViewController *)homeCaseVC {
    if (!_homeCaseVC) {
        _homeCaseVC =[[LSHomeCaseViewController alloc]init];
        _homeCaseVC.nav =self.navigationController;
    }
    return _homeCaseVC;
}

@end

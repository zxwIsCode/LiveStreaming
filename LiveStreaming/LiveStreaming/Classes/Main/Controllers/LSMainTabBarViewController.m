//
//  CMMainTabBarViewController.m
//  ComeMoneyHere
//
//  Created by 李保东 on 16/11/15.
//  Copyright © 2016年 DaviD. All rights reserved.
//

#import "LSMainTabBarViewController.h"
#import "LSNavViewController.h"
#import "LSHomeContactViewController.h"
#import "LSMeViewController.h"
#import "LSLiveRadioViewController.h"

#import "LSCustomTabBar.h"

@interface LSMainTabBarViewController ()<CMCustomTabBarDelegate>

@property(nonatomic,strong)LSHomeContactViewController *homeContactVC;


@property(nonatomic,strong)LSLiveRadioViewController *liveRadioVC;

@property(nonatomic,strong)LSMeViewController *meVC;

@property(nonatomic,strong)LSCustomTabBar *customTabBar;

@end

@implementation LSMainTabBarViewController

#pragma mark - Init
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setupCustomTabBar];
    
    [self setupAllChildViewControllers];

    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

#pragma mark - Private Methods


-(void)setupCustomTabBar {
    LSCustomTabBar *customTabBar =[[LSCustomTabBar alloc]init];
    CGFloat tabBarHeight =84 *kAppScale;
    customTabBar.frame =CGRectMake(0, 49.0 -tabBarHeight, SCREEN_WIDTH, tabBarHeight);
    [self.tabBar addSubview:customTabBar];
    self.customTabBar =customTabBar;
    self.customTabBar.delegate =self;
}

/**
 *  初始化所有的子控制器
 */
- (void)setupAllChildViewControllers
{
    // 1.首页
    [self setupChildViewController:self.homeVC title:nil imageName:@"toolbar_home" selectedImageName:@"toolbar_home_sel" andIndex:0];
    
    [self setupChildViewController:self.liveRadioVC title:nil imageName:@"toolbar_live" selectedImageName:nil andIndex:1];
    
    // 4.用户信息
    [self setupChildViewController:self.meVC title:nil imageName:@"toolbar_me" selectedImageName:@"toolbar_me_sel" andIndex:2];
    
}

/**
 *  初始化一个子控制器
 
 */
- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName andIndex:(NSInteger)index
{
    // 1.设置控制器的属性
    if (title) {
        childVc.title = title;
    }
    if (imageName) {
        childVc.tabBarItem.image = [UIImage imageNamed:imageName];

    }
    if (selectedImageName) {
        childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    // 2.包装一个导航控制器
    LSNavViewController *nav = [[LSNavViewController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
    // 自定义TabBar的SubViews
    [self.customTabBar creatAllTabBarSubViews:childVc.tabBarItem andIndex:index];
    
    
}
#pragma mark - CMCustomTabBarDelegate

-(void)tabBar:(LSCustomTabBar *)tabBar didSelectVC:(NSInteger)lastIndex andNext:(NSInteger)nextIndex {
    self.selectedIndex =nextIndex -kTabBarButtonBaseTag;
}

#pragma mark - Setter & Getter
-(LSHomeContactViewController *)homeVC {
    if (!_homeContactVC) {
        _homeContactVC =[[LSHomeContactViewController alloc]init];
    }
    return _homeContactVC;
}
-(LSLiveRadioViewController *)liveRadioVC {
    if (!_liveRadioVC) {
        _liveRadioVC  =[[LSLiveRadioViewController alloc]init];
    }
    return _liveRadioVC;
}

-(LSMeViewController *)meVC {
    if (!_meVC) {
        _meVC =[[LSMeViewController alloc]init];
    }
    return _meVC;
}


@end

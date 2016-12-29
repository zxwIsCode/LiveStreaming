//
//  CMMainTabBarViewController.m
//  ComeMoneyHere
//
//  Created by 李保东 on 16/11/15.
//  Copyright © 2016年 DaviD. All rights reserved.
//

#import "LSMainTabBarViewController.h"
#import "LSNavViewController.h"
#import "LSHomeViewController.h"
#import "LSCommondViewController.h"
#import "LSMeViewController.h"
#import "LSSendTaskViewController.h"

#import "LSCustomTabBar.h"

@interface LSMainTabBarViewController ()<CMCustomTabBarDelegate>

@property(nonatomic,strong)LSHomeViewController *homeVC;

@property(nonatomic,strong)LSSendTaskViewController *sendTaskVC;

@property(nonatomic,strong)LSCommondViewController *commondVC;

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
    [self setupChildViewController:self.homeVC title:@"首页" imageName:@"icon_shouye" selectedImageName:@"icon_shouyebian" andIndex:0];
    
    // 2.发布任务
    [self setupChildViewController:self.sendTaskVC title:@"发布任务" imageName:@"icon_renwu" selectedImageName:@"icon_renwubian" andIndex:1];
    
    // 3.推荐码
    [self setupChildViewController:self.commondVC title:@"推荐码" imageName:@"icon_erweima" selectedImageName:@"icon_erweimabian" andIndex:2];
    
    // 4.用户信息
    [self setupChildViewController:self.meVC title:@"用户信息" imageName:@"icon_yonghu" selectedImageName:@"icon_yonghubian" andIndex:3];
    
}

/**
 *  初始化一个子控制器
 
 */
- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName andIndex:(NSInteger)index
{
    // 1.设置控制器的属性
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];

    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
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
-(LSHomeViewController *)homeVC {
    if (!_homeVC) {
        _homeVC =[[LSHomeViewController alloc]init];
    }
    return _homeVC;
}
-(LSSendTaskViewController *)sendTaskVC {
    if (!_sendTaskVC) {
        _sendTaskVC =[[LSSendTaskViewController alloc]init];
    }
    return _sendTaskVC;
}
-(LSCommondViewController *)commondVC {
    if (!_commondVC) {
        _commondVC =[[LSCommondViewController alloc]init];
    }
    return _commondVC;
}
-(LSMeViewController *)meVC {
    if (!_meVC) {
        _meVC =[[LSMeViewController alloc]init];
    }
    return _meVC;
}


@end

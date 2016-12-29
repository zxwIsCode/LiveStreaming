//
//  CMCustomTabBar.m
//  ComeMoneyHere
//
//  Created by 李保东 on 16/12/2.
//  Copyright © 2016年 DaviD. All rights reserved.
//

#import "LSCustomTabBar.h"
#import "LSTabBarButton.h"

#define buttonCount 3

@interface LSCustomTabBar ()

@property(nonatomic,weak)LSTabBarButton *tempButton;

@end

@implementation LSCustomTabBar

-(instancetype)init {
    if (self =[super init]) {
        self.userInteractionEnabled =YES;
        self.image =[UIImage imageNamed:@"icon_tabBarBgdb"];
    }
    return self;
}
-(void)layoutSubviews {
    [super layoutSubviews];
}
-(void)creatAllTabBarSubViews:(UITabBarItem *)item andIndex:(NSInteger)index{
    
    CGFloat buttonW =self.frame.size.width/buttonCount;
    CGFloat buttonY =44;
    CGFloat buttonH =self.frame.size.height -buttonY -5 *kAppScale;
    
    CGFloat buttonX =buttonW *index;
    LSTabBarButton *button =[LSTabBarButton upDownButton];
    button.imagRatio =1;
    button.frame =CGRectMake(buttonX, buttonY, buttonW, buttonH);
    
//    button.backgroundColor =[UIColor redColor];
//    button.titleLabel.backgroundColor =[UIColor purpleColor];
//    button.imageView.backgroundColor =[UIColor brownColor];
    button.tag = kTabBarButtonBaseTag +index;
    button.item = item;
    
    [button addTarget:self action:@selector(TabBarButtonClick:) forControlEvents:UIControlEventTouchDown];
    if (index ==0) {
        [self TabBarButtonClick:button];
    }
    [self addSubview:button];

}
-(void)TabBarButtonClick:(LSTabBarButton *)tabBarButton {
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectVC:andNext:)]) {
        [self.delegate tabBar:self didSelectVC:self.tempButton.tag andNext:tabBarButton.tag];
    }
    self.tempButton.selected =NO;
    tabBarButton.selected =YES;
    self.tempButton =tabBarButton;
}

@end

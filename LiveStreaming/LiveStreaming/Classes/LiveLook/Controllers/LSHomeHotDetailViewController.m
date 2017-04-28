//
//  LSHomeHotDetailViewController.m
//  LiveStreaming
//
//  Created by 李保东 on 16/12/30.
//  Copyright © 2016年 李保东. All rights reserved.
//

#import "LSHomeHotDetailViewController.h"

#import "LSAnchorView.h"
#import "LSBottomToolsView.h"
#import "LSRelatedAnchorView.h"


@interface LSHomeHotDetailViewController ()

@property(nonatomic,strong)LSAnchorView *anchorView;

@property(nonatomic,strong)LSBottomToolsView *toolsView;

@property(nonatomic,strong)LSRelatedAnchorView *relatedAnchorView;

@end

@implementation LSHomeHotDetailViewController

#pragma mark - Init
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.anchorView];
    [self.view addSubview:self.toolsView];
    [self.view addSubview:self.relatedAnchorView];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.anchorView Original_FrameX:15 andY:20 andWidth:iPhone6_WIDTH -2 *15 andHeight:100];
    
    
    
    CGFloat toolsViewH =60 *kAppScale;
    self.toolsView.frame =CGRectMake(0, SCREEN_HEIGHT -toolsViewH, SCREEN_WIDTH, toolsViewH);
    
    CGFloat relatedAnchorViewWH =80 *kAppScale;
    self.relatedAnchorView.center =CGPointMake(SCREEN_WIDTH -40 -relatedAnchorViewWH *0.5, SCREEN_HEIGHT *0.5);
    self.relatedAnchorView.bounds =CGRectMake(0, 0, relatedAnchorViewWH, relatedAnchorViewWH);

    
    self.anchorView.backgroundColor =[UIColor redColor];
    self.toolsView.backgroundColor =[UIColor brownColor];
    self.relatedAnchorView.backgroundColor =[UIColor redColor];

    
}

#pragma mark - 继承父类

-(CMNavType)getNavType {
    return CMNavTypeNone;
}
#pragma mark - Setter & Getter
-(LSAnchorView *)anchorView {
    if (!_anchorView) {
        _anchorView =[[LSAnchorView alloc]init];
    }
    return _anchorView;
}

-(LSBottomToolsView *)toolsView {
    if (!_toolsView) {
        _toolsView =[[LSBottomToolsView alloc]init];
    }
    return _toolsView;
}
-(LSRelatedAnchorView *)relatedAnchorView {
    if (!_relatedAnchorView) {
        _relatedAnchorView =[[LSRelatedAnchorView alloc]init];
    }
    return _relatedAnchorView;
}

@end

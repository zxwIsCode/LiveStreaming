//
//  LSAnchorView.m
//  LiveStreaming
//
//  Created by 李保东 on 16/12/31.
//  Copyright © 2016年 李保东. All rights reserved.
//

#import "LSAnchorView.h"

@interface LSAnchorView ()

//----------------父View

@property(nonatomic,strong)UIView *superUserView;// 父View

@property(nonatomic,strong)UIScrollView *otherUserScrollView; //其他用户的ScrollView

@property(nonatomic,strong)UIButton *peopleRewardBtn; //猫粮什么显示的Button

//----------------子View

@property(nonatomic,strong)UIButton *iconBtn;

@property(nonatomic,strong)UILabel *nikeNameLable;

@property(nonatomic,strong)UILabel *peopleLable;

@property(nonatomic,strong)UIButton *onOffBtn;


@end

@implementation LSAnchorView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self =[super initWithFrame:frame]) {
        [self initAllViews:frame];
    }
    return self;
}
-(void)layoutSubviews {
    [super layoutSubviews];
    
    // 1. 布局frame
    // 子View之间的间距
    CGFloat subViewSpacing =10 ;
    // 父View之间的间距
    CGFloat superViewSpacing =15 ;
    CGFloat selfW =self.frame.size.width;
    CGFloat selfH =self.frame.size.height;
    CGFloat superUserViewH =54;
    [self.superUserView Original_FrameX:0 andY:0 andWidth:selfW *0.6 andHeight:superUserViewH];
    [self.peopleRewardBtn ViewFrame_OnlyY:superViewSpacing andWidth:selfW *0.6 andHeight:24 andReleatedView:self.superUserView];
    CGFloat otherUserScrollViewH =40;
    [self.otherUserScrollView ViewFrame_BothX:subViewSpacing andFrameY:(superUserViewH -otherUserScrollViewH) *0.5 -self.superUserView.height andWidth:selfW *0.4 -subViewSpacing andHeight:otherUserScrollViewH andReleatedView:self.superUserView];
    CGFloat iconBtnSpacing =5;
    CGFloat iconBtnWH = superUserViewH - 2 *iconBtnSpacing;
    [self.iconBtn ViewCenter_UEqualD_NOL:iconBtnSpacing andWidth:iconBtnWH andHeight:iconBtnWH andSuperView:self.superUserView];
    CGFloat onOffBtnMinY =8 *kAppScale;
    CGFloat onOffBtnMinX =self.superUserView.width -iconBtnWH -2 *iconBtnSpacing;
    CGFloat onOffBtnW =iconBtnWH;
    CGFloat onOffBtnH =self.superUserView.height -2 *onOffBtnMinY;
    self.onOffBtn.frame =CGRectMake(onOffBtnMinX, onOffBtnMinY, onOffBtnW, onOffBtnH);
    
    CGFloat nikeNameMaxX =onOffBtnMinX -iconBtnSpacing;
    CGFloat nikeNameMinX = CGRectGetMaxX(self.iconBtn.frame) +iconBtnSpacing;
    CGFloat nikeNameW =nikeNameMaxX - nikeNameMinX;
    self.nikeNameLable.frame =CGRectMake(nikeNameMinX, iconBtnSpacing, nikeNameW, 20);
    
    CGFloat peopleLableMaxY =self.superUserView.height -iconBtnSpacing;
    self.peopleLable.frame =CGRectMake(CGRectGetMinX(self.nikeNameLable.frame), peopleLableMaxY -20, CGRectGetWidth(self.nikeNameLable.frame), 20);
    
    
    

    [self creatAllScrollView];

    
    
  
}
-(void)initAllViews:(CGRect)frame {
    

    
    // 1.添加到父View上
    [self addSubview:self.superUserView];
    [self addSubview:self.peopleRewardBtn];
    [self addSubview:self.otherUserScrollView];
    
    [self.superUserView addSubview:self.iconBtn];
    [self.superUserView addSubview:self.nikeNameLable];
    [self.superUserView addSubview:self.peopleLable];
    [self.superUserView addSubview:self.onOffBtn];
    
    // 2.设置属性
    [self.onOffBtn setBackgroundImage:[UIImage imageWithColor:KeyColor size:self.onOffBtn.size] forState:UIControlStateNormal];
    [self.onOffBtn setBackgroundImage:[UIImage imageWithColor:[UIColor lightGrayColor] size:self.onOffBtn.size] forState:UIControlStateSelected];
    
    [self.iconBtn setBackgroundImage:[UIImage circleImage:[UIImage imageWithColor:[UIColor whiteColor] size:self.iconBtn.size] borderColor:[UIColor redColor] borderWidth:1] forState:UIControlStateNormal];
    [self.iconBtn setBackgroundImage:[UIImage circleImage:[UIImage imageWithColor:[UIColor whiteColor] size:self.iconBtn.size] borderColor:[UIColor redColor] borderWidth:1] forState:UIControlStateSelected];
    

    // 2.测试颜色
    self.superUserView.backgroundColor =[UIColor blackColor];
    self.peopleRewardBtn.backgroundColor =[UIColor brownColor];
    self.otherUserScrollView.backgroundColor =[UIColor blueColor];
    
    self.iconBtn.backgroundColor =[UIColor redColor];
    self.nikeNameLable.backgroundColor =[UIColor yellowColor];
    self.peopleLable.backgroundColor =[UIColor greenColor];
//    self.onOffBtn.backgroundColor =[UIColor darkGrayColor];
    
    
}
-(void)creatAllScrollView {
    
    self.otherUserScrollView.contentSize =CGSizeMake(SCREEN_WIDTH, self.height);
}

#pragma mark - Action Methods

-(void)iconButtonClick:(UIButton *)btn {

    
}

#pragma mark - Setter & Getter

-(void)setHotModel:(int *)hotModel {
    
}

-(UIView *)superUserView {
    if (!_superUserView) {
        _superUserView =[[UIView alloc]init];
        _superUserView.backgroundColor =[UIColor darkGrayColor];
        _superUserView.alpha =0.6;
    }
    return _superUserView;
}

-(UIButton *)iconBtn {
    if (!_iconBtn) {
        _iconBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        [_iconBtn setImage:[UIImage imageNamed:@"private_icon_70x70"] forState:UIControlStateNormal];
        [_iconBtn addTarget:self action:@selector(iconButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _iconBtn;
}

-(UILabel *)nikeNameLable {
    if (!_nikeNameLable) {
        _nikeNameLable =[[UILabel alloc]init];
        _nikeNameLable.font =[UIFont systemFontOfSize:15 *kAppScale];
    }
    return _nikeNameLable;
}
-(UILabel *)peopleLable {
    if (!_peopleLable) {
        _peopleLable =[[UILabel alloc]init];
        _peopleLable.font =[UIFont systemFontOfSize:15 *kAppScale];
    }
    return _peopleLable;
}

-(UIButton *)onOffBtn {
    if (!_onOffBtn) {
        _onOffBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        _onOffBtn.selected =NO;
        [_onOffBtn setTitle:@"开启" forState:UIControlStateNormal];
    }
    return _onOffBtn;
}
-(UIButton *)peopleRewardBtn {
    if (!_peopleRewardBtn) {
        _peopleRewardBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        [_peopleRewardBtn setImage:[UIImage imageNamed:@"cat_food_18x12"] forState:UIControlStateNormal];
        [_peopleRewardBtn setTitle:@"猫粮" forState:UIControlStateNormal];
        _peopleRewardBtn.userInteractionEnabled =NO;
    }
    return _peopleRewardBtn;
}

-(UIScrollView *)otherUserScrollView {
    if (!_otherUserScrollView) {
        _otherUserScrollView =[[UIScrollView alloc]init];
        _otherUserScrollView.bounces =NO;
    }
    return _otherUserScrollView;
    
}
    

@end

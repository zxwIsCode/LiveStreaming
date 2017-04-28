//
//  LSBottomToolsView.m
//  LiveStreaming
//
//  Created by 李保东 on 16/12/31.
//  Copyright © 2016年 李保东. All rights reserved.
//

#import "LSBottomToolsView.h"

@interface LSBottomToolsView ()

@property(nonatomic,strong)NSMutableArray *toolDataArr;

@property(nonatomic,strong)NSMutableArray *allButtonArr;
@end

@implementation LSBottomToolsView

#pragma mark - Init

-(instancetype)initWithFrame:(CGRect)frame {
    if (self =[super initWithFrame:frame]) {
        self.toolDataArr =[@[@"talk_public_40x40",@"talk_private_40x40",@"talk_sendgift_40x40",@"talk_rank_40x40",@"talk_share_40x40",@"talk_close_40x40"]mutableCopy];
        [self initAllViews];
        
    }
    return self;
}
-(void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat buttonSuperLeft =15 *kAppScale;
    CGFloat buttonItemSpacing =10 *kAppScale;
    NSInteger buttonCount =self.toolDataArr.count;
    CGFloat buttonWH = (self.width -buttonSuperLeft *2 -(buttonCount-1)*buttonItemSpacing)/6.0;
    for (int index =0; index <self.allButtonArr.count; index ++) {
        UIButton *button =self.allButtonArr[index];
        CGFloat buttonX =buttonSuperLeft +index *(buttonWH +buttonItemSpacing);
        button.frame =CGRectMake(buttonX, 0, buttonWH, buttonWH);
    }
}

#pragma mark - PrivateMethods


-(void)initAllViews {
    
    for (int index =0; index <6; index ++) {
        UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:self.toolDataArr[index]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(fouctionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag =index;
        [self.allButtonArr addObject:btn];
        [self addSubview:btn];
    }

}
#pragma mark - Action Methods

-(void)fouctionBtnClick:(UIButton *)button {
    
    DDLog(@"点击了第%ld个button",button.tag);
    
}
#pragma mark - Setter & Getter

-(NSMutableArray *)toolDataArr {
    if (!_toolDataArr) {
        _toolDataArr =[NSMutableArray array];
    }
    return _toolDataArr;
}
-(NSMutableArray *)allButtonArr {
    if (!_allButtonArr) {
        _allButtonArr =[NSMutableArray array];
    }
    return _allButtonArr;
}
@end

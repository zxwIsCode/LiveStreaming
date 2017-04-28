//
//  LSRelatedAnchorView.m
//  LiveStreaming
//
//  Created by 李保东 on 16/12/31.
//  Copyright © 2016年 李保东. All rights reserved.
//

#import "LSRelatedAnchorView.h"

@interface LSRelatedAnchorView ()

@property(nonatomic,strong)UIImageView *relatedAnchorView;

@end

@implementation LSRelatedAnchorView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self =[super initWithFrame:frame]) {
        [self addSubview:self.relatedAnchorView];
    }
    return self;
}
-(void)layoutSubviews {
    [super layoutSubviews];
    
    self.relatedAnchorView.frame =self.bounds;
    
    self.relatedAnchorView.backgroundColor =[UIColor blueColor];
    
}
-(UIImageView *)relatedAnchorView {
    if (!_relatedAnchorView) {
        _relatedAnchorView =[[UIImageView alloc]init];
        _relatedAnchorView.layer.cornerRadius =40 *kAppScale;
        _relatedAnchorView.layer.masksToBounds =YES;
        _relatedAnchorView.userInteractionEnabled =YES;
        
    }
    return _relatedAnchorView;
}

@end

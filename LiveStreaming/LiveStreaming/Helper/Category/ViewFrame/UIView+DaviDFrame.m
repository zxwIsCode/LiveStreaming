//
//  UIView+DaviDFrame.m
//  LiveStreaming
//
//  Created by 李保东 on 16/12/31.
//  Copyright © 2016年 李保东. All rights reserved.
//

#import "UIView+DaviDFrame.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

#define kAppScale SCREEN_WIDTH/375.0f


@implementation UIView (DaviDFrame)

//1.自身单独布局(2个方法：以Original开头)

//仍然用CGRect（Original_Frame）
-(void)Original_FrameX:(CGFloat)x andY:(CGFloat)y andWidth:(CGFloat)Width andHeight:(CGFloat)Height {
    self.frame =CGRectMake(x *kAppScale, y *kAppScale, Width *kAppScale, Height *kAppScale);
}
//用方法代替center 和bounds  （Original_Center）
-(void)Original_CenterX:(CGFloat)centerX andCenterY:(CGFloat)centerY andWidth:(CGFloat)Width andHeight:(CGFloat)Height {
    self.bounds =CGRectMake(0, 0, Width *kAppScale, Height *kAppScale);
    self.center =CGPointMake(centerX *kAppScale, centerY *kAppScale);
}
//2.View之间的布局（6个方法：以ViewFrame开头）
//只有X相对  自定义尺寸 相对的View
-(void)ViewFrame_OnlyX:(CGFloat)distanceX andWidth:(CGFloat)Width andHeight:(CGFloat)Height andReleatedView:(UIView *)releatedView {
    
    self.frame =CGRectMake(CGRectGetMaxX(releatedView.frame) +distanceX *kAppScale, CGRectGetMinY(releatedView.frame), Width *kAppScale, Height *kAppScale);
    
}

//只有Y相对  自定义尺寸 相对的View
-(void)ViewFrame_OnlyY:(CGFloat)distanceY andWidth:(CGFloat)Width andHeight:(CGFloat)Height andReleatedView:(UIView *)releatedView {
    
    self.frame =CGRectMake(CGRectGetMinX(releatedView.frame), CGRectGetMaxY(releatedView.frame) +distanceY *kAppScale, Width *kAppScale, Height *kAppScale);
}
//XY都相对   自定义尺寸  相对的View
-(void)ViewFrame_BothX:(CGFloat)distanceX andFrameY:(CGFloat)distanceY andWidth:(CGFloat)Width andHeight:(CGFloat)Height andReleatedView:(UIView *)releatedView {
    
    self.frame =CGRectMake(CGRectGetMaxX(releatedView.frame) +distanceX, CGRectGetMaxY(releatedView.frame) +distanceY, Width, Height);

}

//子View距离父View的底部和左侧一定View距离的情况
-(void)ViewFrame_Left_BottomY:(CGFloat)y andLeftX:(CGFloat)x andWidth:(CGFloat)Width andHeight:(CGFloat)Height andReleatedView:(UIView *)superView{
    
    self.frame =CGRectMake(x *kAppScale, CGRectGetHeight(superView.frame) - y *kAppScale -Height *kAppScale, Width *kAppScale, Height *kAppScale);
}

//子View距离父View的右部和上侧一定View距离的情况
-(void)ViewFrame_Up_RightX:(CGFloat)x andUpY:(CGFloat)y andWidth:(CGFloat)Width andHeight:(CGFloat)Height andReleatedView:(UIView *)superView {
    self.frame =CGRectMake(CGRectGetWidth(superView.frame) -Width *kAppScale -x *kAppScale, y *kAppScale, Width *kAppScale, Height *kAppScale);
}
//子View距离父View的底部不等和左右相等的情况
-(void)ViewFrame_LEqualR_BottomY:(CGFloat)y andLEqualRX:(CGFloat)x  andHeight:(CGFloat)Height andReleatedView:(UIView *)superView {
    
    self.frame =CGRectMake(x *kAppScale, CGRectGetHeight(superView.frame) -y *kAppScale -Height *kAppScale, CGRectGetWidth(superView.frame) -2 *x *kAppScale, Height *kAppScale);
}

//3.父子View之间的布局（倾向center方面）（4个方法：以ViewCenter开头）

//子View处于父View正中间（包括这种情况：子View和父View大小,位置一样）
-(void)ViewCenter_EqualSendXYSpacingX:(CGFloat)spacingX andSpcingY:(CGFloat)spacingY andSuperView:(UIView *)superView { // (知道父子View之间的间隙大小)

    self.frame =CGRectMake(spacingX, spacingY, (superView.width -2 *spacingX) *kAppScale, (superView.height -2 *spacingY)*kAppScale);

}
-(void)ViewCenter_EqualSendWHSpacingWidth:(CGFloat)width andHeight:(CGFloat)Height andSuperView:(UIView *)superView {// (知道子View宽度和高度)

    self.frame =CGRectMake((superView.width -width)*0.5, (superView.height -Height)*0.5, width, Height);
}
//子View 上下间距保持一致 左右间距不一致
//[UEqualBLable ViewCenter_UEqualD_NOL:20 andWidth:100 andHeight:120 andSuperView:superView];

-(void)ViewCenter_UEqualD_NOL:(CGFloat)leftX andWidth:(CGFloat)width andHeight:(CGFloat)Height andSuperView:(UIView *)superView {
    
    self.frame =CGRectMake(leftX, (CGRectGetHeight(superView.frame) -Height) *0.5, width, Height);

    
}
//子View 左右间距保持一致 上下间距不一致
-(void)ViewCenter_LEqualR_NOU:(CGFloat)upY andWidth:(CGFloat)width andHeight:(CGFloat)Height andSuperView:(UIView *)superView {
    
    self.frame =CGRectMake((CGRectGetWidth(superView.frame) -width) *0.5, upY, width, Height);
}

@end

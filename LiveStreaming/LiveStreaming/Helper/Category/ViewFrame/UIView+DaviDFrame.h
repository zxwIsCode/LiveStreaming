//
//  UIView+DaviDFrame.h
//  LiveStreaming
//
//  Created by 李保东 on 16/12/31.
//  Copyright © 2016年 李保东. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIView+Frame.h"


@interface UIView (DaviDFrame)
/*
 使用须知：
 1.项目中，到处用到CGRect 的方法，感觉特别的恶心，有点强迫症，所以就想试着实现一个方法解决无论是自身布局还是View之间的相对布局的问题
 2.该View中的方法已经实现了自己iPhone5，iPhone5s，iPhone6，iPhone6s，iPhone6P，iPhone7，iPhone7P，
 等的适配
 3.常用的方法有以下12个方法，其余还有需要的请case我：QQ1824496534
 常用的10个方法，很简单的，都是以大写字母打头的，详情见方法注释之后的介绍
 每个字母的用意：如
 第一个字母：Original 代表以下所有方法分为3个种类
 第二个字母: 代表不同布局的内部区分
 
 */

//1.自身单独布局(2个方法：以Original开头)

//仍然用CGRect（Original_Frame）
-(void)Original_FrameX:(CGFloat)x andY:(CGFloat)y andWidth:(CGFloat)Width andHeight:(CGFloat)Height;
//用方法代替center 和bounds  （Original_Center）
-(void)Original_CenterX:(CGFloat)centerX andCenterY:(CGFloat)centerY andWidth:(CGFloat)Width andHeight:(CGFloat)Height;
//2.View之间的布局（6个方法：以ViewFrame开头）

//只有X相对  自定义尺寸 相对的View
-(void)ViewFrame_OnlyX:(CGFloat)distanceX andWidth:(CGFloat)Width andHeight:(CGFloat)Height andReleatedView:(UIView *)releatedView;
//只有Y相对  自定义尺寸 相对的View
-(void)ViewFrame_OnlyY:(CGFloat)distanceY andWidth:(CGFloat)Width andHeight:(CGFloat)Height andReleatedView:(UIView *)releatedView;
//XY都相对   自定义尺寸  相对的View
-(void)ViewFrame_BothX:(CGFloat)distanceX andFrameY:(CGFloat)distanceY andWidth:(CGFloat)Width andHeight:(CGFloat)Height andReleatedView:(UIView *)releatedView;

//子View距离父View的底部和左侧一定View距离的情况
-(void)ViewFrame_Left_BottomY:(CGFloat)y andLeftX:(CGFloat)x andWidth:(CGFloat)Width andHeight:(CGFloat)Height andReleatedView:(UIView *)superView;
//子View距离父View的右部和上侧一定View距离的情况
-(void)ViewFrame_Up_RightX:(CGFloat)x andUpY:(CGFloat)y andWidth:(CGFloat)Width andHeight:(CGFloat)Height andReleatedView:(UIView *)superView;
//子View距离父View的底部不等和左右相等的情况
-(void)ViewFrame_LEqualR_BottomY:(CGFloat)y andLEqualRX:(CGFloat)x  andHeight:(CGFloat)Height andReleatedView:(UIView *)superView;

//3.父子View之间的布局（倾向center方面）（4个方法：以ViewCenter开头）

//子View处于父View正中间（包括这种情况：子View和父View大小,位置一样）
-(void)ViewCenter_EqualSendXYSpacingX:(CGFloat)spacingX andSpcingY:(CGFloat)spacingY andSuperView:(UIView *)superView;// (知道父子View之间的间隙大小)
-(void)ViewCenter_EqualSendWHSpacingWidth:(CGFloat)width andHeight:(CGFloat)Height andSuperView:(UIView *)superView;// (知道子View宽度和高度)

//子View 上下间距保持一致 左右间距不一致
-(void)ViewCenter_UEqualD_NOL:(CGFloat)leftX andWidth:(CGFloat)width andHeight:(CGFloat)Height andSuperView:(UIView *)superView;
//子View 左右间距保持一致 上下间距不一致
-(void)ViewCenter_LEqualR_NOU:(CGFloat)upY andWidth:(CGFloat)width andHeight:(CGFloat)Height andSuperView:(UIView *)superView;

@end

//
//  LSHomeHotDetailViewController.h
//  LiveStreaming
//
//  Created by 李保东 on 16/12/30.
//  Copyright © 2016年 李保东. All rights reserved.
//

#import "LSBaseViewController.h"
#import "LSHomeHotModel.h"

@interface LSHomeHotDetailViewController : LSBaseViewController
// 当前的直播
@property(nonatomic,strong)LSHomeHotModel *hotModel;
// 下一个直播（相关的直播）
@property(nonatomic,strong)LSHomeHotModel *nextHotModel;

@end

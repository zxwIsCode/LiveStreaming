//
//  LSHomeHotCell.h
//  LiveStreaming
//
//  Created by 李保东 on 16/12/30.
//  Copyright © 2016年 李保东. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSHomeHotModel.h"
@interface LSHomeHotCell : UITableViewCell

@property(nonatomic,strong)LSHomeHotModel *hotModel;

+(instancetype)updateWithTableView:(UITableView *)tableView;
@end

//
//  LSHomeHotCell.m
//  LiveStreaming
//
//  Created by 李保东 on 16/12/30.
//  Copyright © 2016年 李保东. All rights reserved.
//

#import "LSHomeHotCell.h"

#define kLSHomeHotCellId  @"kLSHomeHotCellId"

@interface LSHomeHotCell ()

@property(nonatomic,strong)UIView *infoSuperVieww;

@property(nonatomic,strong)UIImageView *iconImageView;

@property(nonatomic,strong)UILabel *nickNameLable;

@property(nonatomic,strong)UIButton *placeBtn;

@property(nonatomic,strong)UIImageView *startImage;

@property(nonatomic,strong)UILabel *peopleLookLable;

@property(nonatomic,strong)UIImageView *bigImageView;

@end

@implementation LSHomeHotCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+(instancetype)updateWithTableView:(UITableView *)tableView {
    static NSString *ID = kLSHomeHotCellId;
    LSHomeHotCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[LSHomeHotCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;

}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //1.布局frame
        
        //2.
    }
    return self;
}


@end

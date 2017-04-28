//
//  LSHomeHotCell.m
//  LiveStreaming
//
//  Created by 李保东 on 16/12/30.
//  Copyright © 2016年 李保东. All rights reserved.
//

#import "LSHomeHotCell.h"

#define kLSHomeHotCellId  @"kLSHomeHotCellId"

#define KeyColor Color(216, 41, 116)

#define kNickNameLableFont 13 *kAppScale


@interface LSHomeHotCell ()

@property(nonatomic,strong)UIView *infoSuperView;

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
        cell.selectedBackgroundView =[[UIView alloc]init];
    }
    return cell;

}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //1.初始化
        self.infoSuperView =[[UIView alloc]init];
        self.iconImageView =[[UIImageView alloc]init];
        self.nickNameLable =[[UILabel alloc]init];
        self.placeBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        self.startImage =[[UIImageView alloc]init];
        self.peopleLookLable =[[UILabel alloc]init];
        self.bigImageView =[[UIImageView alloc]init];
        
        
        //2.布局frame
        CGFloat itemSpacing =5 *kAppScale;
        CGFloat bigItemSpacing =2 *itemSpacing;
        CGFloat iconWH =44 *kAppScale;
        
        self.infoSuperView.frame =CGRectMake(0, 0, SCREEN_WIDTH, 54 *kAppScale);
        self.iconImageView.frame =CGRectMake(itemSpacing, itemSpacing, iconWH, iconWH);
        self.nickNameLable.frame =CGRectMake(CGRectGetMaxX(self.iconImageView.frame) +bigItemSpacing, itemSpacing, 100 *kAppScale, 20 *kAppScale);
        self.placeBtn.frame =CGRectMake(CGRectGetMinX(self.nickNameLable.frame), CGRectGetMaxY(self.nickNameLable.frame) +itemSpacing, 60 *kAppScale, 20 *kAppScale);
        self.startImage.frame =CGRectMake(CGRectGetMaxX(self.nickNameLable.frame) +itemSpacing, itemSpacing, 20 *40/19.0 *kAppScale, 20  *kAppScale);
        CGFloat pepleLookLableW =100 *kAppScale;
        self.peopleLookLable.frame =CGRectMake(SCREEN_WIDTH - itemSpacing -pepleLookLableW, CGRectGetMinY(self.placeBtn.frame), pepleLookLableW, CGRectGetHeight(self.placeBtn.frame));
        
        self.bigImageView.frame =CGRectMake(0, CGRectGetMaxY(self.infoSuperView.frame), SCREEN_WIDTH, 300 *kAppScale);
                                        
        //3.设置基本属性
        [self.placeBtn setImage:[UIImage imageNamed:@"home_location_8x8"] forState:UIControlStateNormal];
        self.placeBtn.titleLabel.font =[UIFont systemFontOfSize:10 *kAppScale];
        [self.placeBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        self.placeBtn.titleEdgeInsets =UIEdgeInsetsMake(0, 10, 0, 0);
        self.placeBtn.imageEdgeInsets =UIEdgeInsetsMake(0, 5, 0, 10);
        
        self.placeBtn.userInteractionEnabled =NO;
        
        self.nickNameLable.font =[UIFont systemFontOfSize:kNickNameLableFont];
        
        self.peopleLookLable.font =[UIFont systemFontOfSize:13 *kAppScale];
        
        self.iconImageView.layer.cornerRadius =iconWH *0.5;
        self.iconImageView.layer.masksToBounds =YES;
        
        
        //4.添加到父View上
        [self.contentView addSubview:self.infoSuperView];
        [self.contentView addSubview:self.bigImageView];

        [self.infoSuperView addSubview:self.iconImageView];
        [self.infoSuperView addSubview:self.nickNameLable];
        [self.infoSuperView addSubview:self.placeBtn];
        [self.infoSuperView addSubview:self.startImage];
        [self.infoSuperView addSubview:self.peopleLookLable];

        
        //5.添加测试颜色
        
//        self.infoSuperView.backgroundColor =[UIColor redColor];
//        self.bigImageView.backgroundColor =[UIColor whiteColor];
//        self.iconImageView.backgroundColor =[UIColor blueColor];
//        self.nickNameLable.backgroundColor =[UIColor yellowColor];
//        self.placeBtn.backgroundColor =[UIColor purpleColor];
//        self.startImage.backgroundColor =[UIColor brownColor];
//        self.peopleLookLable.backgroundColor =[UIColor greenColor];

        
    }
    return self;
}

-(void)setHotModel:(LSHomeHotModel *)hotModel {
    _hotModel =hotModel;
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:hotModel.smallpic] placeholderImage:nil];
    [self.bigImageView sd_setImageWithURL:[NSURL URLWithString:hotModel.bigpic] placeholderImage:[UIImage imageNamed:@"profile_user_414x414"]];

    self.nickNameLable.text =hotModel.myname;
    CGSize infoSize = CGSizeMake(SCREEN_WIDTH -30 -CGRectGetWidth(self.iconImageView.frame), MAXFLOAT);
    NSDictionary *dic = @{NSFontAttributeName : [UIFont systemFontOfSize:kNickNameLableFont ]};
    CGFloat itemSpacing =5 *kAppScale;
    CGRect nickNameLabelFrame =[hotModel.myname boundingRectWithSize:infoSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    self.nickNameLable.frame =CGRectMake(CGRectGetMaxX(self.iconImageView.frame) +itemSpacing, itemSpacing, nickNameLabelFrame.size.width, nickNameLabelFrame.size.height);
    self.placeBtn.frame =CGRectMake(CGRectGetMinX(self.nickNameLable.frame), CGRectGetMaxY(self.nickNameLable.frame) +itemSpacing, 60 *kAppScale, 20 *kAppScale);
    CGFloat startImageX = CGRectGetMaxX(self.nickNameLable.frame)>CGRectGetMaxX(self.placeBtn.frame)?CGRectGetMaxX(self.nickNameLable.frame):CGRectGetMaxX(self.placeBtn.frame) ;
    self.startImage.frame =CGRectMake(startImageX +itemSpacing, itemSpacing, 20 *40/19.0 *kAppScale, 20  *kAppScale);
    
    self.startImage.image  = hotModel.starImage;
    self.startImage.hidden = !hotModel.starlevel;
    if (!hotModel.gps.length) {
        hotModel.gps = @"喵星";
    }
    [self.placeBtn setTitle:hotModel.gps forState:UIControlStateNormal];
    NSString *fullChaoyang = [NSString stringWithFormat:@"%@人在看", hotModel.allnum];
    NSRange range = [fullChaoyang rangeOfString:[NSString stringWithFormat:@"%@", hotModel.allnum]];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:fullChaoyang];
    [attr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:17] range: range];
//    [attr addAttribute:NSForegroundColorAttributeName value:KeyColor range:range];
    self.peopleLookLable.attributedText = attr;
    
}


@end

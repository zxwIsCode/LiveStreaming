//
//  LSHomeHotModel.m
//  LiveStreaming
//
//  Created by 李保东 on 16/12/30.
//  Copyright © 2016年 李保东. All rights reserved.
//

#import "LSHomeHotModel.h"

@implementation LSHomeHotModel
+(instancetype)updateWithDic:(NSDictionary *)dic {
    return [[self alloc]initWithDic:dic];
}

-(instancetype)initWithDic:(NSDictionary *)dic {
    if (self =[super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
-(void)setValue:(id)value forUndefinedKey:(nonnull NSString *)key {

}

- (UIImage *)starImage
{
    if (self.starlevel) {
        return [UIImage imageNamed:[NSString stringWithFormat:@"girl_star%@_40x19", self.starlevel]];
    }
    return nil;
}

@end

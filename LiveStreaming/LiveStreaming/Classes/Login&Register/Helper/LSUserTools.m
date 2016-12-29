//
//  LSUserTools.m
//  LiveStreaming
//
//  Created by 李保东 on 16/12/29.
//  Copyright © 2016年 李保东. All rights reserved.
//

#import "LSUserTools.h"

@implementation LSUserTools

// 是否已经登录
+(BOOL)isAreadyLogin  {
    return [CMUserDefaults getFromLocalBool:kIsLogin];
}

// 保存登录的数据
+(void)saveLoginData:(BOOL)isLogin {
    [CMUserDefaults saveLocalBool:isLogin andKey:kIsLogin];
}

// 获得登录的用户信息
+(BOOL )getLoginData {
    return [CMUserDefaults getFromLocalBool:kIsLogin];

}
@end

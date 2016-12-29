//
//  LSUserTools.h
//  LiveStreaming
//
//  Created by 李保东 on 16/12/29.
//  Copyright © 2016年 李保东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSUserTools : NSObject

// 是否已经登录
+(BOOL)isAreadyLogin ;

// 保存登录的数据
+(void)saveLoginData:(BOOL)isLogin;

// 获得登录的用户信息
+(BOOL)getLoginData;




@end

//
//  YZKUserMessage.h
//  Categories
//
//  Created by 佳冬  on 15/10/22.
//  Copyright © 2015年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZKUserMessage : NSObject<NSCoding>
/**
 *  账号
 */
@property (nonatomic, copy) NSString *loginId;
/**
 *  用户名
 */
@property (nonatomic, copy) NSString *userName;
/**
 *  用户密码
 */
@property (nonatomic, copy) NSString *passWord;
/**
 *  用户头象
 */
@property (nonatomic, copy) NSString *icon;
/**
 *  自动登录状态
 */
@property (nonatomic, assign) BOOL isLogin;

@end

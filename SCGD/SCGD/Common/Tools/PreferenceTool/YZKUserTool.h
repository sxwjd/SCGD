//
//  YZKUserTool.h
//  Categories
//
//  Created by 佳冬  on 15/10/22.
//  Copyright © 2015年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YZKUserMessage.h"
#define LATESTUSER @"latestUser"
#define SECONDUSER @"secondUser"
#define THIRDUSER  @"thirdUser"
@interface YZKUserTool : NSObject
/**
 *  索要存储的信息
 */
@property (nonatomic, strong) YZKUserMessage *userMessage;
/**
 *  存储信息工具的单例
 *
 *  @return 工具对象
 */
+(YZKUserTool *)tool;
/**
 *  存储信息
 */
-(void)storeUserMessage;
/**
 *  获取信息
 *
 *  @return YZKUserMessage  所获得的信息
 */
-(YZKUserMessage *)getUserMessage;

#pragma mark ---存储3个账号

/**
 *  最近一次登录的账号信息
 */
@property (nonatomic, strong) YZKUserMessage *lastestUser;
/**
 *  存储多个账号信息
 *
 *  @param user 最近登录的账号
 */
- (void)storeUsers:(YZKUserMessage *)user;
/**
 *  获取多个账号信息
 *
 *  @return 所有存储的账号信息
 */
- (NSArray *)getUsers;
- (void)deleteUser:(YZKUserMessage *)user;
@end

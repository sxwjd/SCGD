//
//  MineDataController.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/22.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UserMessage;

@interface MineDataController : NSObject
/**
 *  个人信息数据
 */
@property (nonatomic, strong) UserMessage *userMessage;
/**
 修改密码
 
 @param callback 错误返回
 */
- (void)getUserMessageWithCallback:(void(^)(void))callback;
@end

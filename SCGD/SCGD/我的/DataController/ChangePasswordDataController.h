//
//  ChangePasswordDataController.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/21.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChangePasswordDataController : NSObject
/**
 修改密码
 
 @param callback 错误返回
 */
- (void)changePasswordWithParm:(NSDictionary*)param Callback:(void(^)(void))callback;
@end

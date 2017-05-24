//
//  PrivateContactDetailController.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/20.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PrivateContactDetailController : NSObject
/**
 * 私人通讯录组详情数据
 */
@property (nonatomic, strong) NSMutableArray *privateContactSectionDetailArr;
/**
 请求私人通讯录组详情列表
 
 @param callback 错误返回
 */
- (void)requestPrivateContactSectionDetailDataWithParm:(NSDictionary*)param Callback:(void(^)(NSError *error))callback;
@end

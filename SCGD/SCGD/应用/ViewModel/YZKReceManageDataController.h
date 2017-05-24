//
//  YZKReceManageDataController.h
//  SCGD
//
//  Created by Lizeyu on 16/10/21.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Completion)(void);

@interface YZKReceManageDataController : NSObject

/** 收文 管理 返回数据 */
@property (nonatomic, copy) NSMutableArray *dataList;

- (void)requestDataWithParams:(NSDictionary *)params success:(Completion)completion failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure;


@end

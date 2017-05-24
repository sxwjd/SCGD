//
//  YZKMeetReserveDataController.h
//  SCGD
//
//  Created by Lizeyu on 16/10/21.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Completion)(void);

@interface YZKMeetReserveDataController : NSObject
/** 预约管理 管理 返回数据 */
@property (nonatomic, strong) NSMutableArray *dataList;

- (void)requestDataForAllReserverWithParams:(NSDictionary *)params success:(Completion)completion failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure;

- (void)requestDataForMeetingRoomNameWithCompletion:(Completion)completion;

- (void)requestDatAForSpecifyMeetingRoomId:(NSString *)roomId success:(Completion)completion failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure;
@end

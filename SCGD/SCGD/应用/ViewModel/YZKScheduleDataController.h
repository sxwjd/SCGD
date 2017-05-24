//
//  YZKScheduleDataController.h
//  SCGD
//
//  Created by Lizeyu on 16/10/25.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ScheduleType) {
    individualType    =   0,   // 个人日程
    taskType            =   1      // 工作日程
};




@interface YZKScheduleDataController : NSObject

/** monthList */
@property (nonatomic, copy) NSMutableArray *dataList;

- (void)requestDataWithScheduleType:(ScheduleType)type params:(NSDictionary *)params success:(void(^)(void))completion failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure;

- (void)requestDataWithScheduleType:(ScheduleType)type specifyYearMonth:(NSString *)yearMonth params:(NSDictionary *)params success:(void (^)(void))completion failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure;

- (void)requestDataWithScheduleType:(ScheduleType)type specifyYearMonthDay:(NSString *)yearMonthDay params:(NSDictionary *)params success:(void (^)(void))completion failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure;


@end

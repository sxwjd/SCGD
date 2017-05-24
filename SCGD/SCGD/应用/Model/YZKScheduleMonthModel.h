//
//  YZKScheduleMonthModel.h
//  SCGD
//
//  Created by Lizeyu on 16/10/25.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YZKScheduleModel;
@interface YZKScheduleMonthModel : NSObject
/** date */
@property (nonatomic, copy) NSString *date;
/** schedule model */
@property (nonatomic, copy) NSArray *scheduler;

/** task schedule  */
@property (nonatomic, copy) NSArray *workScheduler;

@property (nonatomic, strong) NSMutableArray *scheduleModels;

+ (instancetype)modelWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end

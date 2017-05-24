//
//  YZKScheduleModel.h
//  SCGD
//
//  Created by Lizeyu on 16/10/25.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZKScheduleModel : NSObject
/** content */
@property (nonatomic, copy) NSString *content;
/** content */
@property (nonatomic, copy) NSString *startTime;
/** content */
@property (nonatomic, copy) NSString *endTime;

+ (instancetype)modelWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end

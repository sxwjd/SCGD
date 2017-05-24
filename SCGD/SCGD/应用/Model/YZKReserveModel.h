//
//  YZKReserveModel.h
//  SCGD
//
//  Created by Lizeyu on 16/10/20.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZKReserveModel : NSObject
/** address */
@property (nonatomic, copy) NSString *roomName;
/** person */
@property (nonatomic, copy) NSString *userName;
/** startTime  */
@property (nonatomic, copy) NSString *startTime;
/** endTime  */
@property (nonatomic, copy) NSString *endTime;
/** create time */
@property (nonatomic, copy) NSNumber *createDate;
@property (nonatomic, assign) NSUInteger id;

+ (instancetype)modelWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end

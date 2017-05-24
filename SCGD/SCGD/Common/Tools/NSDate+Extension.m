//
//  NSDate+Extension.m
//  SCGD
//
//  Created by Lizeyu on 16/10/21.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

+ (NSString *)dateFromInterval:(NSNumber*)interval{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate *date = [self dateWithTimeIntervalSince1970:[interval doubleValue] / 1000];
    NSString *currentDateStr = [dateFormatter stringFromDate:date];
    return  currentDateStr;
}

@end

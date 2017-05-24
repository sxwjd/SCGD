//
//  UITableView+YZKCellStyle.m
//  SCGD
//
//  Created by Lizeyu on 16/10/19.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "UITableView+YZKCellStyle.h"

@implementation UITableView (YZKCellStyle)

- (YZKCommonCell *)commonCell{
    static NSString *const commonCellReuseId = @"commonCellReuseId";
    YZKCommonCell *commonCell = [self dequeueReusableCellWithIdentifier:commonCellReuseId];
    if (commonCell == nil) {
        commonCell = [[YZKCommonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:commonCellReuseId];
    }
    return commonCell;
}

- (YZKReserveCell *)reserverCell{
    static NSString *const reserverCellReuseId = @"reserverCellReuseId";
    YZKReserveCell *reserveCell = [self dequeueReusableCellWithIdentifier:reserverCellReuseId];
    if (reserveCell == nil) {
        reserveCell = [[YZKReserveCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reserverCellReuseId];
    }
    return reserveCell;
}

- (YZKSingleLineCell *)singleLineCell{
    static NSString *const singleLineCellReuseId = @"singleLineCellReuseId";
    YZKSingleLineCell *singleLineCell = [self dequeueReusableCellWithIdentifier:singleLineCellReuseId];
    if (singleLineCell == nil) {
        singleLineCell = [[YZKSingleLineCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:singleLineCellReuseId];
    }
    return singleLineCell;
}

- (YZKNoteCell *)noteCell{
    static NSString *const noteCellReuseId = @"noteCellReuseId";
    YZKNoteCell *noteCell = [self dequeueReusableCellWithIdentifier:noteCellReuseId];
    if (noteCell == nil) {
        noteCell = [[YZKNoteCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:noteCellReuseId];
    }
    return noteCell;
}

- (YZKScheduleCell *)scheduleCell{
    static NSString *const scheduleCellReuseId = @"scheduleCellReuseId";
    YZKScheduleCell *scheduleCell = [self dequeueReusableCellWithIdentifier:scheduleCellReuseId];
    if (scheduleCell == nil) {
        scheduleCell = [[YZKScheduleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:scheduleCellReuseId];
    }
    return scheduleCell;
}

- (YZKScheduleDayCell *)scheduleDayCell{
    static NSString *const scheduleDayCellReuseId = @"scheduleDayCellReuseId";
    YZKScheduleDayCell *scheduleDyaCell = [self dequeueReusableCellWithIdentifier:scheduleDayCellReuseId];
    if (scheduleDyaCell == nil) {
        scheduleDyaCell = [[YZKScheduleDayCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:scheduleDayCellReuseId];
    }
    return scheduleDyaCell;
}

/** 系统 默认 cell */
- (UITableViewCell *)systemDefaultCell {
    static NSString *const systemDefaultCellReuseId = @"systemDefaultCellReuseId";
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:systemDefaultCellReuseId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:systemDefaultCellReuseId];
        cell.textLabel.textColor = UIColorRGB(0x333333);
        cell.textLabel.font = [UIFont systemFontOfSize:17];
    }
    return cell;
}

/** 系统 subtitleCell*/
- (UITableViewCell *)systemSubtitleCell {
    static NSString *const systemSubtitleCellReuseId = @"systemSubtitleCellReuseId";
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:systemSubtitleCellReuseId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:systemSubtitleCellReuseId];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textColor = UIColorRGB(0x333333);
        cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
        cell.detailTextLabel.textColor = UIColorRGB(0x666666);
    }
    return cell;
}


/** 系统 systemValue1 Cell */
- (UITableViewCell *)systemValue1Cell {
    static NSString *const systemValue1CellReuseId = @"systemValue1CellReuseId";
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:systemValue1CellReuseId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:systemValue1CellReuseId];
        cell.textLabel.textColor = UIColorRGB(0x333333);
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.detailTextLabel.textColor = UIColorRGB(0x666666);
        cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

/** 系统 systemValue2 Cell */
- (UITableViewCell *)systemValue2Cell {
    static NSString *const systemValue2CellReuseId = @"systemValue2CellReuseId";
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:systemValue2CellReuseId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:systemValue2CellReuseId];
    }
    return cell;
}

@end

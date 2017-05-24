//
//  UITableView+YZKCellStyle.h
//  SCGD
//
//  Created by Lizeyu on 16/10/19.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YZKCommonCell.h"
#import "YZKReserveCell.h"
#import "YZKSingleLineCell.h"
#import "YZKNoteCell.h"
#import "YZKScheduleCell.h"
#import "YZKScheduleDayCell.h"

typedef NS_ENUM(NSInteger, YZKCellStyle) {
    YZKCellCommon   = 0,         // 左2  右2  右上角label可隐藏
    YZKCellSingleLine = 1,         // 一条单独展示信息  cell
    YZKCellReserve    = 2,         // 左三 右一  预约cell
    YZKCellNote         = 3,         // 备忘录 cell
    YZKCellSchedule   = 4,         // 个人/工作 日程cell
    YZKCellDefault     = 5,         // 左侧显示textLabel（不显示detailTextLabel），imageView可选（显示在最左边）
    YZKCellSubtitle     = 6,         // 左上方显示textLabel，左下方显示detailTextLabel（默认灰色）,imageView可选（显示在最左边）
    YZKCellValue1      = 7,         // 左侧显示textLabel、右侧显示detailTextLabel（默认蓝色），imageView可选（显示在最左边）
    YZKCellValue2      = 8,          // 左侧依次显示textLabel(默认蓝色)和detailTextLabel，imageView可选（显示在最左边）
    YZKCellScheduleDay   =  9
};


@interface UITableView (YZKCellStyle)

/** 通用cell */
- (YZKCommonCell *)commonCell;
/** 预约cel */
- (YZKReserveCell *)reserverCell;
/** 单行信息cell */
- (YZKSingleLineCell *)singleLineCell;
/** 备忘录cell */
- (YZKNoteCell *)noteCell;
/** 日程cell */
- (YZKScheduleCell *)scheduleCell;
/** 日程 day cell */
- (YZKScheduleDayCell *)scheduleDayCell;
/** 系统 默认 cell */
- (UITableViewCell *)systemDefaultCell;
/** 系统 subtitleCell*/
- (UITableViewCell *)systemSubtitleCell;
/** 系统 systemValue1 Cell */
- (UITableViewCell *)systemValue1Cell;
/** 系统 systemValue2 Cell */
- (UITableViewCell *)systemValue2Cell;

@end

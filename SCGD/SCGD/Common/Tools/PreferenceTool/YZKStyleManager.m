//
//  YZKStyleManager.m
//  SCGD
//
//  Created by Lizeyu on 16/10/19.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKStyleManager.h"

@implementation YZKStyleManager


+ (UITableViewCell *)initCellWithCellType:(YZKCellStyle)cellStyle forTableView:(UITableView *)tableView{
    switch (cellStyle) {
        case YZKCellCommon:
        {
            return [tableView commonCell];
        }
            break;
        case YZKCellReserve:
        {
            return [tableView reserverCell];
        }
            break;
        case YZKCellSingleLine:
        {
            return [tableView singleLineCell];
            break;
        }
        case YZKCellNote:
        {
            return [tableView noteCell];
            break;
        }
        case YZKCellDefault:
        {
            return  [tableView systemDefaultCell];
        }
            break;
        case YZKCellSubtitle:
        {
            return  [tableView systemSubtitleCell];
        }
            break ;
        case YZKCellValue1:
        {
            return  [tableView systemValue1Cell];
        }
            break ;
        case YZKCellValue2:
        {
            return  [tableView systemValue2Cell];
        }
            break ;
        case YZKCellSchedule:
        {
            return  [tableView scheduleCell];
        }
            break;
        case YZKCellScheduleDay:
        {
            return  [tableView scheduleDayCell];
        }
            break;
    }
}

@end

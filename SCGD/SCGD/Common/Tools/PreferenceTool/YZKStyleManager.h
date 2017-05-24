//
//  YZKStyleManager.h
//  SCGD
//
//  Created by Lizeyu on 16/10/19.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UITableView+YZKCellStyle.h"

@interface YZKStyleManager : NSObject

+ (UITableViewCell *)initCellWithCellType:(YZKCellStyle)cellStyle forTableView:(UITableView *)tableView;

@end

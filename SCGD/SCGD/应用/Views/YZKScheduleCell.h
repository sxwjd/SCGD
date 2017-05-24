//
//  YZKScheduleCell.h
//  SCGD
//
//  Created by Lizeyu on 16/10/25.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YZKScheduleMonthModel.h"

@interface YZKScheduleCell : UITableViewCell

@property (nonatomic, strong) YZKScheduleMonthModel *individualModel;
- (void)backGroundImage;

@end

//
//  ReceiveManageDetailCell.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/24.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ReceiveManageOponionModel;

@interface ReceiveManageDetailCell : UITableViewCell
/**
 *  model
 */
@property (nonatomic, strong)  ReceiveManageOponionModel *model;
@property (nonatomic, copy) NSNumber *seat;

+(ReceiveManageDetailCell *)cellWithTableView:(UITableView *)tableView;
@end

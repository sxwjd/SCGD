//
//  ImportNewsDetailCell.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/26.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ImportNewsDetailListModel;
@interface ImportNewsDetailCell : UITableViewCell
/**
 *  model
 */
@property (nonatomic, strong) ImportNewsDetailListModel *model;
+(ImportNewsDetailCell *)cellWithTableView:(UITableView *)tableView;
@end

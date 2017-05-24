//
//  PrivateSectionCell.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/19.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrivateSectionCell : UITableViewCell
@property (nonatomic, copy) NSString *title;

+(PrivateSectionCell *)cellWithTableView:(UITableView *)tableView;
@end

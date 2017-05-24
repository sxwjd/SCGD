//
//  ContactListCell.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/19.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ContactMsg;
@interface ContactListCell : UITableViewCell
/**
 *  <#注释#>
 */
@property (nonatomic, strong) ContactMsg *contact;
+(ContactListCell *)cellWithTableView:(UITableView *)tableView;
@end

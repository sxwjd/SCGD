//
//  ContactListCellTwo.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/20.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ContactMsg;
@interface ContactListCellTwo : UITableViewCell
@property (nonatomic, strong) ContactMsg *contact;
+(ContactListCellTwo *)cellWithTableView:(UITableView *)tableView;
@end

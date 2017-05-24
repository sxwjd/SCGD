//
//  YZKPopCommonCell.h
//  SCGD
//
//  Created by Lizeyu on 16/10/19.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YZKApplicationModel;

@interface YZKPopCommonCell : UITableViewCell
/**  自定义modal界面的通用模型 */
@property (nonatomic, strong) YZKApplicationModel *model;
@end

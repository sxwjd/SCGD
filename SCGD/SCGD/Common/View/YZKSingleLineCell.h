//
//  YZKSingleLineCell.h
//  SCGD
//
//  Created by Lizeyu on 16/10/19.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YZKContentModel;

@interface YZKSingleLineCell : UITableViewCell
/** 单行内容模型 */
@property (nonatomic, strong) YZKContentModel *model;

- (void)createWithTitle:(NSString *)title content:(NSString *)content rightLabel:(NSString *)rightTitle rightContent:(NSString *)rightContent showIcon:(BOOL)show;

@end

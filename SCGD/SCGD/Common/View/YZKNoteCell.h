//
//  YZKNoteCell.h
//  SCGD
//
//  Created by Lizeyu on 16/10/24.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YZKNoteModel;

@interface YZKNoteCell : UITableViewCell
/** 备忘录 */
@property (nonatomic, strong) YZKNoteModel *model;
@end

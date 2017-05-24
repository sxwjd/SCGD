//
//  YZKApplicationCollectionApplicationCell.h
//  SCGD
//
//  Created by Lizeyu on 16/10/17.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YZKApplicationModel;
@interface YZKApplicationCollectionApplicationCell : UICollectionViewCell
/** 应用模型 */
@property (nonatomic, strong) YZKApplicationModel *model;
@end

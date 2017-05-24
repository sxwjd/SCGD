//
//  YZKCommonCell.h
//  SCGD
//
//  Created by Lizeyu on 16/10/18.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YZKAnnounceModel;
@class YZKReceiveModel;
@class YZKStationLetterPostedModel;

@interface YZKCommonCell : UITableViewCell
/** 公告 模型 */
@property (nonatomic, strong) YZKAnnounceModel *model;
/** 收文 模型 */
@property (nonatomic, strong) YZKReceiveModel *receiveModel;
/** 站内信 已发 模型 */
@property (nonatomic, strong) YZKStationLetterPostedModel *letterPostedModel;
@end

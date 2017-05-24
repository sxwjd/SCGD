//
//  YZKReserveCell.h
//  SCGD
//
//  Created by Lizeyu on 16/10/19.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YZKStationLetterReceiveModel;
@class YZKReserveModel;
@class YZKNetworkDiskModel;

@interface YZKReserveCell : UITableViewCell
/** reserve model */
@property (nonatomic, strong) YZKReserveModel *model;

/** stationletter received */
@property (nonatomic, strong) YZKStationLetterReceiveModel *receivedModel;

/** network disk received */
@property (nonatomic, strong) YZKNetworkDiskModel *networkDiskModel;



@end

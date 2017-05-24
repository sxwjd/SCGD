//
//  YZKStationLetterDetailViewController.h
//  SCGD
//
//  Created by Lizeyu on 16/10/27.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YZKStationLetterReceiveModel;
@class YZKStationLetterPostedModel;

@interface YZKStationLetterDetailViewController : UIViewController
@property (nonatomic, strong) YZKStationLetterPostedModel *postedModel;
@property (nonatomic, strong) YZKStationLetterReceiveModel *receiveModel;

@end

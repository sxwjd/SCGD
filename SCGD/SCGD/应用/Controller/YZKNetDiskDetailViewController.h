//
//  YZKNetDiskDetailViewController.h
//  SCGD
//
//  Created by Lizeyu on 16/11/1.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YZKNetworkDiskModel;

@interface YZKNetDiskDetailViewController : UIViewController
/** 网络硬盘 */
@property (nonatomic, strong) YZKNetworkDiskModel *model;
@end

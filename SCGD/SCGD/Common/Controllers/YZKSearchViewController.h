//
//  YZKSearchViewController.h
//  SCGD
//
//  Created by Lizeyu on 16/10/20.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YZKCommonDataController.h"
#import "YZKNetworkDiskDataController.h"
typedef NS_OPTIONS(NSInteger, SearchType) {
    importNews             = 0,
    briefing                    =  1,
    annoucement           = 2,
    notice                      = 3,
    receiveManage         = 4,
    receiveStationLetter = 5,
    postStationLetter     = 6,
    knowledgeBase        = 7,
    networkDisk             = 8,
    note                         = 9
};
@interface YZKSearchViewController : UIViewController 
/** 外部 接受到的 总数据 */
@property (nonatomic, copy) NSArray *sourceDataList;
@property (nonatomic, assign) SearchType searchType;
@property (nonatomic, assign) FileType fileType;
@end

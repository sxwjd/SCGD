//
//  YZKMeetChooseViewController.h
//  SCGD
//
//  Created by Lizeyu on 16/10/21.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^selectedCconferenceBlock) (NSMutableArray *dataList, NSString *text, NSString *roomId);
@interface YZKMeetChooseViewController : UIViewController
/** 选择 会议室 点击block */
@property (nonatomic, copy) selectedCconferenceBlock block;
@property (nonatomic, assign) NSString *selectedRow;
@end

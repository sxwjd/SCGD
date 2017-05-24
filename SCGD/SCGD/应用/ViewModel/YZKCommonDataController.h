//
//  YZKCommonDataController.h
//  SCGD
//
//  Created by Lizeyu on 16/10/20.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, RequestType) {
    importNewType      =  0,          // 要情
    briefingType           =  1,               // 简报
    noticeType             =  2,                 // 通知
    announcementType =  3     // 公告
};

typedef void(^Completion) (void);
typedef void(^Failer)(NSURLSessionDataTask *task, NSError *error);
@interface YZKCommonDataController : NSObject

/** 要情 返回数据 */
@property (nonatomic, strong) NSMutableArray *dataList;

- (void)requestDataWithType:(RequestType)type params:(NSDictionary *)params success:(Completion)completion failure:(Failer)failure;

- (void)searchDataWithTitle:(NSString *)title requestType:(RequestType)type success:(Completion)completion;

@end

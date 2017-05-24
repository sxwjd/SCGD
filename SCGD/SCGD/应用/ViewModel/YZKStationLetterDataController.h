//
//  YZKStationLetterDataController.h
//  SCGD
//
//  Created by Lizeyu on 16/10/22.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Completion)(void);

typedef NS_ENUM(NSInteger, LetterTyep) {
    Received = 0 ,   //    已 收
    Posted    = 1    //     已 发
};

@interface YZKStationLetterDataController : NSObject
/** 站内信 已收 返回数据 */
@property (nonatomic, strong) NSMutableArray *dataList;

- (void)requestDataForLetterType:(LetterTyep)letterType params:(NSDictionary *)params success:(Completion)completion failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure;

@end

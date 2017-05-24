//
//  YZKRecevieManageDetailDataController.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/26.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ReceiveManageDetailModel;

@interface YZKRecevieManageDetailDataController : NSObject
/**
 *  收文相关详情
 */
@property (nonatomic, strong) ReceiveManageDetailModel *receiveManageDetail;
/**
 *  流程列表
 */
@property (nonatomic, strong) NSMutableArray *processList;
/**
 *  附件列表
 */
@property (nonatomic, strong) NSMutableArray *attachmentList;

/**
 *  审阅列表
 */
@property (nonatomic, strong) NSMutableArray *readList;

- (void)requestDetailWithUrl:(NSString *)url param:(NSDictionary*)param callBack:(void(^)(void))callback;
@end

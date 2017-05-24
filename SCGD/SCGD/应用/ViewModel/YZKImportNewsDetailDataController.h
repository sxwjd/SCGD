//
//  YZKImportNewsDetailDataController.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/26.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ImportNewsDetailModel;
@class YZKDetailContentModel;


@interface YZKImportNewsDetailDataController : NSObject
/**
 *  content
 */
@property (nonatomic, strong) YZKDetailContentModel *content;
@property (nonatomic, copy) NSString *detail;

/**
 *  ImportNewsDetailModel
 */
@property (nonatomic, strong) ImportNewsDetailModel *importNewsDetail;
/**
 *  readList
 */
@property (nonatomic, strong) NSMutableArray *readList;

- (void)requestDetailWithUrl:(NSString *)url param:(NSDictionary*)param callBack:(void(^)(void))callback;
@end

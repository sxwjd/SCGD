//
//  YZKKnowledgeBaseDataController.h
//  SCGD
//
//  Created by Lizeyu on 16/10/22.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Completion)(void);

@interface YZKKnowledgeBaseDataController : NSObject
/** 知识库 返回 数据 */
@property (nonatomic, copy) NSMutableArray *dataList;

- (void)requestDataForAllBaseWithParams:(NSDictionary *)params success:(Completion)completion failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure;

@end

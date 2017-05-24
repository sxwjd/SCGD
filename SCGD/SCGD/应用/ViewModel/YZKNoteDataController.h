//
//  YZKNoteDataController.h
//  SCGD
//
//  Created by Lizeyu on 16/10/24.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Completion)(void);

@interface YZKNoteDataController : YZKDataController
/** 备忘录 */
@property (nonatomic, strong) NSMutableArray *dataList;

- (void)requestForAllNoteWithParams:(NSDictionary *)params success:(Completion)completion failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure;

@end

//
//  YZKKnowledgeBaseDataController.m
//  SCGD
//
//  Created by Lizeyu on 16/10/22.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKKnowledgeBaseDataController.h"
#import "YZKContentModel.h"
@interface YZKKnowledgeBaseDataController()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation YZKKnowledgeBaseDataController

- (void)requestDataForAllBaseWithParams:(NSDictionary *)params success:(Completion)completion failure:(void (^)(NSURLSessionDataTask *, NSError *))failure{
    if (self.dataList.count > 0) {
        [self.dataList removeAllObjects];
    }
    [self.manager GET: KnowledgeBase parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([responseObject[@"data"] isKindOfClass:[NSArray class]]) {
            for (NSDictionary *dict in responseObject[@"data"]) {
                [self.dataList addObject:[YZKContentModel modelWithDict:dict]];
            }
            if (completion) {
                completion();
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (AFHTTPSessionManager *)manager{
    if (_manager == nil) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

- (NSMutableArray *)dataList{
    if (_dataList == nil) {
        _dataList = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataList;
}


@end

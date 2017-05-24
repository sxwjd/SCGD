//
//  YZKReceManageDataController.m
//  SCGD
//
//  Created by Lizeyu on 16/10/21.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKReceManageDataController.h"
#import "YZKReceiveModel.h"
#import "YZKContentModel.h"

@interface YZKReceManageDataController()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation YZKReceManageDataController

- (void)requestDataWithParams:(NSDictionary *)params success:(Completion)completion failure:(void (^)(NSURLSessionDataTask *, NSError *))failure{
    if (self.dataList.count > 0) {
        [self.dataList removeAllObjects];
    }
    [self.manager GET:ReceiveManage parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",[NSThread currentThread]);
        if ([responseObject[@"data"] isKindOfClass:[NSArray class]]) {
            for (NSDictionary *dict in responseObject[@"data"]) {
                [self.dataList addObject:[YZKReceiveModel modelWithDict:dict]];
            }
            if (completion) {
                completion();
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(task, error);
        }
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

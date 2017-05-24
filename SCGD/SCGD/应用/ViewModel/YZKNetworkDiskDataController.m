//
//  YZKNetworkDiskDataController.m
//  SCGD
//
//  Created by Lizeyu on 16/10/22.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKNetworkDiskDataController.h"
#import "YZKNetworkDiskModel.h"

@interface YZKNetworkDiskDataController()
@property (nonatomic, strong) AFHTTPSessionManager *manager;
@end

@implementation YZKNetworkDiskDataController

- (void)requestDataForFileType:(FileType)fileType params:(NSDictionary *)params success:(Completion)completion failure:(void (^)(NSURLSessionDataTask *, NSError *))failure{
    switch (fileType) {
        case shareFileType:
        {
            self.dataList = [NSMutableArray arrayWithCapacity:0];
            [self.manager GET:NetworkDiskShare parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if ([responseObject[@"data"] isKindOfClass:[NSArray class]]) {
                    for (NSDictionary *dict in responseObject[@"data"]) {
                        [self.dataList addObject:[YZKNetworkDiskModel modelWithDict:dict]];
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
            break;
        case mineFileType:
        {
            self.dataList = [NSMutableArray arrayWithCapacity:0];
            [self.manager GET:NetworkDiskMine parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if ([responseObject[@"data"] isKindOfClass:[NSArray class]]) {
                    for (NSDictionary *dict in responseObject[@"data"]) {
                        [self.dataList addObject:[YZKNetworkDiskModel modelWithDict:dict]];
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
            break;
    }
}


- (AFHTTPSessionManager *)manager{
    if (_manager == nil) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

@end

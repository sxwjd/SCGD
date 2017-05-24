//
//  YZKStationLetterDataController.m
//  SCGD
//
//  Created by Lizeyu on 16/10/22.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKStationLetterDataController.h"
#import "YZKStationLetterReceiveModel.h"
#import "YZKStationLetterPostedModel.h"

@interface YZKStationLetterDataController()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation YZKStationLetterDataController

- (void)requestDataForLetterType:(LetterTyep)letterType params:(NSDictionary *)params success:(Completion)completion failure:(void (^)(NSURLSessionDataTask *, NSError *))failure{
    [self.dataList removeAllObjects];
    switch (letterType) {
        case Received:
        {
            [self.manager GET:StationLetterReceived parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if ([responseObject[@"data"] isKindOfClass:[NSArray class]]) {
                    for (NSDictionary *dict in responseObject[@"data"]) {
                        [self.dataList addObject:[YZKStationLetterReceiveModel modelWithDict:dict]];
                    }
                    if (completion) {
                        completion();
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(task,error);
                }
            }];
        }
            break;
        case Posted:
        {
            [self.manager GET:StationLetterPosted parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if ([responseObject[@"data"] isKindOfClass:[NSArray class]]) {
                    for (NSDictionary *dict in responseObject[@"data"]) {
                        [self.dataList addObject:[YZKStationLetterPostedModel modelWithDict:dict]];
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


#pragma mark - getter and setter

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

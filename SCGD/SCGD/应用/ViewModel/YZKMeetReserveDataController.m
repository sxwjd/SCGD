//
//  YZKMeetReserveDataController.m
//  SCGD
//
//  Created by Lizeyu on 16/10/21.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKMeetReserveDataController.h"
#import "YZKReserveModel.h"
@interface YZKMeetReserveDataController()
@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation YZKMeetReserveDataController

- (void)requestDataForMeetingRoomNameWithCompletion:(Completion)completion{
    self.dataList = [NSMutableArray arrayWithCapacity:0];
    [self.dataList removeAllObjects];
    [self.manager GET:MeetingList parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        for (NSDictionary *dict in responseObject[@"data"]) {
            [self.dataList addObject:[YZKReserveModel modelWithDict:dict]];
        }
        if (completion) {
            completion();
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void)requestDataForAllReserverWithParams:(NSDictionary *)params success:(Completion)completion failure:(void (^)(NSURLSessionDataTask *, NSError *))failure{
    self.dataList = [NSMutableArray arrayWithCapacity:0];
    [self.dataList removeAllObjects];
    [self.manager GET:ReserveAllList parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",[responseObject[@"data"] class]);
        if ([responseObject[@"data"] isKindOfClass:[NSArray class]]) {
            for (NSDictionary *dict in responseObject[@"data"]) {
                [self.dataList addObject:[YZKReserveModel modelWithDict:dict]];
            }
            if (completion) {
                completion();
            }
        }else{
            
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(task, error);
        }
    }];
}

- (void)requestDatAForSpecifyMeetingRoomId:(NSString *)roomId success:(Completion)completion failure:(void (^)(NSURLSessionDataTask *, NSError *))failure{
    //?loginId=admin&roomId=1"
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
    params[LOGINID] = [[NSUserDefaults standardUserDefaults] objectForKey:LOGINID];
    params[@"roomId"] = roomId;
//    if (self.dataList.count > 0) {
//        [self.dataList removeAllObjects];
//    }
    self.dataList = [NSMutableArray arrayWithCapacity:0];
    [self.dataList removeAllObjects];
    [self.manager GET:ReserveFilterList parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
        if ([responseObject[@"data"] isKindOfClass:[NSArray class]]) {
            for (NSDictionary *dict in responseObject[@"data"]) {
                [self.dataList addObject:[YZKReserveModel modelWithDict:dict]];
            }
            
        }else{
            self.dataList = [NSMutableArray arrayWithCapacity:0];
        }
        if (completion) {
            completion();
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

//- (NSMutableArray *)dataList{
//    if (_dataList == nil) {
//        _dataList = [NSMutableArray arrayWithCapacity:0];
//    }
//    return _dataList;
//}

@end

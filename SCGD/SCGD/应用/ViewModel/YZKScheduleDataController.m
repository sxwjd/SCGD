//
//  YZKScheduleDataController.m
//  SCGD
//
//  Created by Lizeyu on 16/10/25.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKScheduleDataController.h"
#import "YZKScheduleModel.h"
#import "YZKScheduleMonthModel.h"

@interface YZKScheduleDataController()
@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation YZKScheduleDataController

- (void)requestDataWithScheduleType:(ScheduleType)type params:(NSDictionary *)params success:(void (^)(void))completion failure:(void (^)(NSURLSessionDataTask *, NSError *))failure{
    if (self.dataList.count > 0) {
        [self.dataList removeAllObjects];
    }
    switch (type) {
        case individualType:
        {
            
            [self.manager GET:IndividualSchedule parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if ([responseObject[@"data"] isKindOfClass:[NSArray class]]) {
                    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
                    dict[@"date"] = responseObject[@"data"][@"date"];
                    for (NSDictionary *dict in responseObject[@"data"][@"schedulerRes"]) {
                        YZKScheduleMonthModel *monthModel = [YZKScheduleMonthModel modelWithDict:dict];
                        monthModel.scheduleModels = [NSMutableArray arrayWithCapacity:0];
                        for (NSDictionary *dict in monthModel.scheduler) {
                            YZKScheduleModel *model = [YZKScheduleModel modelWithDict:dict];
                            [monthModel.scheduleModels addObject:model];
                        }
                        
                        [self.dataList addObject:monthModel];
                    }
                    [self.dataList addObject:dict];
                    if (completion) {
                        completion();
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if(failure){
                    failure(task, error);
                }
            }];
        }
            break;
        case taskType:
        {
            
            [self.manager GET:TaskSchedule parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if ([responseObject[@"data"] isKindOfClass:[NSArray class]]) {
                    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
                    dict[@"date"] = responseObject[@"data"][@"date"];
                    for (NSDictionary *dict in responseObject[@"data"][@"workSchedulerRes"]) {
                        YZKScheduleMonthModel *monthModel = [YZKScheduleMonthModel modelWithDict:dict];
                        monthModel.scheduleModels = [NSMutableArray arrayWithCapacity:0];
                        for (NSDictionary *dict in monthModel.workScheduler) {
                            YZKScheduleModel *model = [YZKScheduleModel modelWithDict:dict];
                            [monthModel.scheduleModels addObject:model];
                        }
                        
                        [self.dataList addObject:monthModel];
                    }
                    [self.dataList addObject:dict];
                    
                    
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


- (void)requestDataWithScheduleType:(ScheduleType)type specifyYearMonth:(NSString *)yearMonth params:(NSDictionary *)params success:(void (^)(void))completion failure:(void (^)(NSURLSessionDataTask *, NSError *))failure{
    if (self.dataList.count > 0) {
        [self.dataList removeAllObjects];
    }
    switch (type) {
        case individualType:
        {
           
            [self.manager GET:IndividualYearMonthSchedule parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if ([responseObject[@"data"] isKindOfClass:[NSArray class]]) {
                    for (NSDictionary *dict in responseObject[@"data"]) {
                        YZKScheduleMonthModel *monthModel = [YZKScheduleMonthModel modelWithDict:dict];
                        monthModel.scheduleModels = [NSMutableArray arrayWithCapacity:0];
                        for (NSDictionary *dict in monthModel.scheduler) {
                            YZKScheduleModel *model = [YZKScheduleModel modelWithDict:dict];
                            [monthModel.scheduleModels addObject:model];
                        }
                        
                        [self.dataList addObject:monthModel];
                    }
                }
                if (completion) {
                    completion();
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
            }];
        }
            break;
        case taskType:
        {
        
            [self.manager GET:TaskYearMonthSchedule parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if ([responseObject[@"data"] isKindOfClass:[NSArray class]]) {
                    for (NSDictionary *dict in responseObject[@"data"]) {
                        YZKScheduleMonthModel *monthModel = [YZKScheduleMonthModel modelWithDict:dict];
                        monthModel.scheduleModels = [NSMutableArray arrayWithCapacity:0];
                        for (NSDictionary *dict in monthModel.workScheduler) {
                            YZKScheduleModel *model = [YZKScheduleModel modelWithDict:dict];
                            [monthModel.scheduleModels addObject:model];
                        }
                        
                        [self.dataList addObject:monthModel];
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


- (void)requestDataWithScheduleType:(ScheduleType)type specifyYearMonthDay:(NSString *)yearMonthDay params:(NSDictionary *)params success:(void (^)(void))completion failure:(void (^)(NSURLSessionDataTask *, NSError *))failure{
    if (self.dataList.count > 0) {
        [self.dataList removeAllObjects];
    }
    switch (type) {
        case individualType:
        {
          
            [self.manager GET:IndividualYearMonthDaySchedule parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if ([responseObject[@"data"] isKindOfClass:[NSArray class]]) {
                    for (NSDictionary *dict in responseObject[@"data"][@"scheduler"]) {
                        //                    YZKScheduleMonthModel *monthModel = [YZKScheduleMonthModel modelWithDict:dict];
                        //                    monthModel.scheduleModels = [NSMutableArray arrayWithCapacity:0];
                        //                    for (NSDictionary *dict in monthModel.scheduler) {
                        //                        YZKScheduleModel *model = [YZKScheduleModel modelWithDict:dict];
                        //                        [monthModel.scheduleModels addObject:model];
                        //                    }
                        YZKScheduleModel *model = [YZKScheduleModel modelWithDict:dict];
                        [self.dataList addObject:model];
                        
                        
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
        case taskType:
        {
            
            [self.manager GET:TaskYearMonthDaySchedule parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if ([responseObject[@"data"] isKindOfClass:[NSArray class]]) {
                    //                if([responseObject[@"data"][@"workScheduler"] isKindOfClass:[NSArray class]]){
                    for (NSDictionary *dict in responseObject[@"data"][@"workScheduler"]) {
                        YZKScheduleModel *model = [YZKScheduleModel modelWithDict:dict];
                        [self.dataList addObject:model];
                        
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
    }

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

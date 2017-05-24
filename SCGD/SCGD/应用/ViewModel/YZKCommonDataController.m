//
//  YZKCommonDataController.m
//  SCGD
//
//  Created by Lizeyu on 16/10/20.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKCommonDataController.h"
#import <AFNetworking.h>
#import "YZKAnnounceModel.h"

@interface YZKCommonDataController()
@property (nonatomic, strong) AFHTTPSessionManager *manager;
@end

@implementation YZKCommonDataController



/**
 对应 请求 共用控制器 所需要的 数据

 @param type       请求－界面－类型
 @param completion 请求成功，做相应 事件
 */
- (void)requestDataWithType:(RequestType)type params:(NSDictionary *)params success:(Completion)completion failure:(Failer)failure{
    if (self.dataList.count > 0) {
        [self.dataList removeAllObjects];
    }
    switch (type) {
        case importNewType:
        {
            if (self.dataList.count > 0) {
                [self.dataList removeAllObjects];
            }
            [self.manager GET:ImportNews parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if ([responseObject[@"data"] isKindOfClass:[NSArray class]]) {
                    for (NSDictionary *dict in responseObject[@"data"]) {
                        YZKAnnounceModel *model = [YZKAnnounceModel modelWithDict:dict];
                        [self.dataList addObject:model];
                        
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
        case briefingType:
        {
            if (self.dataList.count > 0) {
                [self.dataList removeAllObjects];
            }
            [self.manager GET:Briefing parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if ([responseObject[@"data"] isKindOfClass:[NSArray class]]) {
                    for (NSDictionary *dict in responseObject[@"data"]) {
                        YZKAnnounceModel *model = [YZKAnnounceModel modelWithDict:dict];
                        [self.dataList addObject:model];
                        
                        
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
        case noticeType:
        {
            if (self.dataList.count > 0) {
                [self.dataList removeAllObjects];
            }
            [self.manager GET:Notice parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if ([responseObject[@"data"] isKindOfClass:[NSArray class]]) {
                    for (NSDictionary *dict in responseObject[@"data"]) {
                        YZKAnnounceModel *model = [YZKAnnounceModel modelWithDict:dict];
                        [self.dataList addObject:model];
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
        case announcementType:
        {
            if (self.dataList.count > 0) {
                [self.dataList removeAllObjects];
            }
            [self.manager GET:Announcement parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if ([responseObject[@"data"] isKindOfClass:[NSArray class]]) {
                    for (NSDictionary *dict in responseObject[@"data"]) {
                        YZKAnnounceModel *model = [YZKAnnounceModel modelWithDict:dict];
                        [self.dataList addObject:model];
                        
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

- (void)searchDataWithTitle:(NSString *)title requestType:(RequestType)type success:(Completion)completion{
    [self.dataList removeAllObjects];
    switch (type) {
        case importNewType:
        {
            if (self.dataList.count > 0) {
                [self.dataList removeAllObjects];
            }
            NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
            params[@"title"] = title;
            [self.manager GET:ImportNews parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if ([responseObject[@"data"] isKindOfClass:[NSArray class]]) {
                    for (NSDictionary *dict in responseObject[@"data"]) {
                        YZKAnnounceModel *model = [YZKAnnounceModel modelWithDict:dict];
                        [self.dataList addObject:model];
                    }
                    if (completion) {
                        completion();
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
            }];
            
        }
            break;
        case briefingType:
        {
            if (self.dataList.count > 0) {
                [self.dataList removeAllObjects];
            }
            NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
            params[@"title"] = title;
            [self.manager GET:Briefing parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if ([responseObject[@"data"] isKindOfClass:[NSArray class]]) {
                    for (NSDictionary *dict in responseObject[@"data"]) {
                        YZKAnnounceModel *model = [YZKAnnounceModel modelWithDict:dict];
                        [self.dataList addObject:model];
                    }
                    if (completion) {
                        completion();
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
            }];
        }
            break;
        case noticeType:
        {
            if (self.dataList.count > 0) {
                [self.dataList removeAllObjects];
            }
            NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
            params[@"title"] = title;
            [self.manager GET:Notice parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if([responseObject[@"data"] isKindOfClass:[NSArray class]]) {
                    for (NSDictionary *dict in responseObject[@"data"]) {
                        YZKAnnounceModel *model = [YZKAnnounceModel modelWithDict:dict];
                        [self.dataList addObject:model];
                    }
                    if (completion) {
                        completion();
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
            }];
        }
            break;
        case announcementType:
        {
            if (self.dataList.count > 0) {
                [self.dataList removeAllObjects];
            }
            NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
            params[@"title"] = title;
            [self.manager GET:Announcement parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if ([responseObject[@"data"] isKindOfClass:[NSArray class]]) {
                    for (NSDictionary *dict in responseObject[@"data"]) {
                        YZKAnnounceModel *model = [YZKAnnounceModel modelWithDict:dict];
                        [self.dataList addObject:model];
                    }
                    if (completion) {
                        completion();
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
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

//
//  YZKNoteDataController.m
//  SCGD
//
//  Created by Lizeyu on 16/10/24.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKNoteDataController.h"
#import "YZKNoteModel.h"

@interface YZKNoteDataController()

@end

@implementation YZKNoteDataController



- (void)requestForAllNoteWithParams:(NSDictionary *)params success:(Completion)completion failure:(void (^)(NSURLSessionDataTask *, NSError *))failure{
   
    [self.manager GET:NoteUrl parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (self.dataList.count > 0) {
            [self.dataList removeAllObjects];
        }
        if ([responseObject[@"data"] isKindOfClass:[NSArray class]]) {
            for (NSDictionary *dict in responseObject[@"data"]) {
                [self.dataList addObject:[YZKNoteModel modelWithDict:dict]];
            }
            if (completion) {
                completion();
            }
        }else{
            NSLog(@"there is no data");
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(task, error);
        }
    }];
    
}


- (NSMutableArray *)dataList{
    if (_dataList == nil) {
        _dataList = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataList;
}

@end

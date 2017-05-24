//
//  HomeDataController.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/17.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "HomeDataController.h"
#import "Banner.h"
#import "AFNetworking.h"

@implementation HomeDataController
- (instancetype)init
{
    if (self = [super init]) {
        _BannerData = [NSMutableArray arrayWithCapacity:0];
    }
    return self;
}
- (void)requestBannerDataWithCallback:(void (^)(NSError *))callback
{
    [[AFHTTPSessionManager manager] POST:BANNER parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *data = responseObject[@"data"];
        if (data){
            for (NSDictionary *dic in data) {
                Banner *banner = [Banner modelWithDict:dic];
                [_BannerData addObject:banner];
            }
            callback(nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        callback(error);
    }];
}
- (void)refreshBannerDataWithCallback:(void (^)(NSError *))callback
{
    [[AFHTTPSessionManager manager] POST:BANNER parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *data = responseObject[@"data"];
        if (data){
            [_BannerData removeAllObjects];
            for (NSDictionary *dic in data) {
                Banner *banner = [Banner modelWithDict:dic];
                [_BannerData addObject:banner];
            }
            callback(nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        callback(error);
    }];
}
@end

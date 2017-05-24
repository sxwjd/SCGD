//
//  PrivateContactDetailController.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/20.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "PrivateContactDetailController.h"
#import "PrivateSectionDetail.h"

@implementation PrivateContactDetailController
- (instancetype)init
{
    if (self = [super init]) {
        _privateContactSectionDetailArr = [NSMutableArray arrayWithCapacity:0];
    }
    return self;
}
- (void)requestPrivateContactSectionDetailDataWithParm:(NSDictionary *)param Callback:(void (^)(NSError *))callback
{
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeCustom];
    [SVProgressHUD showWithStatus:@"加载中.."];
    [[AFHTTPSessionManager manager] GET:PRIVATECONTACTSECTIONDETAIL parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        if ([responseObject[@"retCode"] integerValue] == 0) {
            NSArray *data = responseObject[@"data"];
            [_privateContactSectionDetailArr removeAllObjects];
            for (NSDictionary *dic in data) {
                PrivateSectionDetail *section = [PrivateSectionDetail modelWithDict:dic];
                [_privateContactSectionDetailArr addObject:section];
            }
            callback(nil);
        }else
        {
            [SVProgressHUD setMinimumDismissTimeInterval:1.0];
            [SVProgressHUD showErrorWithStatus:responseObject[@"message"]];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        callback(error);
        [SVProgressHUD dismiss];
        [SVProgressHUD setMinimumDismissTimeInterval:1.0];
        [SVProgressHUD showErrorWithStatus:@"网络不给力"];
    }];
}
@end

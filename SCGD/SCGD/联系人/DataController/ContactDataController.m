//
//  ContactDataController.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/20.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "ContactDataController.h"
#import "ContactSection.h"
#import "PrivateSection.h"
#import "ContactMsg.h"

@implementation ContactDataController
- (instancetype)init
{
    if (self = [super init]) {
        _organizationDataArr = [NSMutableArray arrayWithCapacity:0];
        _privateContactSectionArr = [NSMutableArray arrayWithCapacity:0];
    }
    return self;
}
- (void)requestContactDataSortByOrganizationWithCallback:(void (^)(NSError *))callback
{
    [SVProgressHUD setMinimumDismissTimeInterval:1.0];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeCustom];
    [SVProgressHUD showWithStatus:@"加载中.."];
    [[AFHTTPSessionManager manager] GET:PUBLICCONTACTDefault parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        if ([responseObject[@"retCode"] integerValue] == 0) {
            NSArray *data = responseObject[@"data"];
            [_organizationDataArr removeAllObjects];
            for (NSDictionary *dic in data) {
                ContactSection *section = [ContactSection modelWithDict:dic];
                [_organizationDataArr addObject:section];
            }
        }else
        {
            [SVProgressHUD showErrorWithStatus:responseObject[@"message"]];
        }
        callback(nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        callback(error);
        [SVProgressHUD dismiss];
        [SVProgressHUD showErrorWithStatus:@"网络不给力"];
    }];
}
- (void)requestContactDataSortByPersonnelWithCallback:(void (^)(NSError *))callback
{
    [SVProgressHUD setMinimumDismissTimeInterval:1.0];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeCustom];
    [SVProgressHUD showWithStatus:@"加载中.."];
    [[AFHTTPSessionManager manager] GET:PUBLICCONTACTPERSONNEL parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        if ([responseObject[@"retCode"] integerValue] == 0) {
            NSArray *data = responseObject[@"data"];
            [_organizationDataArr removeAllObjects];
            for (NSDictionary *dic in data) {
                ContactSection *section = [ContactSection modelWithDict:dic];
                [_organizationDataArr addObject:section];
            }
        }else
        {
            [SVProgressHUD showErrorWithStatus:responseObject[@"message"]];
        }
        callback(nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        callback(error);
        [SVProgressHUD dismiss];
        [SVProgressHUD showErrorWithStatus:@"网络不给力"];
    }];
}
- (void)requestPrivateContactSectionListDataWithCallback:(void (^)(NSError *))callback
{
    [SVProgressHUD setMinimumDismissTimeInterval:1.0];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeCustom];
    [SVProgressHUD showWithStatus:@"加载中.."];
    NSString *loginId = [[NSUserDefaults standardUserDefaults] objectForKey:LOGINID];
    [[AFHTTPSessionManager manager] GET:PRIVATECONTACTSECTION parameters:@{@"loginId":loginId} progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        if ([responseObject[@"retCode"] integerValue] == 0) {
            NSArray *data = responseObject[@"data"];
            [_privateContactSectionArr removeAllObjects];
            for (NSDictionary *dic in data) {
                PrivateSection *section = [PrivateSection modelWithDict:dic];
                [_privateContactSectionArr addObject:section];
            }
        }else
        {
            [SVProgressHUD showErrorWithStatus:responseObject[@"message"]];
        }
        callback(nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        callback(error);
        [SVProgressHUD dismiss];
        [SVProgressHUD showErrorWithStatus:@"网络不给力"];
    }];
}

@end

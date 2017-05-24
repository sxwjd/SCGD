//
//  ChangePasswordDataController.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/21.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "ChangePasswordDataController.h"

@implementation ChangePasswordDataController
- (void)changePasswordWithParm:(NSDictionary *)param Callback:(void (^)(void))callback
{
    [SVProgressHUD setMinimumDismissTimeInterval:1.0];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeCustom];
    [SVProgressHUD showWithStatus:@"修改中.."];
    [[AFHTTPSessionManager manager] GET:CHANGEPASSWORD parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        if ([responseObject[@"code"] integerValue] == 0) {
            [SVProgressHUD showSuccessWithStatus:@"修改成功"];
             callback();
        }else
        {
            [SVProgressHUD showErrorWithStatus:responseObject[@"message"]];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        [SVProgressHUD showErrorWithStatus:@"网络不给力"];
    }];
}
@end

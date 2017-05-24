//
//  MineDataController.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/22.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "MineDataController.h"
#import "UserMessage.h"

@implementation MineDataController
- (instancetype)init
{
    if (self = [super init]) {
    }
    return self;
}
- (void)getUserMessageWithCallback:(void (^)(void))callback
{
    [SVProgressHUD setMinimumDismissTimeInterval:1.0];
    NSString *loginId = [[NSUserDefaults standardUserDefaults] objectForKey:LOGINID];
    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithCapacity:0];
    param[@"loginId"] = loginId;
    [[AFHTTPSessionManager manager] GET:USERMESSAGE parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([responseObject[@"retCode"] integerValue] == 0) {
            NSDictionary *data = responseObject[@"data"];
            _userMessage = [UserMessage modelWithDict:data];
            callback();
        }else
        {
            [SVProgressHUD showErrorWithStatus:responseObject[@"message"]];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"网络不给力"];
    }];
}
@end

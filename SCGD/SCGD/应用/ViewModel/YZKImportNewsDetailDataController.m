//
//  YZKImportNewsDetailDataController.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/26.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKImportNewsDetailDataController.h"
#import "ImportNewsDetailModel.h"
#import "ImportNewsDetailListModel.h"
#import "YZKDetailContentModel.h"

@implementation YZKImportNewsDetailDataController
- (instancetype)init
{
    if (self = [super init]) {
        _readList = [NSMutableArray arrayWithCapacity:0];
    }
    return self;
}
- (void)requestDetailWithUrl:(NSString *)url param:(NSDictionary *)param callBack:(void (^)(void))callback
{
    [SVProgressHUD setMinimumDismissTimeInterval:1.0];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeCustom];
    [SVProgressHUD showWithStatus:@"加载中.."];
    [[AFHTTPSessionManager manager] GET:url parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        if ([responseObject[@"re_Code"] integerValue] == 0) {
            _content = [YZKDetailContentModel modelWithDict:responseObject];
            NSDictionary *detail = responseObject[@"data"];
            if ([detail isKindOfClass:[NSDictionary class]]) {
                _importNewsDetail = [ImportNewsDetailModel modelWithDict:detail];
            }
            NSArray *list = responseObject[@"look"];
            [_readList removeAllObjects];
            if ([list isKindOfClass:[NSArray class]]) {
                
                for (NSDictionary *dic in list) {
                    ImportNewsDetailListModel *model = [ImportNewsDetailListModel modelWithDict:dic];
                    [_readList addObject:model];
                }
            }
            if (callback) {
                callback();
            }
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

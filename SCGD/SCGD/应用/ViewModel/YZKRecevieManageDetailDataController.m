//
//  YZKRecevieManageDetailDataController.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/26.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKRecevieManageDetailDataController.h"
#import "ReceiveManageListModel.h"
#import "ReceiveManageDetailModel.h"
#import "ProcessModel.h"
#import "AttachmentModel.h"

@implementation YZKRecevieManageDetailDataController
- (instancetype)init
{
    if (self = [super init]) {
        _processList = [NSMutableArray arrayWithCapacity:0];
        _attachmentList = [NSMutableArray arrayWithCapacity:0];
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
        if ([responseObject[@"retCode"] integerValue] == 0) {
            //收文相关信息
            NSDictionary *detail = responseObject[@"data"];
            if ([detail isKindOfClass:[NSDictionary class]]) {
                _receiveManageDetail = [ReceiveManageDetailModel modelWithDict:detail];
            }
            //流程
             NSArray *workFlows = responseObject[@"workFlows"];
            if ([workFlows isKindOfClass:[NSArray class]]) {
                [_processList removeAllObjects];
                for (NSDictionary *dic in workFlows) {
                    ProcessModel *process = [ProcessModel modelWithDict:dic];
                    [_processList addObject:process];
                }
            }
            //附件
            NSArray *docinFjPage = responseObject[@"docinFjPage"];
            if ([docinFjPage isKindOfClass:[NSArray class]]) {
                [_attachmentList removeAllObjects];
                for (NSDictionary *dic in docinFjPage) {
                    AttachmentModel *attachment = [AttachmentModel modelWithDict:dic];
                    [_attachmentList addObject:attachment];
                }
            }
            //审阅意见
            NSArray *list = responseObject[@"opinons"];
            if ([list isKindOfClass:[NSArray class]]) {
                [_readList removeAllObjects];
                for (NSDictionary *dic in list) {
                    ReceiveManageListModel *model = [ReceiveManageListModel modelWithDict:dic];
                    [_readList addObject:model];
                }
            }
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

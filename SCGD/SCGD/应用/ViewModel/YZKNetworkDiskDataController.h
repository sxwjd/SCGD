//
//  YZKNetworkDiskDataController.h
//  SCGD
//
//  Created by Lizeyu on 16/10/22.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Completion) (void);

typedef NS_ENUM(NSInteger, FileType){
    shareFileType      =  0,     // 共享文件
    mineFileType       =  1      // 我的文件
};
@interface YZKNetworkDiskDataController : NSObject

/** 网络硬盘 */
@property (nonatomic, strong) NSMutableArray *dataList;

- (void)requestDataForFileType:(FileType)fileType params:(NSDictionary *)params success:(Completion)completion failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure;

@end

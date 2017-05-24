//
//  YZKDataController.m
//  SCGD
//
//  Created by Lizeyu on 16/11/18.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKDataController.h"


@implementation YZKDataController

- (instancetype)init{
    if (self == [super init]) {
        [self setup];
    }
    return self;
}

- (void)setup{
    _manager = [AFHTTPSessionManager manager];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [_manager.requestSerializer setHTTPShouldUsePipelining:YES];
    [_manager.requestSerializer setValue:@"Keep-Alive" forHTTPHeaderField:@"Connection"];
    [_manager.requestSerializer setTimeoutInterval:15];

}
@end

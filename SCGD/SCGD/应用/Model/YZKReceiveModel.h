//
//  YZKReceiveModel.h
//  SCGD
//
//  Created by Lizeyu on 16/10/21.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZKReceiveModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *fileNum;
@property (nonatomic, copy) NSString *fileDept;
@property (nonatomic, copy) NSString *receiverTime;
@property (nonatomic, copy) NSString *id;


+ (instancetype)modelWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end

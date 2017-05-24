//
//  YZKNetworkDiskModel.h
//  SCGD
//
//  Created by Lizeyu on 16/10/22.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZKNetworkDiskModel : NSObject
/** title */
@property (nonatomic, copy) NSString *title;
/** srcFileName */
@property (nonatomic, copy) NSString *srcFileName;
/** updateDate */
@property (nonatomic, copy) NSString *updateDate;
/** shareName */
@property (nonatomic, copy) NSString *content;

+ (instancetype)modelWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;
@end

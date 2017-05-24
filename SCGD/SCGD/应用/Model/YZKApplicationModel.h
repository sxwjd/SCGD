//
//  YZKApplicationModel.h
//  SCGD
//
//  Created by Lizeyu on 16/10/17.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZKApplicationModel : NSObject
@property (nonatomic, copy) NSString *iconName;
@property (nonatomic, copy) NSString *text;

+ (instancetype)modelWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;
@end

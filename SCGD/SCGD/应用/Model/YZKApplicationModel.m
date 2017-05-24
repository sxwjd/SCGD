//
//  YZKApplicationModel.m
//  SCGD
//
//  Created by Lizeyu on 16/10/17.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKApplicationModel.h"


@interface YZKApplicationModel()

@end

@implementation YZKApplicationModel

+ (instancetype)modelWithDict:(NSDictionary *)dict{
    return  [[YZKApplicationModel alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self == [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end

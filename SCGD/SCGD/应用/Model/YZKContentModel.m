//
//  YZKContentModel.m
//  SCGD
//
//  Created by Lizeyu on 16/10/20.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKContentModel.h"

@implementation YZKContentModel

+ (instancetype)modelWithDict:(NSDictionary *)dict{
    return  [[self alloc] initWithDict:dict];
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

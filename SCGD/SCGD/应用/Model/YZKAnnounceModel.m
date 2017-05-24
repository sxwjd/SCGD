//
//  YZKAnnounceModel.m
//  SCGD
//
//  Created by Lizeyu on 16/10/18.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKAnnounceModel.h"
@implementation YZKAnnounceModel

+ (instancetype)modelWithDict:(NSDictionary *)dict{
    return [[YZKAnnounceModel alloc] initWithDict:dict];
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

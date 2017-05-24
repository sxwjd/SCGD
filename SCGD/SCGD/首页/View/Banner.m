//
//  Banner.m
//  轮播
//
//  Created by 佳冬  on 16/5/5.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "Banner.h"

@implementation Banner
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"未定义key%@", key);
}
-(id)valueForUndefinedKey:(NSString *)key
{
    NSLog(@"%@", key);
    return key;
}
+(Banner *)modelWithDict:(NSDictionary *)dict
{
    Banner *model = [[Banner alloc]initWithDict:dict];
    return model;
}
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end

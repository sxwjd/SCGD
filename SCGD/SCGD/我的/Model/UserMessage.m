//
//  UserMessage.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/21.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "UserMessage.h"

@implementation UserMessage
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"未定义key%@", key);
}
-(id)valueForUndefinedKey:(NSString *)key
{
    NSLog(@"%@", key);
    return key;
}
+(UserMessage *)modelWithDict:(NSDictionary *)dict
{
    UserMessage *model = [[UserMessage alloc]initWithDict:dict];
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

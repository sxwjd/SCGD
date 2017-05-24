//
//  ReceiveManageOponionModel.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/28.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "ReceiveManageOponionModel.h"

@implementation ReceiveManageOponionModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"未定义key%@", key);
}
-(id)valueForUndefinedKey:(NSString *)key
{
    NSLog(@"%@", key);
    return key;
}
+(ReceiveManageOponionModel *)modelWithDict:(NSDictionary *)dict
{
    ReceiveManageOponionModel *model = [[ReceiveManageOponionModel alloc]initWithDict:dict];
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

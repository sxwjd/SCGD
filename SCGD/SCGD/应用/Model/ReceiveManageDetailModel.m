//
//  ReceiveManageDetailModel.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/26.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "ReceiveManageDetailModel.h"

@implementation ReceiveManageDetailModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"未定义key%@", key);
}
-(id)valueForUndefinedKey:(NSString *)key
{
    NSLog(@"%@", key);
    return key;
}
+(ReceiveManageDetailModel *)modelWithDict:(NSDictionary *)dict
{
    ReceiveManageDetailModel *model = [[ReceiveManageDetailModel alloc]initWithDict:dict];
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

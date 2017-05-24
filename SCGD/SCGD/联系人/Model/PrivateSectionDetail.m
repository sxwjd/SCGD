//
//  PrivateSectionDetail.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/20.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "PrivateSectionDetail.h"
#import "ContactMsg.h"

@implementation PrivateSectionDetail
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"未定义key%@", key);
}
-(id)valueForUndefinedKey:(NSString *)key
{
    NSLog(@"%@", key);
    return key;
}
+(PrivateSectionDetail *)modelWithDict:(NSDictionary *)dict
{
    PrivateSectionDetail *model = [[PrivateSectionDetail alloc]initWithDict:dict];
    return model;
}
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        
        self.name = dict[@"name"];
        NSArray *tempArr = dict[@"addressBook"];
        NSMutableArray *contacts = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in tempArr) {
            ContactMsg *contact = [ContactMsg modelWithDict:dic];
            [contacts addObject:contact];
        }
        self.addressBook = contacts;
    }
    return self;
}

@end

//
//  ReceiveManageListModel.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/26.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "ReceiveManageListModel.h"
#import "ReceiveManageOponionModel.h"

@implementation ReceiveManageListModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"未定义key%@", key);
}
-(id)valueForUndefinedKey:(NSString *)key
{
    NSLog(@"%@", key);
    return key;
}
+(ReceiveManageListModel *)modelWithDict:(NSDictionary *)dict
{
    ReceiveManageListModel *model = [[ReceiveManageListModel alloc]initWithDict:dict];
    return model;
}
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.seat = dict[@"seat"];
        NSMutableArray *tempArr = [NSMutableArray arrayWithCapacity:0];
        NSArray *opinionArr = dict[@"opinions"];
        for (NSDictionary *dic in opinionArr) {
            ReceiveManageOponionModel *model = [ReceiveManageOponionModel modelWithDict:dic];
            [tempArr addObject:model];
        }
        self.opinions = tempArr;
        
    }
    return self;
}

@end

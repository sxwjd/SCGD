//
//  YZKUserTool.m
//  Categories
//
//  Created by 佳冬  on 15/10/22.
//  Copyright © 2015年 YZK. All rights reserved.
//  NSUserdefault  工具  用来存储一些小型数据

#import "YZKUserTool.h"
static YZKUserTool *tool = nil;

@implementation YZKUserTool
+(YZKUserTool *)tool
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (tool == nil) {
            tool = [[self alloc]init];
        }
    });
    return tool;
}
+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (tool == nil) {
            tool = [super allocWithZone:zone];
        }
    });
    return tool;
}
-(void)storeUserMessage
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:_userMessage];
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    
    [user setObject:data forKey:@"userMessage"];
    
    [user synchronize];
}
-(YZKUserMessage *)getUserMessage
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    
    NSData *data = [user objectForKey:@"userMessage"];
    
    YZKUserMessage *userMessage = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    return userMessage;
}
-(void)setUserMessage:(YZKUserMessage *)userMessage
{
    _userMessage = userMessage;
}

#pragma mark ---存储多个账号需求时用
- (void)storeUsers:(YZKUserMessage *)user
{
//   将要存储的用户对象归档
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:user];
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
//    获取之前存储的用户列表
    NSMutableArray *users =[NSMutableArray arrayWithArray:[userDefault objectForKey:@"USERS"]];
    
    
    if (users == nil) {
//        如果获取的用户列表为空
        
        users = [NSMutableArray array];
    }else
    {
        //    创建临时数组存储用户列表中的用户名
        NSMutableArray *tempArr = [NSMutableArray array];
        
        for (NSData *userData in users) {
            
            YZKUserMessage *usr = [NSKeyedUnarchiver unarchiveObjectWithData:userData];
            [tempArr addObject:usr.userName];
        }
        
        if ([tempArr containsObject:user.userName]) {
            //        将要存储的用户名已经存在
            user.isLogin = NO;
            
            NSData *tempData = [NSKeyedArchiver archivedDataWithRootObject:user];
            
            [users removeObject:tempData];
            
            [users addObject:data];
            
        }else
        {
            //不存在
            
            if ([users count] == 3) {
                //            如果现存的用户名已经有3个
                
                [users removeObjectAtIndex:0];
                [users addObject:data];
            }else
            {
                //            如果现存的用户名少于3个
                [users addObject:data];
            }
        }
    }
    
   
    [userDefault setObject:users forKey:@"USERS"];
    
    [userDefault synchronize];
    
}
//获取账号列表(已经按时间排序)
- (NSArray *)getUsers
{
    NSMutableArray *users = [NSMutableArray array];
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
 
    NSMutableArray *tempArr = [userDefault objectForKey:@"USERS"];
    
    for (NSData *data in tempArr) {
//        将用户列表中的用户对象解档
        YZKUserMessage *user = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        
        [users addObject:user];
    }

    if ([users count] == 3) {
        
        [users exchangeObjectAtIndex:0 withObjectAtIndex:2];
        
    }else if([users count] == 2)
    {
        [users exchangeObjectAtIndex:0 withObjectAtIndex:1];
    }
    
    return users;

}
//删除某个账号信息
- (void)deleteUser:(YZKUserMessage *)user
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:user];
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
     NSMutableArray *users = [NSMutableArray arrayWithArray:[userDefault objectForKey:@"USERS"]];
    
    [users removeObject:data];
    
    [userDefault setObject:users forKey:@"USERS"];
    
}
//最近登录的账号信息
- (YZKUserMessage *)lastestUser
{
    if (_lastestUser == nil) {
        
        _lastestUser = [self getUsers][0];
    }
    return _lastestUser;
}
@end

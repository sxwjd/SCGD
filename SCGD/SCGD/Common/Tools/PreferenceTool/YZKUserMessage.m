//
//  YZKUserMessage.m
//  Categories
//
//  Created by 佳冬  on 15/10/22.
//  Copyright © 2015年 YZK. All rights reserved.
//

#import "YZKUserMessage.h"

@implementation YZKUserMessage
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.userName forKey:@"userName"];
    [aCoder encodeObject:self.passWord forKey:@"passWord"];
    [aCoder encodeBool:self.isLogin forKey:@"isLogin"];
    [aCoder encodeObject:self.icon forKey:@"icon"];
    [aCoder encodeObject:self.loginId forKey:@"loginId"];
   
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.loginId = [aDecoder decodeObjectForKey:@"loginId"];
        self.userName = [aDecoder decodeObjectForKey:@"userName"];
        self.passWord = [aDecoder decodeObjectForKey:@"passWord"];
        self.isLogin = [aDecoder decodeBoolForKey:@"isLogin"];
        self.icon = [aDecoder decodeObjectForKey:@"icon"];
    }
    return self;
}
@end

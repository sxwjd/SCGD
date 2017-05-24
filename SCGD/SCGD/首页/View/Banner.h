//
//  Banner.h
//  轮播
//
//  Created by 佳冬  on 16/5/5.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Banner : NSObject
@property (nonatomic, copy) NSString *picDir;
+(Banner *)modelWithDict:(NSDictionary *)dict;
-(instancetype)initWithDict:(NSDictionary *)dict;

@end

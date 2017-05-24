//
//  YZKAnnounceModel.h
//  SCGD
//
//  Created by Lizeyu on 16/10/18.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZKAnnounceModel : NSObject
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSString *textTime;
@property (nonatomic, copy) NSString *codeNum;

+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end

//
//  YZKDetailContentModel.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/28.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZKDetailContentModel : NSObject
@property (nonatomic, copy) NSString *content;

+(YZKDetailContentModel *)modelWithDict:(NSDictionary *)dict;

@end

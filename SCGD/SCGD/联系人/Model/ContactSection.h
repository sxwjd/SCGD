//
//  ContactSection.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/20.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactSection : NSObject
/**
 *  组标题
 */
@property (nonatomic, copy) NSString *name;
/**
 *  list
 */
@property (nonatomic, strong) NSArray *ggxl;
+(ContactSection *)modelWithDict:(NSDictionary *)dict;

@end

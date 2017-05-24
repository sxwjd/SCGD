//
//  ProcessModel.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/29.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *流程model
 */
@interface ProcessModel : NSObject
@property (nonatomic, copy) NSString *color;
@property (nonatomic, copy) NSString *draftsName;
+(ProcessModel *)modelWithDict:(NSDictionary *)dict;

@end

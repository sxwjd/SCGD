//
//  ReceiveManageOponionModel.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/28.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReceiveManageOponionModel : NSObject
@property (nonatomic, copy) NSNumber *createDate;
@property (nonatomic, copy) NSString *currentOptName;
@property (nonatomic, copy) NSString *opinion;
+(ReceiveManageOponionModel *)modelWithDict:(NSDictionary *)dict;

@end

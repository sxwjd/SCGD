//
//  ReceiveManageListModel.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/26.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *审阅意见model
 */
@interface ReceiveManageListModel : NSObject


@property (nonatomic, strong) NSArray *opinions;
@property (nonatomic, copy) NSNumber *seat;

+(ReceiveManageListModel *)modelWithDict:(NSDictionary *)dict;

@end

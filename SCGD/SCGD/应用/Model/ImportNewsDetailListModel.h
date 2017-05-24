//
//  ImportNewsDetailListModel.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/26.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImportNewsDetailListModel : NSObject
/**
 *   = 1462520630000;
  = "\U56db\U5ddd\U7701\U65b0\U95fb\U51fa\U7248\U5e7f\U7535\U5c40";
  = 11;
  = admin;
  = "\U7ba1\U7406\U5458";
  = 12;
  = 1;
  = 1462520630000;
 */
@property (nonatomic, copy) NSNumber* updateDate;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *newsId;
@property (nonatomic, copy) NSString *loginName;
@property (nonatomic, copy) NSString *loginId;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *deptName;
@property (nonatomic, copy) NSNumber* createDate;
+(ImportNewsDetailListModel *)modelWithDict:(NSDictionary *)dict;



@end

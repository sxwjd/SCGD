//
//  ImportNewsDetailModel.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/26.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImportNewsDetailModel : NSObject
/**
 *     = 29;
  = "<null>";
  = "<null>";
  = 1460964900000;
  = 8041;
  = "\U8463\U6797";
  = 20160418153411;
  = "<null>";
  = "<null>";
  = 1;
  = "\U56db\U5ddd\U7701\U65b0\U95fb\U51fa\U7248\U5e7f\U7535\U5c40";
  = admin;
  = "\U7ba1\U7406\U5458";
  = 1;
  = 12;
  = "<null>";
  = "";
  = "<null>";
  = "<null>";
  = aaaaaaaa;
  = 1;
  = 4;
  = 2;
  = aaaa;
  = "2016-04-18 15:34";
  = aaaaaaaaaaaaaaaaaaaaaaaa;
  = 1460965382000;
 */
@property (nonatomic, copy) NSString *updateDate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *textTime;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSString *step;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *sort;
@property (nonatomic, copy) NSString *remark;
@property (nonatomic, copy) NSString *opinion;
@property (nonatomic, copy) NSString *nextOptName;
@property (nonatomic, copy) NSString *nextOptId;
@property (nonatomic, copy) NSString *isRead;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *enabled;
@property (nonatomic, copy) NSString *draftsName;
@property (nonatomic, copy) NSString *draftsId;
@property (nonatomic, copy) NSString *draftsDeptName;
@property (nonatomic, copy) NSString *draftsDeptId;
@property (nonatomic, copy) NSString *doAction;
@property (nonatomic, copy) NSString *deptId;
@property (nonatomic, copy) NSString *dRecordid;
@property (nonatomic, copy) NSString *currentOptName;
@property (nonatomic, copy) NSString *currentOptId;
@property (nonatomic, copy) NSString *createDate;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *approvalName;
@property (nonatomic, copy) NSString *approvalId;
+(ImportNewsDetailModel *)modelWithDict:(NSDictionary *)dict;

@end

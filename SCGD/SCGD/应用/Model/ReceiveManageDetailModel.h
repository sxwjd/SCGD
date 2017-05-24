//
//  ReceiveManageDetailModel.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/26.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *收文相关信息model
 */
@interface ReceiveManageDetailModel : NSObject
/**
 * = 26;
  = "<null>";
  = "<null>";
  = "";
  = "<null>";
  = 1;
  = "<null>";
  = 1472539871000;
  = 8003;
  = "<null>";
  = "<null>";
  = "<null>";
  = "<null>";
  = 1;
  = asdadsasd;
  = "<null>";
  = 258963;
  = "\U56db\U5ddd\U7701\U65b0\U95fb\U51fa\U7248\U5e7f\U7535\U5c40";
  = "";
  = 35;
  = "<null>";
  = "<null>";
  = "<null>";
  = "";
  = "<null>";
  = "<null>";
  = "8001,8003,8004";
  = "\U90b9\U5409\U7965,\U5f20\U6653\U6770,\U9ece\U4e07\U6052";
  = "2016-08-30";
  = "B_20160830007";
  = "<null>";
  = "<null>";
  = 1;
  = "<null>";
  = 5;
  = 6;
  = 1;
  = 1;
  = "<null>";
  = fj5;
  = 1472540150000;
  = 1;
  = "<null>";
  = "<null>";
 */
@property (nonatomic, copy) NSString *yxOptName;
@property (nonatomic, copy) NSString *yxOptId;
@property (nonatomic, copy) NSNumber *urgent;
@property (nonatomic, copy) NSNumber *updateDate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *textTime;
@property (nonatomic, copy) NSNumber *supervise;
@property (nonatomic, copy) NSString *steps;
@property (nonatomic, copy) NSString *step;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *srcFileName;
@property (nonatomic, copy) NSString *sort;
@property (nonatomic, copy) NSString *security;
@property (nonatomic, copy) NSString *remark;
@property (nonatomic, copy) NSString *registerNum;
@property (nonatomic, copy) NSString *receiverTime;
@property (nonatomic, copy) NSString *receiverName;
@property (nonatomic, copy) NSString *receiverId;
@property (nonatomic, copy) NSString *opinion;
@property (nonatomic, copy) NSString *nextOptName;
@property (nonatomic, copy) NSString *nextOptId;
@property (nonatomic, copy) NSString *loginName;
@property (nonatomic, copy) NSString *loginId;
@property (nonatomic, copy) NSString *isRead;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *fondsNum;
@property (nonatomic, copy) NSString *fondsName;
@property (nonatomic, copy) NSString *fileNum;
@property (nonatomic, copy) NSString *fileDir;
@property (nonatomic, copy) NSString *fileDept;
@property (nonatomic, copy) NSString *enabled;
@property (nonatomic, copy) NSString *doAction;
@property (nonatomic, copy) NSString *deptId;
@property (nonatomic, copy) NSString *dRecordid;
@property (nonatomic, copy) NSString *currentOptName;
@property (nonatomic, copy) NSString *currentOptId;
@property (nonatomic, copy) NSString *createDate;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *boxStatus;
@property (nonatomic, copy) NSString *blqx;
@property (nonatomic, copy) NSString *approvalName;
@property (nonatomic, copy) NSString *approvalIds;
@property (nonatomic, copy) NSString *approvalId;


+(ReceiveManageDetailModel *)modelWithDict:(NSDictionary *)dict;

@end

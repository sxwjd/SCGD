//
//  UserMessage.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/21.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 birthday = "";
 cardNo = "";
 createDate = 1382324302000;
 deptId = 1;
 deptName = "<null>";
 email = "";
 enabled = Y;
 gender = 1;
 grpoName = "<null>";
 homeAddress = "";
 id = 1;
 idNumber = "";
 levelName = "\U7ba1\U7406\U5458";
 loginId = admin;
 ncName = "<null>";
 officeNo = "<null>";
 officeTell = "";
 password = B59C67BF196A4758191E42F76670CEBA;
 phoneNo = "";
 positionId = 23;
 remark = "";
 roleName = "<null>";
 sorting = 1000;
 updateDate = 1477039673000;
 urgentUserName = "";
 urgentUserTell = "";
 userName = "\U7ba1\U7406\U5458";
 userNamePy
 */
@interface UserMessage : NSObject
@property (nonatomic, copy) NSString *levelName;
@property (nonatomic, copy) NSString *userName;

+(UserMessage *)modelWithDict:(NSDictionary *)dict;

@end

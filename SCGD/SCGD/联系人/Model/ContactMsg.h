//
//  ContactMsg.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/20.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactMsg : NSObject
//姓名
@property (nonatomic, copy) NSString *addName;
@property (nonatomic, copy) NSString *addNamePy;
@property (nonatomic, copy) NSString *age;
@property (nonatomic, copy) NSString *birthday;
//手机号
@property (nonatomic, copy) NSString *cellPhone;
@property (nonatomic, copy) NSString *children;
@property (nonatomic, copy) NSString *createDate;
@property (nonatomic, copy) NSString *duties;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *enabled;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSString *homeAddress;
@property (nonatomic, copy) NSString *homeCode;
@property (nonatomic, copy) NSString *homePhs;
@property (nonatomic, copy) NSString *homeTel;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *ismm;
@property (nonatomic, copy) NSString *loginId;
@property (nonatomic, copy) NSString *msn;
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, copy) NSString *photo;
@property (nonatomic, copy) NSString *qq;
@property (nonatomic, copy) NSString *remark;
@property (nonatomic, copy) NSString *sorting;
@property (nonatomic, copy) NSString *spouse;
@property (nonatomic, copy) NSString *typeId;
@property (nonatomic, copy) NSString *typeName;
@property (nonatomic, copy) NSString *unitAddress;
@property (nonatomic, copy) NSString *unitCode;
@property (nonatomic, copy) NSString *unitFax;
@property (nonatomic, copy) NSString *unitName;
//公司电话
@property (nonatomic, copy) NSString *unitTel;
@property (nonatomic, copy) NSString *updateDate;
+(ContactMsg *)modelWithDict:(NSDictionary *)dict;

@end

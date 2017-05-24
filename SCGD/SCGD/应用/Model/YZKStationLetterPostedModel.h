//
//  YZKStationLetterPostedModel.h
//  SCGD
//
//  Created by Lizeyu on 16/10/22.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZKStationLetterPostedModel : NSObject

/** 发送 日起 */
@property (nonatomic, copy) NSString *createDate;
/** 邮件标题 */
@property (nonatomic, copy) NSString *title;
/** 收件人 */
@property (nonatomic, copy) NSString *receiverNames;
/** 发件人 */
@property (nonatomic, copy) NSString *senderId;
/** msgText */
@property (nonatomic, copy) NSString *msgText;
/** srcFileName */
@property (nonatomic, copy) NSString *srcFileName;


+ (instancetype)modelWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end

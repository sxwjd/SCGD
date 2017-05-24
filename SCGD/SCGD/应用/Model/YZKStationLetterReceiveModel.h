//
//  YZKStationLetterModel.h
//  SCGD
//
//  Created by Lizeyu on 16/10/22.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZKStationLetterReceiveModel : NSObject
/** title */
@property (nonatomic, copy) NSString *title;
/** senderName */
@property (nonatomic, copy) NSString *senderName;
/** receiveId */
@property (nonatomic, copy) NSString *receiverId;
/** isRead */
@property (nonatomic, copy) NSString *isRead;
/** createDate */
@property (nonatomic, copy) NSString *createDate;
/** readDate */
@property (nonatomic, copy) NSNumber *readDate;
/** msgText */
@property (nonatomic, copy) NSString *msgText;
/** srcFileName */
@property (nonatomic, copy) NSString *srcFileName;

+ (instancetype)modelWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;


@end

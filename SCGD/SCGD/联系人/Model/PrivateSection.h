//
//  PrivateSection.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/20.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PrivateSection : NSObject
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *typeName;
@property (nonatomic, copy) NSString *enabled;
@property (nonatomic, copy) NSString *createDat;
@property (nonatomic, copy) NSString *loginId;
@property (nonatomic, copy) NSString *updateDate;
@property (nonatomic, copy) NSString *sorting;
+(PrivateSection *)modelWithDict:(NSDictionary *)dict;
@end

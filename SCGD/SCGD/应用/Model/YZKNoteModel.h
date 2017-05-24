//
//  YZKNoteModel.h
//  SCGD
//
//  Created by Lizeyu on 16/10/24.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZKNoteModel : NSObject
/** title */
@property (nonatomic, copy) NSString *title;
/** time */
@property (nonatomic, copy) NSString *alertTime;
/** content */
@property (nonatomic, copy) NSString *remark;
/** user name */
@property (nonatomic, copy) NSString *userName;
/** model name */
@property (nonatomic, copy) NSString *modeName;
/** status */
@property (nonatomic, assign) NSUInteger status;

+ (instancetype)modelWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;
@end

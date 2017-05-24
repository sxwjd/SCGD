//
//  YZKContentModel.h
//  SCGD
//
//  Created by Lizeyu on 16/10/20.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZKContentModel : NSObject
/** titleText */
@property (nonatomic, copy) NSString *title;
/** contentText */
@property (nonatomic, copy) NSString *content;
/** 副titleText */
@property (nonatomic, copy) NSString *sideTitle;
/** 副contentText */
@property (nonatomic, copy) NSString *sideContent;

/** 预约 contentText */
@property (nonatomic, copy) NSString *roomName;

/** 知识库 contentText */
@property (nonatomic, copy) NSString *srcFileName;



+ (instancetype)modelWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end

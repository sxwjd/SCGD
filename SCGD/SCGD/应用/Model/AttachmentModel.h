//
//  AttachmentModel.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/29.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *附件model
 */
@interface AttachmentModel : NSObject
@property (nonatomic, copy) NSString *srcFileName;
@property (nonatomic, copy) NSString *fileDir;
@property (nonatomic, copy) NSString *id;
+(AttachmentModel *)modelWithDict:(NSDictionary *)dict;

@end

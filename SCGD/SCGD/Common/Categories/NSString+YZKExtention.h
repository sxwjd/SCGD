//
//  NSString+YZKExtention.h
//  Categories
//
//  Created by 佳冬  on 15/10/20.
//  Copyright (c) 2015年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (YZKExtention)
#pragma mark --获取沙盒路径
/**
 *  获取沙盒中 Documents文件的路径
 *
 */
+(NSString *)pathForDocuments;
/**
 *  获取沙盒中  Documents文件中某个子文件的路径
 *  fileName   子文件名称
 */
+(NSString *)filePathAtDocumentsWithFileName:(NSString *)fileName;
/**
 *  获取沙盒中 Library下Caches文件的路径
 */
+(NSString *)pathForCaches;
/**
 *  获取沙盒中 Caches文件中某个子文件的路径
 *  fileName   子文件名称
 */
+(NSString *)filePathAtCachesWithFileName:(NSString *)fileName;
/**
 *  获取沙盒中 Library文件的路径
 */
+(NSString *)pathForLibrary;
/**
 *  获取沙盒中 Library文件中某个子文件的路径
 *  fileName   子文件名称
 */
+(NSString *)filePathAtLibraryWithFileName:(NSString *)fileName;
/**
 *  获取沙盒中  Temp文件的路径
 */
+(NSString *)pathForTemp;
/**
 *  获取沙盒中  Library下Preference的路径
 */
+(NSString *)pathForPreference;
/**
 *  获取沙盒中  Preference下某个子文件的路径
 */
+(NSString *)filePathAtPreferenceWithFileName:(NSString *)fileName;
#pragma mark --计算文本的尺寸
/**
 *  快速计算出文本的尺寸
 *
 *  @param font    文字的字体
 *  @param maxSize 文本的最大尺寸
 *
 *  @return 计算出的文本的具体尺寸
 */
-(CGSize)sizeWithFont:(UIFont *)font andMaxSize:(CGSize)maxSize;








@end

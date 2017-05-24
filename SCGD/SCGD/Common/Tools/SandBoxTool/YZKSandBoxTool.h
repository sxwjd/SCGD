//
//  YZKSandBoxTool.h
//  Categories
//
//  Created by 佳冬  on 15/11/3.
//  Copyright (c) 2015年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZKSandBoxTool : NSObject

/**
 *  根据路径返回目录或文件的大小 MB
 *
 *  @param path 文件路径
 *
 *  @return double MB
 */
+ (double)sizeWithFilePath:(NSString *)path;

/**
 *  得到指定目录下的所有文件
 *
 *  @param dirPath 指定目录
 *
 *  @return NSArray
 */
+ (NSArray *)getAllFileNames:(NSString *)dirPath;

/**
 *  删除指定目录或文件
 *
 *  @param path 指定目录或文件路径
 *
 *  @return BOOL
 */
+ (BOOL)clearCachesWithFilePath:(NSString *)path;

/**
 *  清空指定目录下文件
 *
 *  @param dirPath 目录路径
 *
 *  @return BOOL
 */
+ (BOOL)clearCachesFromDirectoryPath:(NSString *)dirPath;
@end

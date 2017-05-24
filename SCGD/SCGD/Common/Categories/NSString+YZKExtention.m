//
//  NSString+YZKExtention.m
//  Categories
//
//  Created by 佳冬  on 15/10/20.
//  Copyright (c) 2015年 YZK. All rights reserved.
//

#import "NSString+YZKExtention.h"

@implementation NSString (YZKExtention)
+(NSString *)pathForDirectory:(NSSearchPathDirectory)directory
{
    return NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES)[0];
}

+(NSString *)pathForDocuments
{
    return [self pathForDirectory:NSDocumentDirectory];
}

+(NSString *)filePathAtDocumentsWithFileName:(NSString *)fileName
{
    return [[self pathForDocuments] stringByAppendingPathComponent:fileName];
}

+(NSString *)pathForLibrary
{
    return [self pathForDirectory:NSLibraryDirectory];
}

+(NSString *)filePathAtLibraryWithFileName:(NSString *)fileName
{
    return [[self pathForLibrary] stringByAppendingPathComponent:fileName];
}

+(NSString *)pathForCaches
{
    return [self pathForDirectory:NSCachesDirectory];
}

+(NSString *)filePathAtCachesWithFileName:(NSString *)fileName
{
    return [[self pathForCaches] stringByAppendingString:fileName];
}

+(NSString *)pathForTemp
{
    return NSTemporaryDirectory();
}

+(NSString *)pathForPreference
{
    return [self pathForDirectory:NSPreferencePanesDirectory];
}

+(NSString *)filePathAtPreferenceWithFileName:(NSString *)fileName
{
    return [[self pathForPreference] stringByAppendingPathComponent:fileName];
}

-(CGSize)sizeWithFont:(UIFont *)font andMaxSize:(CGSize)maxSize
{
    NSDictionary *arrts = @{NSFontAttributeName:font};
    
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:arrts context:nil].size;
}







@end

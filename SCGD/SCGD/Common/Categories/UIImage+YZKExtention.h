//
//  UIImage+YZKExtention.h
//  Categories
//
//  Created by 佳冬  on 15/10/20.
//  Copyright (c) 2015年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YZKExtention)
/**
 *  返回一个可以任意拉伸不变形的图片
 *  图片名字
 */
+(UIImage *)resizebleWithImageName:(NSString *)imageName;
/**
 *  给指定UIImage对象做拉伸处理
 *
 */
-(UIImage *)resizebleImage;

- (UIImage *)imageWithScale:(CGFloat)width;
@end

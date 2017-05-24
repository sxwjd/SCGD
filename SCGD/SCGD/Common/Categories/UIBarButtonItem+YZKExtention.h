//
//  UIBarButtonItem+YZKExtention.h
//  Categories
//
//  Created by 佳冬  on 15/10/22.
//  Copyright (c) 2015年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (YZKExtention)
/**
 *  创建一个item
 *
 *  @param target    点击item后调用哪个对象的方法
 *  @param action    点击item后调用target的哪个方法
 *  @param image     图片
 *  @param highImage 高亮的图片
 *
 *  @return 创建完的item
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage title:(NSString *)title;

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title font:(CGFloat)font color:(UIColor *)color;
@end

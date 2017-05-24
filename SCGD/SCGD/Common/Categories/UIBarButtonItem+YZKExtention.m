//
//  UIBarButtonItem+YZKExtention.m
//  Categories
//
//  Created by 佳冬  on 15/10/22.
//  Copyright (c) 2015年 YZK. All rights reserved.
//

#import "UIBarButtonItem+YZKExtention.h"
#import "UIView+YZKExtention.h"
@implementation UIBarButtonItem (YZKExtention)
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
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIImage *img = [UIImage imageNamed:image];
    
    if(image){// 设置图片
        [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    }
    if(highImage){//设置高亮图片
        [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    }
    // 设置尺寸

    btn.size = img.size;

    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage title:(NSString *)title
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIImage *img = [UIImage imageNamed:image];
    
    if(image){
        [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    }
    if(highImage){
        [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    }
    if (title) {
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    }
    
    
//    btn.size = img.size;
    btn.size = img.size;
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title font:(CGFloat)font color:(UIColor *)color
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 40, 40);
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:color forState:UIControlStateNormal];
//    btn.backgroundColor = [UIColor blackColor];
    btn.titleLabel.font = [UIFont systemFontOfSize:font];
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, -5);
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end

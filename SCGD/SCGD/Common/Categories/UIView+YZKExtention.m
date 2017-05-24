//
//  UIView+YZKExtention.m
//  Categories
//
//  Created by 佳冬  on 15/10/20.
//  Copyright (c) 2015年 YZK. All rights reserved.
//

#import "UIView+YZKExtention.h"

@implementation UIView (YZKExtention)
-(void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
-(CGFloat)x
{
    return self.frame.origin.x;
}
-(void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
-(CGFloat)y
{
    return self.frame.origin.y;
}
-(void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
-(CGFloat)width
{
    return self.frame.size.width;
}
-(void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
-(CGFloat)height
{
    return self.frame.size.height;
}
-(void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
-(CGSize)size
{
    return self.frame.size;
}
-(void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

-(CGFloat)centerX
{
    return self.center.y;
}
-(void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}
-(CGFloat)centerY
{
    return self.center.y;
}
-(void)alignHorizontal
{
    self.x = (self.superview.width - self.width) * 0.5;
}
-(void)alignVertical
{
    self.y = (self.superview.height - self.height) * 0.5;
}
-(void)removeAfterDelay:(NSTimeInterval)time
{
    [self performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:time];
}
-(void)removeImediatly
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(removeFromSuperview) object:nil];
    [self removeFromSuperview];
}
@end

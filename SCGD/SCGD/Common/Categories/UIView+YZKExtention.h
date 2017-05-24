//
//  UIView+YZKExtention.h
//  Categories
//
//  Created by 佳冬  on 15/10/20.
//  Copyright (c) 2015年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YZKExtention)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGSize size;

/**
 *  水平居中
 */
-(void)alignHorizontal;
/**
 *  垂直居中
 */
-(void)alignVertical;
/**
 *  一段时间后移除View
 *
 *  @param time 时间
 */
- (void)removeAfterDelay:(NSTimeInterval)time;
/**
 *  立即移除view
 */
- (void)removeImediatly;
@end

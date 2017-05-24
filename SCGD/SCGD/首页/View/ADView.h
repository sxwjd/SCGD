//
//  ADView.h
//  轮播
//
//  Created by 佳冬  on 16/5/5.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ADView;
@protocol ADViewDelegate<NSObject>
@optional
- (void)adView:(ADView *)adView didSelectedWithIndex:(NSInteger)Index;
@end
@interface ADView : UIView
@property (nonatomic, weak) id<ADViewDelegate> delegate;
/**
 *  占位图
 */
@property (nonatomic, strong) UIImage *placeholderImage;
/**
 *  滚动延时
 */
@property (nonatomic, assign) NSTimeInterval AutoScrollDelay;
/**
 *  加载本地图片
 *
 *  @param frame      位置
 *  @param imageArray 图片数据源
 *
 *  @return
 */
- (instancetype)initWithFrame:(CGRect)frame WithLoacalImages:(NSArray *)imageArray;
/**
 *  加载网络图片
 *
 *  @param frame      位置大小
 *  @param imageArray 图片数据源
 *
 *  @return
 */
- (instancetype)initWithFrame:(CGRect)frame WithNetImages:(NSArray *)imageArray;
@end

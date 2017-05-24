//
//  HomeDataController.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/17.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeDataController : NSObject
/**
 *  轮播图数据
 */
@property (nonatomic, strong) NSMutableArray *BannerData;
/**
 *  请求轮播图数据
 */
- (void)requestBannerDataWithCallback:(void(^)(NSError *error))callback;
/**
 *  刷新轮播图数据
 */
- (void)refreshBannerDataWithCallback:(void (^)(NSError *))callback;
@end

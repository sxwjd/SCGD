//
//  BannerHeadView.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/18.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeHeadView.h"

@interface BannerHeadView : UIView
@property (nonatomic, copy) NSString *title;
@property (nonatomic, weak) id<HomeHeadViewDelegate>delegate;
- (instancetype)initWithBannerData:(NSArray *)bannerData;
@end

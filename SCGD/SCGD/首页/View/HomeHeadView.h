//
//  HomeHeadView.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/18.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeHeadView;
@protocol  HomeHeadViewDelegate<NSObject>
@optional
- (void)selectedMoreInHeadView:(HomeHeadView *)homeHeadView;
@end
@interface HomeHeadView : UIView
@property (nonatomic, copy) NSString *title;
@property (nonatomic, weak) id<HomeHeadViewDelegate>delegate;
@end

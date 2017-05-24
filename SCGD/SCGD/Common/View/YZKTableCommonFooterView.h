//
//  YZKTableCommonFooterView.h
//  SCGD
//
//  Created by Lizeyu on 16/10/21.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YZKTableCommonFooterView;

@protocol YZKTableCommonFooterViewDelegate <NSObject>
- (void)tableCommonFooterView:(YZKTableCommonFooterView *)view sureBtnDidClick:(UIButton *)button;

@end

@interface YZKTableCommonFooterView : UIView
@property (nonatomic, weak) id<YZKTableCommonFooterViewDelegate> delegate;

- (void)showWithTitle:(NSString *)title;
@end

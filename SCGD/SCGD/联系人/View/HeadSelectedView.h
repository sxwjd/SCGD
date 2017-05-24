//
//  HeadSelectedView.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/18.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HeadSelectedView;
@protocol HeadSelectedViewDelegate<NSObject>
@optional
- (void)headSelectedView:(HeadSelectedView *)headSelectedView SelectedWithTag:(NSInteger)tag;
@end
@interface HeadSelectedView : UIView
@property (nonatomic, copy) NSString *leftTitle;
@property (nonatomic, copy) NSString *rightTitle;
@property (nonatomic, weak) id<HeadSelectedViewDelegate>delegate;
@end

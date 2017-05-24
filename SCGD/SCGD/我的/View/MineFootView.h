//
//  MineFootView.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/19.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MineFootView;
@protocol MineFootViewDelegate<NSObject>
@optional
- (void)signOutInMineFootView:(MineFootView *)footView;
@end
@interface MineFootView : UIView
@property (nonatomic, weak) id<MineFootViewDelegate>delegate;
@end

//
//  ChangePasswordView.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/20.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ChangePasswordView;
@protocol ChangePasswordViewDelegate <NSObject>
@optional
- (void)changePasswordInChangePasswordView:(ChangePasswordView *)changepwdView;
@end
@interface ChangePasswordView : UIView
@property(nonatomic, weak) id<ChangePasswordViewDelegate>delegate;
@property (nonatomic, copy) NSString *oldPwd;
@property (nonatomic, copy) NSString *firstNewPwd;
@property (nonatomic, copy) NSString *secondNewPwd;
@end

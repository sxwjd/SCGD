//
//  LoginView.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/17.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LoginView;
@protocol LoginViewDelegate<NSObject>
@optional
- (void)doLiginInloginView:(LoginView *)loginView;
@end
@interface LoginView : UIView
@property (nonatomic, copy) NSString *loginId;
@property (nonatomic, copy) NSString *passWord;
@property (nonatomic, weak) id<LoginViewDelegate>delegate;
@end

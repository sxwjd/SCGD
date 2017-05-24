//
//  ChangePasswordView.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/20.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "ChangePasswordView.h"
@interface ChangePasswordView()
/**
 *  oldpwdIcon
 */
@property (nonatomic, strong) UIImageView *oldpwdIcon;
/**
 *  oldpwdField
 */
@property (nonatomic, strong) UITextField *oldpwdField;
/**
 *  oldpwdLine
 */
@property (nonatomic, strong) UIView *oldpwdLine;
/**
 *  newpwdIcon
 */
@property (nonatomic, strong) UIImageView *newpwdIcon;
/**
 *  newpwdField
 */
@property (nonatomic, strong) UITextField *newpwdField;
/**
 *  newpwdLine
 */
@property (nonatomic, strong) UIView *newpwdLine;
/**
 *  secondNewpwdIcon
 */
@property (nonatomic, strong) UIImageView *secondNewpwdIcon;
/**
 *  secondNewpwdField
 */
@property (nonatomic, strong) UITextField *secondNewpwdField;
/**
 *  secondNewpwdLine
 */
@property (nonatomic, strong) UIView *secondNewpwdLine;
/**
 *  certainBtn
 */
@property (nonatomic, strong) UIButton *certainBtn;
@end
@implementation ChangePasswordView
- (instancetype)init
{
    if (self = [super init]) {
        [self loadSubView];
    }
    return self;
}
- (void)loadSubView
{
    _oldpwdIcon = [[UIImageView alloc] init];
    _oldpwdIcon.image = [UIImage imageNamed:@"profile_password-"];
    [self addSubview:_oldpwdIcon];
    
    _oldpwdField = [[UITextField alloc] init];
    _oldpwdField.textColor = UIColorRGB(0x333333);
    _oldpwdField.placeholder = @"请输入旧密码";
    _oldpwdField.font = [UIFont systemFontOfSize:12];
    [self addSubview:_oldpwdField];
    
    _oldpwdLine = [[UIView alloc] init];
    _oldpwdLine.backgroundColor = lineColor;
    [self addSubview:_oldpwdLine];
    
    _newpwdIcon = [[UIImageView alloc] init];
    _newpwdIcon.image = [UIImage imageNamed:@"profile_password-"];
    [self addSubview:_newpwdIcon];
    
    _newpwdField = [[UITextField alloc] init];
    _newpwdField.textColor = UIColorRGB(0x333333);
    _newpwdField.placeholder = @"请输入新密码";
    _newpwdField.font = [UIFont systemFontOfSize:12];
    [self addSubview:_newpwdField];
    
    _newpwdLine = [[UIView alloc] init];
    _newpwdLine.backgroundColor = lineColor;
    [self addSubview:_newpwdLine];
    
    _secondNewpwdIcon = [[UIImageView alloc] init];
    _secondNewpwdIcon.image = [UIImage imageNamed:@"profile_password-"];
    [self addSubview:_secondNewpwdIcon];
    
    _secondNewpwdField = [[UITextField alloc] init];
    _secondNewpwdField.textColor = UIColorRGB(0x666666);
    _secondNewpwdField.placeholder = @"请再次输入新密码";
    _secondNewpwdField.font = [UIFont systemFontOfSize:12];
    [self addSubview:_secondNewpwdField];
    
    _secondNewpwdLine = [[UIView alloc] init];
    _secondNewpwdLine.backgroundColor = lineColor;
    [self addSubview:_secondNewpwdLine];
    
    _certainBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _certainBtn.layer.cornerRadius = 5.0;
    _certainBtn.backgroundColor = mainColor;
    [_certainBtn setTitle:@"确定修改" forState:UIControlStateNormal];
    _certainBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [_certainBtn addTarget:self action:@selector(changePwd) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_certainBtn];
    
    [_oldpwdIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(myheight(64));
        make.left.equalTo(self).offset(mywidth(42));
        make.width.mas_equalTo(mywidth(36));
    }];
    [_oldpwdField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_oldpwdIcon.mas_right).offset(mywidth(16));
        make.centerY.equalTo(_oldpwdIcon);
        make.right.equalTo(self).offset(-mywidth(20));
    }];
    
    [_oldpwdLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_oldpwdField.mas_bottom).offset(myheight(26));
        make.left.equalTo(self).offset(mywidth(20));
        make.right.equalTo(self).offset(-mywidth(20));
        make.height.equalTo(@1);
    }];
    
    [_newpwdIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_oldpwdLine.mas_bottom).offset(myheight(48));
        make.left.equalTo(self).offset(mywidth(42));
        make.width.mas_equalTo(mywidth(36));
    }];
    [_newpwdField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_newpwdIcon.mas_right).offset(mywidth(16));
        make.centerY.equalTo(_newpwdIcon);
        make.right.equalTo(self).offset(-mywidth(20));
    }];
    
    [_newpwdLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_newpwdField.mas_bottom).offset(myheight(26));
        make.left.equalTo(self).offset(mywidth(20));
        make.right.equalTo(self).offset(-mywidth(20));
        make.height.equalTo(@1);
    }];
    
    [_secondNewpwdIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_newpwdLine.mas_bottom).offset(myheight(48));
        make.left.equalTo(self).offset(mywidth(42));
        make.width.mas_equalTo(mywidth(36));
    }];
    [_secondNewpwdField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_secondNewpwdIcon.mas_right).offset(mywidth(16));
        make.centerY.equalTo(_secondNewpwdIcon);
        make.right.equalTo(self).offset(-mywidth(20));
    }];
    
    [_secondNewpwdLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_secondNewpwdField.mas_bottom).offset(myheight(26));
        make.left.equalTo(self).offset(mywidth(20));
        make.right.equalTo(self).offset(-mywidth(20));
        make.height.equalTo(@1);
    }];
    
    [_certainBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_secondNewpwdLine.mas_bottom).offset(myheight(80));
        make.left.equalTo(self).offset(mywidth(20));
        make.right.equalTo(self).offset(-mywidth(20));
        make.height.mas_equalTo(myheight(76));
    }];
}
- (void)changePwd
{
    self.oldPwd = _oldpwdField.text;
    self.firstNewPwd = _newpwdField.text;
    self.secondNewPwd = _secondNewpwdField.text;
    
    [SVProgressHUD setMinimumDismissTimeInterval:0.5];
    if (!self.oldPwd.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入旧密码"];
        return;
    }
    if (!self.firstNewPwd.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入新密码"];
        return;
    }
    if (!self.secondNewPwd.length) {
        [SVProgressHUD showErrorWithStatus:@"请再次输入新密码"];
        return;
    }
    if (![self.firstNewPwd isEqualToString:self.secondNewPwd]) {
        [SVProgressHUD showErrorWithStatus:@"两次输入新密码不同，请检查"];
        return;
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(changePasswordInChangePasswordView:)]) {
        [self.delegate changePasswordInChangePasswordView:self];
    }
}
@end

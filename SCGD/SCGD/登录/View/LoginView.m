//
//  LoginView.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/17.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "LoginView.h"
@interface LoginView()
/**
 *  logo
 */
@property (nonatomic, strong) UIImageView *logoView;
/**
 *  contentView
 */
@property (nonatomic, strong) UIView *contentView;
/**
 *  头标题
 */
@property (nonatomic, strong) UILabel *headLabel;
/**
 *  账号logo
 */
@property (nonatomic, strong) UIImageView *loginIdLogo;
/**
 *  账号输入框
 */
@property (nonatomic, strong) UITextField *loginIdField;
/**
 *  账号分割线
 */
@property (nonatomic, strong) UIView *loginIdLine;
/**
 *  密码logo
 */
@property (nonatomic, strong) UIImageView *pwdLogo;
/**
 *  密码输入框
 */
@property (nonatomic, strong) UITextField *pwdField;
/**
 *  密码分割线
 */
@property (nonatomic, strong) UIView *pwdLine;
/**
 *  登录按钮
 */
@property (nonatomic, strong) UIButton *loginBtn;
@end
@implementation LoginView
- (instancetype)init
{
    if (self = [super init]) {
        [self loadSubView];
    }
    return self;
}
- (void)loadSubView
{
    _logoView = [[UIImageView alloc] init];
    _logoView.image = [UIImage imageNamed:@"home_logo"];
    [self addSubview:_logoView];
    
    _contentView = [[UIView alloc] init];
    _contentView.layer.cornerRadius = 8.0;
    _contentView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_contentView];
    
    _headLabel = [[UILabel alloc] init];
    _headLabel.textAlignment = NSTextAlignmentCenter;
    _headLabel.text = @"四川省新闻出版广电局政务系统";
    _headLabel.font = [UIFont systemFontOfSize:16];
    _headLabel.textColor = mainColor;
    [_contentView addSubview:_headLabel];
    
    _loginIdLogo = [[UIImageView alloc] init];
    _loginIdLogo.image = [UIImage imageNamed:@"home_accouunt"];
    [_contentView addSubview:_loginIdLogo];
    
    _loginIdField = [[UITextField alloc] init];
    _loginIdField.font = [UIFont systemFontOfSize:14];
    _loginIdField.placeholder = @"请输入用户名";
    _loginIdField.textColor = UIColorRGB(0x333333);
    [_contentView addSubview:_loginIdField];
    
    _loginIdLine = [[UIView alloc] init];
    _loginIdLine.backgroundColor = lineColor;
    [_contentView addSubview:_loginIdLine];
    
    _pwdLogo = [[UIImageView alloc] init];
    _pwdLogo.image = [UIImage imageNamed:@"home_password"];
    [_contentView addSubview:_pwdLogo];
    
    _pwdField = [[UITextField alloc] init];
    _pwdField.secureTextEntry = YES;
    _pwdField.textColor = UIColorRGB(0x333333);
    _pwdField.placeholder = @"请输入密码";
    _pwdField.font = [UIFont systemFontOfSize:14];
    [_contentView addSubview:_pwdField];
    
    _pwdLine = [[UIView alloc] init];
    _pwdLine.backgroundColor = lineColor;
    [_contentView addSubview:_pwdLine];
    
    _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _loginBtn.backgroundColor = mainColor;
    _loginBtn.layer.cornerRadius = 5.0;
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    _loginBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [_contentView addSubview:_loginBtn];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_logoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(mywidth(110));
        make.width.mas_equalTo(mywidth(110));
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(0);
    }];
    
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(_logoView.mas_bottom).offset(myheight(40));
        make.bottom.equalTo(self);
    }];
    
    [_headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_contentView).offset(40);
        make.left.equalTo(_contentView).offset(10);
        make.right.equalTo(_contentView).offset(-10);
    }];
    
    [_loginIdLogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headLabel.mas_bottom).offset(40);
        make.left.equalTo(_contentView).offset(10);
        make.height.mas_equalTo(myheight(45));
        make.width.mas_equalTo(mywidth(40));
    }];
    
    [_loginIdField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headLabel.mas_bottom).offset(40);
        make.left.equalTo(_loginIdLogo.mas_right).offset(mywidth(20));
        make.right.equalTo(_contentView).offset(-mywidth(20));
        make.height.mas_equalTo(myheight(45));
    }];
    
    [_loginIdLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_loginIdField.mas_bottom).offset(myheight(10));
        make.left.equalTo(_loginIdLogo);
        make.right.equalTo(_loginIdField);
        make.height.equalTo(@1);
    }];
    
    [_pwdLogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_loginIdLine.mas_bottom).offset(myheight(30));
        make.left.equalTo(_contentView).offset(mywidth(20));
        make.height.mas_equalTo(myheight(47));
        make.width.mas_equalTo(mywidth(36));
    }];
    
    [_pwdField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_loginIdLine.mas_bottom).offset(myheight(30));
        make.left.equalTo(_pwdLogo.mas_right).offset(mywidth(20));
        make.right.equalTo(_contentView).offset(-mywidth(20));
        make.height.mas_equalTo(myheight(47));
    }];
    [_pwdLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_pwdField.mas_bottom).offset(myheight(10));
        make.left.equalTo(_pwdLogo);
        make.right.equalTo(_pwdField);
        make.height.equalTo(@1);
    }];
    
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_pwdLine.mas_bottom).offset(15);
        make.left.equalTo(_contentView).offset(10);
        make.right.equalTo(_contentView).offset(-10);
        make.height.equalTo(@36);
        make.bottom.equalTo(_contentView).offset(-40);
    }];
}
- (void)login
{
    [SVProgressHUD setMinimumDismissTimeInterval:1.0];
    self.loginId = _loginIdField.text;
    self.passWord = _pwdField.text;
    if (!self.loginId.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入账号"];
        return;
    }
    if (!self.passWord.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入密码"];
        return;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(doLiginInloginView:)]) {
        [self.delegate doLiginInloginView:self];
    }
}
@end

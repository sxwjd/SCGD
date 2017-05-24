//
//  NoteView.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/20.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "NoteView.h"
@interface NoteView()
/**
 *  backView
 */
@property (nonatomic, strong) UIView *backView;
/**
 *  titleView
 */
@property (nonatomic, strong) UILabel *titleView;
/**
 *  leftBtn
 */
@property (nonatomic, strong) UIButton *leftBtn;
/**
 *  rightBtn
 */
@property (nonatomic, strong) UIButton *rightBtn;
@end
@implementation NoteView
- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        [self loadSubView];
    }
    return self;
}
- (void)loadSubView
{
    _backView = [[UIView alloc] init];
    _backView.layer.cornerRadius = 8.0;
    _backView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_backView];
    
    _titleView = [[UILabel alloc] init];
    _titleView.text = @"是否退出系统登录？";
    _titleView.textColor = fontBlackColor;
    _titleView.font = [UIFont systemFontOfSize:18];
    _titleView.textAlignment = NSTextAlignmentCenter;
    [_backView addSubview:_titleView];
    
    _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftBtn.backgroundColor = mainColor;
    _leftBtn.layer.cornerRadius = 5.0;
    _leftBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    _leftBtn.tag = 0;
    [_leftBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_leftBtn setTitle:@"确定" forState:UIControlStateNormal];
    [_backView addSubview:_leftBtn];
    
    _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightBtn.backgroundColor = mainColor;
    _rightBtn.layer.cornerRadius = 5.0;
    _rightBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    _rightBtn.tag = 1;
    [_rightBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_rightBtn setTitle:@"取消" forState:UIControlStateNormal];
    [_backView addSubview:_rightBtn];
    
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(mywidth(58));
        make.right.equalTo(self).offset(-mywidth(58));
        make.top.equalTo(self).offset(myheight(309));
        make.height.mas_equalTo(myheight(300));
    }];
    
    [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_backView).offset(myheight(84));
        make.left.equalTo(_backView);
        make.right.equalTo(_backView);
    }];
    
    [_leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_backView).offset(mywidth(120));
        make.bottom.equalTo(_backView).offset(-myheight(40));
        make.top.equalTo(_backView).offset(myheight(215));
    }];
    
    [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_backView).offset(myheight(215));
        make.right.equalTo(_backView).offset(-mywidth(120));
        make.bottom.equalTo(_backView).offset(-myheight(40));
        make.left.equalTo(_leftBtn.mas_right).offset(mywidth(159));
        make.width.equalTo(_leftBtn);
    }];
}
- (void)btnClicked:(UIButton *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(signOutWithTag:)]) {
        [self.delegate signOutWithTag:sender.tag];
    }
}
@end

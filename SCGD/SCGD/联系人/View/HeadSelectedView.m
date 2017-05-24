//
//  HeadSelectedView.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/18.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "HeadSelectedView.h"
@interface HeadSelectedView()
{
    UIButton *_selectedBtn;
}
/**
 *  line
 */
@property (nonatomic, strong) UIView *bottomLine;
/**
 *  line
 */
@property (nonatomic, strong) UIView *bottomLine2;
/**
 *  leftBtn
 */
@property (nonatomic, strong) UIButton *leftBtn;
/**
 *  rightBtn
 */
@property (nonatomic, strong) UIButton *rightBtn;
@end
@implementation HeadSelectedView
- (instancetype)init
{
    if (self = [super init]) {
     
        [self loadSubView];
    }
    return self;
}

- (void)loadSubView
{
    _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftBtn.tag = 0;
    _leftBtn.backgroundColor = mainBackgroundColor;
    [_leftBtn addTarget:self action:@selector(selected:) forControlEvents:UIControlEventTouchUpInside];
    [_leftBtn setTitleColor:mainColor forState:UIControlStateSelected];
    [_leftBtn setTitleColor:UIColorRGB(0x666666) forState:UIControlStateNormal];
    [_leftBtn setTitle:@"公共通讯录" forState:UIControlStateNormal];
    _leftBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:_leftBtn];
    
    _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightBtn.tag = 1;
    _rightBtn.backgroundColor = mainBackgroundColor;
    [_rightBtn addTarget:self action:@selector(selected:) forControlEvents:UIControlEventTouchUpInside];
    [_rightBtn setTitleColor:mainColor forState:UIControlStateSelected];
    [_rightBtn setTitleColor:UIColorRGB(0x666666) forState:UIControlStateNormal];
    _rightBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:_rightBtn];
    
    _bottomLine = [[UIView alloc] init];
    _bottomLine.backgroundColor = mainColor;
    [self addSubview:_bottomLine];
    
    _bottomLine2 = [[UIView alloc] init];
    _bottomLine2.backgroundColor = mainColor;
    [self addSubview:_bottomLine2];
    
    [_leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.bottom.equalTo(self);
    }];
    
    [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(_leftBtn.mas_right);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.width.equalTo(_leftBtn.mas_width);
    }];
    
    [_bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_leftBtn.mas_left);
        make.right.equalTo(_leftBtn.mas_right);
        make.bottom.equalTo(_leftBtn.mas_bottom);
        make.height.equalTo(@1);
    }];
    
    [_bottomLine2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_rightBtn.mas_left);
        make.right.equalTo(_rightBtn.mas_right);
        make.bottom.equalTo(_rightBtn.mas_bottom);
        make.height.equalTo(@1);
    }];
    
    _selectedBtn = _leftBtn;
    _bottomLine2.hidden = YES;
    _bottomLine.hidden = NO;
    _selectedBtn.selected = YES;
    _selectedBtn.backgroundColor = [UIColor whiteColor];
}
- (void)selected:(UIButton *)sender
{
    _selectedBtn.selected = NO;
    _selectedBtn.backgroundColor = mainBackgroundColor;
    
    _selectedBtn = sender;
    _selectedBtn.selected = YES;
    _selectedBtn.backgroundColor = [UIColor whiteColor];
    
    if ([_selectedBtn isEqual:_leftBtn]) {
        _bottomLine2.hidden = YES;
        _bottomLine.hidden = NO;
    }else
    {
        _bottomLine2.hidden = NO;
        _bottomLine.hidden = YES;
    }
    if ([self.delegate respondsToSelector:@selector(headSelectedView:SelectedWithTag:)] && self.delegate) {
        [self.delegate headSelectedView:self SelectedWithTag:_selectedBtn.tag];
    }
}
- (void)setRightTitle:(NSString *)rightTitle
{
    _rightTitle = rightTitle;
     [_rightBtn setTitle:_rightTitle forState:UIControlStateNormal];
}
- (void)setLeftTitle:(NSString *)leftTitle
{
    _leftTitle = leftTitle;
    [_leftBtn setTitle:_leftTitle forState:UIControlStateNormal];
}

@end

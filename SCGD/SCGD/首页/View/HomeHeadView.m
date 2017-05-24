//
//  HomeHeadView.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/18.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "HomeHeadView.h"
@interface HomeHeadView()
/**
 *  topLine
 */
@property (nonatomic, strong) UIView *topLine;
/**
 *  title
 */
@property (nonatomic, strong) UILabel *titleLabel;
/**
 *  more
 */
@property (nonatomic, strong) UIButton *moreBtn;
/**
 *  bottomLine
 */
@property (nonatomic, strong) UIView *bottomLine;
@end
@implementation HomeHeadView
- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        [self loadSubView];
    }
    return self;
}
- (void)loadSubView
{
    _topLine = [[UIView alloc] init];
    _topLine.backgroundColor = lineColor;
    [self addSubview:_topLine];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = mainColor;
    _titleLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:_titleLabel];
    
    _moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_moreBtn addTarget:self action:@selector(more) forControlEvents:UIControlEventTouchUpInside];
    [_moreBtn setImage:[UIImage imageNamed:@"home_more"] forState:UIControlStateNormal];
    [self addSubview:_moreBtn];
    
    _bottomLine = [[UIView alloc] init];
    _bottomLine.backgroundColor = lineColor;
    [self addSubview:_bottomLine];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(@1);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20 / IPHONE6_WIDTH * SCREEN_WIDTH);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
    }];
    
    [_moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-30 / IPHONE6_WIDTH * SCREEN_WIDTH);
        make.centerY.equalTo(self);
    }];
    
    [_bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(@1);
    }];
}
- (void)more
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectedMoreInHeadView:)]) {
        [self.delegate selectedMoreInHeadView:self];
    }
}
- (void)setTitle:(NSString *)title
{
    _title = title;
    _titleLabel.text = _title;
}
@end

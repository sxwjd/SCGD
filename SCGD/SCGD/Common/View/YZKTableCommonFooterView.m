//
//  YZKTableCommonFooterView.m
//  SCGD
//
//  Created by Lizeyu on 16/10/21.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKTableCommonFooterView.h"

@interface YZKTableCommonFooterView()
@property (nonatomic, strong) UIButton *sureBtn;

@property (nonatomic, strong) UILabel *bottomLabel;

@end

@implementation YZKTableCommonFooterView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [_sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_sureBtn.titleLabel setFont:[UIFont systemFontOfSize:17]];
    [_sureBtn setBackgroundColor:mainColor];
    _sureBtn.layer.cornerRadius = 5;
    _sureBtn.layer.masksToBounds = YES;
    [_sureBtn addTarget:self action:@selector(sureBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.sureBtn];
}


- (void)sureBtnDidClick:(UIButton *)button{
    if ([_delegate respondsToSelector:@selector(tableCommonFooterView:sureBtnDidClick:)]) {
        [_delegate tableCommonFooterView:self sureBtnDidClick:button];
    }
}

- (void)showWithTitle:(NSString *)title{
    if (self == [super init]) {
        [self setupTitleWithTitle:title];
    }
}

- (void)setupTitleWithTitle:(NSString *)title{
    _bottomLabel = [[UILabel alloc] init];
    _bottomLabel.text = title;
    _bottomLabel.font = [UIFont systemFontOfSize:13];
    _bottomLabel.textColor = UIColorRGB(0xb8b8b8);
    [self addSubview:_bottomLabel];
    if (_bottomLabel) {
        self.sureBtn.hidden = YES;
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    if (_sureBtn) {
        [_sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(myheight(80));
            make.left.equalTo(self.mas_left).offset(mywidth(20));
            make.width.mas_equalTo(mywidth(710));
            make.height.mas_equalTo(myheight(76));
        }];
    }
    if (_bottomLabel) {
        [_bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(mywidth(20));
            make.top.equalTo(self.mas_top).offset(myheight(20));
        }];
    }
}

@end

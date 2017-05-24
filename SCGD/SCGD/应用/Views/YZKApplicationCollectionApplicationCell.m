//
//  YZKApplicationCollectionApplicationCell.m
//  SCGD
//
//  Created by Lizeyu on 16/10/17.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKApplicationCollectionApplicationCell.h"
#import "YZKApplicationModel.h"

@interface YZKApplicationCollectionApplicationCell()
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *label;
@end

@implementation YZKApplicationCollectionApplicationCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self setupUI];
        self.backgroundColor = UIColorRGB(0xffffff);
    }
    return self;
}

- (void)setupUI{
    _iconImageView = [[UIImageView alloc] init];
    [self addSubview:_iconImageView];
    
    _label = [[UILabel alloc] init];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.font = [UIFont systemFontOfSize:14];
    _label.textColor = UIColorRGB(0x666666);
    [self addSubview:_label];
}

- (void)setModel:(YZKApplicationModel *)model{
    _model = model;
    _iconImageView.image = [UIImage imageNamed:model.iconName];
    if ([model.text isEqualToString:@""]) {
        _iconImageView.center = self.center;
        _label.hidden = YES;
        [_label removeFromSuperview];
    }else{
        _label.text = model.text;
    }
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    if (_iconImageView && !_label.isHidden) {
        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.top.equalTo(self.mas_top).offset(myheight(20));
            make.width.mas_equalTo(_iconImageView.image.size.width);
            make.height.mas_equalTo(_iconImageView.image.size.height);
        }];
    }
    if (!_label.isHidden) {
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
           make.centerX.equalTo(self.mas_centerX);
            make.top.equalTo(self.iconImageView.mas_bottom).offset(myheight(24));
            make.bottom.equalTo(self.mas_bottom).offset(-myheight(34));
        }];
    }
    if (_label.isHidden) {
        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.centerY.equalTo(self.mas_centerY);
        }];
    }
}

@end

//
//  YZKPopCommonCell.m
//  SCGD
//
//  Created by Lizeyu on 16/10/19.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKPopCommonCell.h"
#import "YZKApplicationModel.h"

@interface YZKPopCommonCell()
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *label;

@end

@implementation YZKPopCommonCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    _iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    [self.contentView addSubview:_iconView];
    
    _label = [[UILabel alloc] init];
    _label.font = [UIFont systemFontOfSize:13];
    _label.textAlignment = NSTextAlignmentLeft;
    _label.textColor = UIColorRGB(0x666666);
    [self.contentView addSubview:_label];
}

- (void)setModel:(YZKApplicationModel *)model{
    _model = model;
    _iconView.image = [UIImage imageNamed:model.iconName];
    _label.text = model.text;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    if (_iconView) {
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(mywidth(14));
            make.centerY.equalTo(self.mas_centerY);
        }];
    }
    if (_label) {
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_iconView.mas_right).offset(mywidth(20));
            make.centerY.equalTo(self.mas_centerY);
        }];
    }
}



@end

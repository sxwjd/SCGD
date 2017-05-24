//
//  YZKSingleLineCell.m
//  SCGD
//
//  Created by Lizeyu on 16/10/19.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKSingleLineCell.h"
#import "YZKContentModel.h"

@interface YZKSingleLineCell()
/** 左边标题 label */
@property (nonatomic, strong) UILabel *titleLabel;
/** 内容 label */
@property (nonatomic, strong) UILabel *contentLabel;
/** 副标题 label */
@property (nonatomic, strong) UILabel *rightLabel;
/** 副内容 label */
@property (nonatomic, strong) UILabel *rightContentLabel;
/** 附件 icon */
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, assign) BOOL isShow;
@end

@implementation YZKSingleLineCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = [UIFont systemFontOfSize:15];
    _titleLabel.textColor = UIColorRGB(0xb8b8b8);
    [self.contentView addSubview:_titleLabel];
    
    _contentLabel = [[UILabel alloc] init];
    _contentLabel.numberOfLines = 0;
    _contentLabel.font = [UIFont systemFontOfSize:15];
    _contentLabel.textColor = UIColorRGB(0x333333);
    [self.contentView addSubview:_contentLabel];
    
    _rightLabel = [[UILabel alloc] init];
    _rightLabel.font = [UIFont systemFontOfSize:15];
    _rightLabel.textColor = UIColorRGB(0xb8b8b8);
    [self.contentView addSubview:_rightLabel];
    
    _rightContentLabel = [[UILabel alloc] init];
    _rightContentLabel.font = [UIFont systemFontOfSize:12];
    _rightContentLabel.textColor = UIColorRGB(0x333333);
    [self.contentView addSubview:_rightContentLabel];
    
    _iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"application_accessory"]];
    _iconImageView.hidden = YES;
    [self.contentView addSubview:_iconImageView];
}

- (void)setModel:(YZKContentModel *)model{
    _model = model;
    _titleLabel.text = [NSString stringWithFormat:@"%@ :",model.title];
    _contentLabel.text = model.content;
    if (model.sideTitle && model.sideContent) {
        _rightLabel.text = [NSString stringWithFormat:@"%@ :", model.sideTitle];
        _rightContentLabel.text = model.sideContent;
    }else{
        _rightContentLabel.hidden = YES;
        _rightLabel.hidden = YES;
    }
    if ([model.title isEqualToString:@"附件"]) {
        _iconImageView.hidden = NO;
    }else{
        _iconImageView.hidden = YES;
        [_iconImageView removeFromSuperview];
    }
}

- (void)createWithTitle:(NSString *)title content:(NSString *)content rightLabel:(NSString *)rightTitle rightContent:(NSString *)rightContent showIcon:(BOOL)show{
    _isShow = show;
    if (show) {
        _iconImageView.hidden = NO;
        [self layoutIfNeeded];
    }else if(!show){
        _iconImageView.hidden = YES;
    }
    _titleLabel.text = title;
    if ([content isEqualToString:@"1"]) {
        _contentLabel.text = @"未办理";
    }else if([content isEqualToString:@"2"]){
        _contentLabel.text = @"已办理";
    }else{
        _contentLabel.text = content;
    }
    _rightLabel.text = rightTitle;
    _rightContentLabel.text = rightContent;
   
}

- (void)layoutSubviews{
    [super layoutSubviews];
    if (_iconImageView) {
        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(mywidth(20));
            make.centerY.equalTo(self.contentView.mas_centerY);
        }];
    }
    if (_titleLabel) {
        if (_isShow) {
            [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.iconImageView.mas_right).offset(mywidth(20));
//                make.top.equalTo(self.contentView.mas_top).offset(myheight(20));
                make.centerY.equalTo(self.iconImageView.mas_centerY);
                make.height.mas_equalTo(myheight(40));
            }];
        }else if(!_isShow){
            [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.contentView.mas_left).offset(mywidth(20));
                make.top.equalTo(self.contentView.mas_top).offset(myheight(20));
                make.height.mas_equalTo(myheight(40));
            }];
        }
    }
    if (_contentLabel) {
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(mywidth(160));
//            make.centerY.equalTo(self.titleLabel.mas_centerY);
            make.top.equalTo(self.titleLabel.mas_top);
            make.width.mas_equalTo(mywidth(590));
            make.bottom.equalTo(self.contentView.mas_bottom).offset(myheight(-20));
        }];
    }
    if (_rightLabel) {
        [_rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(mywidth(410));
            make.centerY.equalTo(self.titleLabel.mas_centerY);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(myheight(-20));
        }];
    }
    if (_rightContentLabel) {
        [_rightContentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(_titleLabel.mas_right).offset(mywidth(12));
            make.right.equalTo(self.contentView.mas_right).offset(mywidth(-40));
            make.centerY.equalTo(self.titleLabel.mas_centerY);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(myheight(-20));
        }];
    }
}

@end

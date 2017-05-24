//
//  YZKNoteCell.m
//  SCGD
//
//  Created by Lizeyu on 16/10/24.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKNoteCell.h"
#import "YZKNoteModel.h"

@interface YZKNoteCell()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *contentLabel;



@end

@implementation YZKNoteCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        self.preservesSuperviewLayoutMargins = NO;
    }
    return self;
}


- (void)setupUI{
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = [UIFont systemFontOfSize:15];
    _titleLabel.textColor = UIColorRGB(0x333333);
    [self.contentView addSubview:_titleLabel];
    
    _timeLabel = [[UILabel alloc] init];
    _timeLabel.font = [UIFont systemFontOfSize:12];
    _timeLabel.textColor = UIColorRGB(0xb8b8b8);
    [self.contentView addSubview:_timeLabel];
    
    _contentLabel = [[UILabel alloc] init];
    _contentLabel.font = [UIFont systemFontOfSize:14];
    _contentLabel.textColor = UIColorRGB(0x666666);
    [self.contentView addSubview:_contentLabel];
    
}

- (void)setModel:(YZKNoteModel *)model{
    _model = model;
    _titleLabel.text = model.title;
    _timeLabel.text = model.alertTime;
    _contentLabel.text = model.remark;

}

- (void)layoutSubviews{
    [super layoutSubviews];
    if (_titleLabel) {
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(mywidth(20));
            make.top.equalTo(self.mas_top).offset(myheight(20));
        }];
    }
    if (_timeLabel) {
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(mywidth(20));
            make.top.equalTo(self.titleLabel.mas_bottom).offset(myheight(26));
        }];
    }
    if (_contentLabel) {
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(mywidth(20));
            make.top.equalTo(self.timeLabel.mas_bottom).offset(myheight(26));
            make.width.mas_greaterThanOrEqualTo(mywidth(282));
        }];
    }

}

@end

//
//  YZKCommonCell.m
//  SCGD
//
//  Created by Lizeyu on 16/10/18.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKCommonCell.h"
#import "YZKAnnounceModel.h"
#import "YZKReceiveModel.h"
#import "YZKStationLetterPostedModel.h"

@interface YZKCommonCell()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *codeNumLabel;



@end

@implementation YZKCommonCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        self.preservesSuperviewLayoutMargins = NO;
    }
    return self;
}

- (void)setupUI{
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = UIColorRGB(0x333333);
    _titleLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_titleLabel];
    
    _detailLabel = [[UILabel alloc] init];
    _detailLabel.textColor = UIColorRGB(0x666666);
    _detailLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_detailLabel];
    
    _timeLabel = [[UILabel alloc] init];
    _timeLabel.textColor = UIColorRGB(0xb8b8b8);
    _timeLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:_timeLabel];
    
    _codeNumLabel = [[UILabel alloc] init];
    _codeNumLabel.textColor = UIColorRGB(0xb8b8b8);
    _codeNumLabel.font = [UIFont systemFontOfSize:12];
    _codeNumLabel.hidden = YES;
//    _codeNumLabel.hidden = YES;
    [self.contentView addSubview:_codeNumLabel];
}

- (void)setModel:(YZKAnnounceModel *)model{
    _model = model;
    _titleLabel.text = model.title;
    _detailLabel.text = model.subject;
//    if (!model.codeNum) {
//        _codeNumLabel.hidden = YES;
//    }else {
//        _codeNumLabel.hidden = NO;
//        _codeNumLabel.text = model.codeNum;
//    }
    _timeLabel.text = model.textTime;
    
}

- (void)setReceiveModel:(YZKReceiveModel *)receiveModel{
    _receiveModel = receiveModel;
    _titleLabel.text = receiveModel.title;
    _detailLabel.text = receiveModel.fileDept;
    _timeLabel.text = receiveModel.receiverTime;
    _codeNumLabel.text = receiveModel.fileNum;
    
}

- (void)setLetterPostedModel:(YZKStationLetterPostedModel *)letterPostedModel{
    _letterPostedModel = letterPostedModel;
    _titleLabel.text = letterPostedModel.title;
    _detailLabel.text = letterPostedModel.receiverNames;
    _timeLabel.text = letterPostedModel.createDate;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    if (_titleLabel) {
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(mywidth(20));
            make.top.equalTo(self.mas_top).offset(myheight(24));
//            make.width.mas_equalTo(mywidth(400));
            make.right.equalTo(self.codeNumLabel.mas_left);
            make.height.mas_equalTo(myheight(32));
        }];
    }
    if (_detailLabel) {
        [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(mywidth(20));
            make.top.equalTo(self.titleLabel.mas_bottom).offset(myheight(26));
            make.width.mas_lessThanOrEqualTo(mywidth(480));
            make.bottom.equalTo(self.mas_bottom).offset(-myheight(24));
        }];
    }
    if (_timeLabel) {
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-mywidth(30));
            make.bottom.equalTo(self.mas_bottom).offset(-myheight(10));
        }];
    }
    if (_codeNumLabel) {
        [_codeNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-mywidth(30));
            make.top.equalTo(self.mas_top).offset(myheight(24));
        }];
    }
}

@end

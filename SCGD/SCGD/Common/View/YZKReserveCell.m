//
//  YZKReserveCell.m
//  SCGD
//
//  Created by Lizeyu on 16/10/19.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKReserveCell.h"
#import "YZKReserveModel.h"
#import "NSDate+Extension.h"
#import "YZKStationLetterReceiveModel.h"
#import "YZKNetworkDiskModel.h"

@interface YZKReserveCell()
/** title label */
@property (nonatomic, strong) UILabel *titleLabel;
/** reserve person label*/
@property (nonatomic, strong) UILabel *personLabel;
/** reserve time label */
@property (nonatomic, strong) UILabel *timeLabel;
/** rightside time label */
@property (nonatomic, strong) UILabel *rightSideTimeLabel;
/** left read imageView */
@property (nonatomic, strong) UIImageView *leftReadView;
/** right read label */
@property (nonatomic, strong) UILabel *rightReadLabel;

@end

@implementation YZKReserveCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = [UIFont systemFontOfSize:15];
    _titleLabel.textColor = UIColorRGB(0x333333);
    [self.contentView addSubview:_titleLabel];
    
    _personLabel = [[UILabel alloc] init];
    _personLabel.font = [UIFont systemFontOfSize:14];
    _personLabel.textColor = UIColorRGB(0x666666);
    [self.contentView addSubview:_personLabel];
    
    _timeLabel = [[UILabel alloc] init];
    _timeLabel.font = [UIFont systemFontOfSize:12];
    _timeLabel.textColor = UIColorRGB(0xb8b8b8);
    [self.contentView addSubview:_timeLabel];
    
    _rightSideTimeLabel = [[UILabel alloc] init];
    _rightSideTimeLabel.font = [UIFont systemFontOfSize:12];
    _rightSideTimeLabel.textColor = UIColorRGB(0xb8b8b8);
    [self.contentView addSubview:_rightSideTimeLabel];
    
    _leftReadView = [[UIImageView alloc] init];
    _leftReadView.hidden = YES;
    [self.contentView addSubview:_leftReadView];
    
    _rightReadLabel = [[UILabel alloc] init];
    _rightReadLabel.font = [UIFont systemFontOfSize:12];
    _rightReadLabel.textColor = UIColorRGB(0xb8b8b8);
    _rightReadLabel.hidden = YES;
    [self.contentView addSubview:_rightReadLabel];
}

- (void)setModel:(YZKReserveModel *)model{
    _model = model;
    _titleLabel.text = model.roomName;
    _personLabel.text = model.userName;
    _timeLabel.text = [NSString stringWithFormat:@"%@-%@",[model.startTime substringToIndex:model.startTime.length - 3],[model.endTime substringToIndex:model.endTime.length - 3]];
    _rightSideTimeLabel.text = [[NSDate dateFromInterval:model.createDate] componentsSeparatedByString:@" "][0];
}

- (void)setReceivedModel:(YZKStationLetterReceiveModel *)receivedModel{
    _leftReadView.hidden = NO;
    _receivedModel = receivedModel;
    _titleLabel.text = receivedModel.title;
    _personLabel.text = receivedModel.senderName;
    _timeLabel.text = receivedModel.createDate;
    if ([receivedModel.isRead isEqualToString:@"Y"]) {
        _leftReadView.image = [UIImage imageNamed:@"application_read"];
        _rightReadLabel.hidden = NO;
        _rightReadLabel.text = @"已读 :";
    }else{
        _leftReadView.image = [UIImage imageNamed:@"application_unread"];
    }
    _rightSideTimeLabel.text = [NSDate dateFromInterval:receivedModel.readDate];
}

- (void)setNetworkDiskModel:(YZKNetworkDiskModel *)networkDiskModel{
    _networkDiskModel = networkDiskModel;
    _titleLabel.text = networkDiskModel.title;
    _personLabel.text = networkDiskModel.srcFileName;
    _timeLabel.text = [NSString stringWithFormat:@"共享: %@",networkDiskModel.content];
    _rightSideTimeLabel.text = networkDiskModel.updateDate;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    if (_titleLabel) {
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(mywidth(20));
            make.top.equalTo(self.mas_top).offset(myheight(20));
            make.width.mas_equalTo(mywidth(350));
        }];
    }
    if (_personLabel) {
        [_personLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(mywidth(20));
            make.top.equalTo(_titleLabel.mas_bottom).offset(myheight(24));
        }];
    }
    if (_timeLabel) {
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(mywidth(20));
            make.top.equalTo(_personLabel.mas_bottom).offset(myheight(24));
            make.bottom.equalTo(self.mas_bottom).offset(-myheight(20));
        }];
    }
    if (_rightSideTimeLabel) {
        [_rightSideTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-mywidth(30));
            make.centerY.equalTo(self.timeLabel.mas_centerY);
        }];
    }
    if (_leftReadView) {
        [_leftReadView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_titleLabel.mas_centerY);
            make.left.equalTo(_titleLabel.mas_right).offset(mywidth(20));
        }];
    }
    if (_rightReadLabel) {
        [_rightReadLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_rightSideTimeLabel.mas_centerY);
            make.right.equalTo(_rightSideTimeLabel.mas_left).offset(-mywidth(10));
        }];
    }
}

@end

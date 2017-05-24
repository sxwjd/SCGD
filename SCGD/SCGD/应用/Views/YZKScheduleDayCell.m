//
//  YZKScheduleDayCell.m
//  SCGD
//
//  Created by Lizeyu on 16/10/26.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKScheduleDayCell.h"
#import "YZKScheduleModel.h"

@interface YZKScheduleDayCell()
@property (nonatomic, strong) UIImageView *alertView;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIImageView *bgView;

@end


@implementation YZKScheduleDayCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    _bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"application_below"]];
    _bgView.frame = CGRectMake(mywidth(240), 0, 1, myheight(158));
    [self.contentView addSubview:_bgView];
    
    _alertView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"application_bell"]];
//    _alertView.hidden = YES;
    [self.contentView addSubview:_alertView];
    
    _dateLabel = [[UILabel alloc] init];
    _dateLabel.textColor = UIColorRGB(0x666666);
    _dateLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:_dateLabel];
    
    _contentLabel = [[UILabel alloc] init];
    _contentLabel.textColor = UIColorRGB(0x666666);
    _contentLabel.font = [UIFont systemFontOfSize:15];
    _contentLabel.numberOfLines = 0;
    [self.contentView addSubview:_contentLabel];
    
}

- (void)setModel:(YZKScheduleModel *)model{
    _model = model;
    _dateLabel.text = [NSString stringWithFormat:@"%@-%@",[model.startTime substringWithRange:NSMakeRange(10, 6)],[model.endTime substringWithRange:NSMakeRange(10, 6)]];
    _contentLabel.text = model.content;
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    if (_alertView) {
        [_alertView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(myheight(30));
            make.left.equalTo(self.mas_left).offset(mywidth(20));
        }];
    }
    if (_dateLabel) {
        [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(mywidth(50));
            make.top.equalTo(self.mas_top).offset(myheight(30));
        }];
    }
    if (_contentLabel) {
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_bgView.mas_right).offset(mywidth(20));
            make.top.equalTo(self.mas_top).offset(myheight(30));
//            make.right.equalTo(self.mas_right).offset(-mywidth(40));
//            make.height.mas_equalTo(self.height - myheight(60));
        }];
    }
}

@end

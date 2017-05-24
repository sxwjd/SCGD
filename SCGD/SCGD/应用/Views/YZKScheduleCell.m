//
//  YZKScheduleCell.m
//  SCGD
//
//  Created by Lizeyu on 16/10/25.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKScheduleCell.h"
#import "YZKScheduleMonthModel.h"
#import "YZKScheduleModel.h"

@interface YZKScheduleCell()
/** 月日 label */
@property (nonatomic, strong) UILabel *dayLabel;
@property (nonatomic, strong) UILabel *topLabel;
@property (nonatomic, strong) UILabel *middleLabel;
@property (nonatomic, strong) UILabel *belowLabel;
@property (nonatomic, strong) UILabel *topTimeLabel;
@property (nonatomic, strong) UILabel *middleTimeLabel;
@property (nonatomic, strong) UILabel *belowTimeLabel;
/** cell image view */
@property (nonatomic, strong) UIImageView *bgView;


@end

@implementation YZKScheduleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        self.preservesSuperviewLayoutMargins = NO;
    }
    return self;
}

- (void)setupUI{
    
    _bgView = [[UIImageView alloc] init];
    [self.contentView addSubview:_bgView];
    
    _dayLabel = [[UILabel alloc] init];
    _dayLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_dayLabel];
    
    _topLabel = [[UILabel alloc] init];
    _topLabel.font = [UIFont systemFontOfSize:15];
    _topLabel.textColor = UIColorRGB(0x666666);
    [self.contentView addSubview:_topLabel];
    
    _middleLabel = [[UILabel alloc] init];
    _middleLabel.font = [UIFont systemFontOfSize:15];
    _middleLabel.textColor = UIColorRGB(0x666666);
    [self.contentView addSubview:_middleLabel];
    
    _belowLabel = [[UILabel alloc] init];
    _belowLabel.font = [UIFont systemFontOfSize:15];
    _belowLabel.textColor = UIColorRGB(0x666666);
    [self.contentView addSubview:_belowLabel];
    
    _topTimeLabel = [[UILabel alloc] init];
    _topTimeLabel.font = [UIFont systemFontOfSize:12];
    _topTimeLabel.textColor = UIColorRGB(0xd8d8d8);
    [self.contentView addSubview:_topTimeLabel];
    
    _middleTimeLabel = [[UILabel alloc] init];
    _middleTimeLabel.font = [UIFont systemFontOfSize:12];
    _middleTimeLabel.textColor = UIColorRGB(0xd8d8d8);
    [self.contentView addSubview:_middleTimeLabel];
    
    _belowTimeLabel = [[UILabel alloc] init];
    _belowTimeLabel.font = [UIFont systemFontOfSize:12];
    _belowTimeLabel.textColor = UIColorRGB(0xd8d8d8);
    [self.contentView addSubview:_belowTimeLabel];
    
    
}

- (void)setIndividualModel:(YZKScheduleMonthModel *)individualModel{
    _individualModel = individualModel;
    if (individualModel.scheduleModels.count == 3) {
        YZKScheduleModel *firstModel = individualModel.scheduleModels[0];
        YZKScheduleModel *secondModel = individualModel.scheduleModels[1];
        YZKScheduleModel *thirdModel = individualModel.scheduleModels.lastObject;
        _dayLabel.text = [NSString stringWithFormat:@"%@/%@",[firstModel.startTime componentsSeparatedByString:@"-"][1],[[firstModel.startTime componentsSeparatedByString:@"-"][2] substringWithRange:NSMakeRange(0, 2)]];
        _topLabel.text = firstModel.content;
        _middleLabel.text = secondModel.content;
        _belowLabel.text = thirdModel.content;
        
        _topTimeLabel.text = [NSString stringWithFormat:@"%@-%@",[firstModel.startTime substringWithRange:NSMakeRange(10, 6)],[firstModel.endTime substringWithRange:NSMakeRange(10, 6)]];
        _middleTimeLabel .text = [NSString stringWithFormat:@"%@-%@",[secondModel.startTime substringWithRange:NSMakeRange(10, 6)],[secondModel.endTime substringWithRange:NSMakeRange(10, 6)]];
        _belowTimeLabel.text = [NSString stringWithFormat:@"%@-%@",[thirdModel.startTime substringWithRange:NSMakeRange(10, 6)],[thirdModel.endTime substringWithRange:NSMakeRange(10, 6)]];
    }else if (individualModel.scheduleModels.count == 1){
        YZKScheduleModel *firstModel = individualModel.scheduleModels.firstObject;
          _dayLabel.text = [NSString stringWithFormat:@"%@/%@",[firstModel.startTime componentsSeparatedByString:@"-"][1],[[firstModel.startTime componentsSeparatedByString:@"-"][2] substringWithRange:NSMakeRange(0, 2)]];
         _topLabel.text = firstModel.content;
        _topTimeLabel.text = [NSString stringWithFormat:@"%@-%@",[firstModel.startTime substringWithRange:NSMakeRange(10, 6)],[firstModel.endTime substringWithRange:NSMakeRange(10, 6)]];
    }else if(individualModel.scheduleModels.count > 3){
        YZKScheduleModel *firstModel = individualModel.scheduleModels.firstObject;
        YZKScheduleModel *thirdModel = individualModel.scheduleModels.lastObject;
        _dayLabel.text = [NSString stringWithFormat:@"%@/%@",[firstModel.startTime componentsSeparatedByString:@"-"][1],[[firstModel.startTime componentsSeparatedByString:@"-"][2] substringWithRange:NSMakeRange(0, 2)]];
        _topLabel.text = firstModel.content;
        _middleLabel.text = @".......................................";
        _belowLabel.text = thirdModel.content;
        
        _topTimeLabel.text = [NSString stringWithFormat:@"%@-%@",[firstModel.startTime substringWithRange:NSMakeRange(10,6)],[firstModel.endTime substringWithRange:NSMakeRange(10, 6)]];
        _middleTimeLabel.text = @".....................";
        _belowTimeLabel.text = [NSString stringWithFormat:@"%@-%@",[thirdModel.startTime substringWithRange:NSMakeRange(10,6)],[thirdModel.endTime substringWithRange:NSMakeRange(10, 6)]];
    }
}

- (void)backGroundImage{
    _bgView.image = [UIImage imageNamed:@"application_below"];
    _bgView.frame = CGRectMake(mywidth(120), 0, 1, myheight(180));
}

- (void)layoutSubviews{
    [super layoutSubviews];
    if (_dayLabel) {
        [_dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(mywidth(20));
            make.centerY.equalTo(self.mas_centerY);
        }];
    }
    if (_topLabel) {
        [_topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(myheight(15));
            make.left.equalTo(self.mas_left).offset(mywidth(170));
            
        }];
    }
    if (_middleLabel) {
        [_middleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_topLabel.mas_bottom).offset(myheight(16));
            make.left.equalTo(self.mas_left).offset(mywidth(170));
            make.height.equalTo(self.topLabel.mas_height);
        }];
    }
    if (_belowLabel) {
        [_belowLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_middleLabel.mas_bottom).offset(myheight(16));
            make.left.equalTo(self.mas_left).offset(mywidth(170));
            make.height.equalTo(self.middleLabel.mas_height);
            make.bottom.equalTo(self.mas_bottom).offset(myheight(-20));
        }];
    }
    if (_topTimeLabel) {
        [_topTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-mywidth(26));
            make.centerY.equalTo(_topLabel.mas_centerY);
        }];
    }
    if (_middleTimeLabel) {
        [_middleTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-mywidth(26));
            make.centerY.equalTo(_middleLabel.mas_centerY);
        }];
    }
    if (_belowTimeLabel) {
        [_belowTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-mywidth(26));
            make.centerY.equalTo(_belowLabel.mas_centerY);
        }];
    }
    
}




@end

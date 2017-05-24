//
//  ReceiveManageDetailCell.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/24.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "ReceiveManageDetailCell.h"
#import "YZKLeftViewLabel.h"
#import "ReceiveManageOponionModel.h"
#import "NSDate+Extension.h"

@interface ReceiveManageDetailCell()
/**
 *  局长意见
 */
@property (nonatomic, strong) YZKLeftViewLabel *opinionView;
/**
 *  姓名
 */
@property (nonatomic, strong) YZKLeftViewLabel *userNameView;
/**
 *  日期
 */
@property (nonatomic, strong) YZKLeftViewLabel *dateView;
@end
@implementation ReceiveManageDetailCell
+(ReceiveManageDetailCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *cellID = @"ReceiveManageDetailCell";
    ReceiveManageDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        
        cell = [[ReceiveManageDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self loadSubViews];
    }
    return  self;
}
- (void)loadSubViews
{
    _opinionView = [[YZKLeftViewLabel alloc] init];
    _opinionView.leftViewText = @"局长意见:";
    _opinionView.leftViewFont = [UIFont systemFontOfSize:15];
    _opinionView.leftViewColor = UIColorRGB(0xb8b8b8);
    _opinionView.contentViewFont = [UIFont systemFontOfSize:15];
    _opinionView.contentViewColor = fontBlackColor;
    [self.contentView addSubview:_opinionView];
    _opinionView.contentViewText = @" ";
    
    _userNameView = [[YZKLeftViewLabel alloc] init];
    _userNameView.leftViewText = @"姓名:";
    _userNameView.leftViewFont = [UIFont systemFontOfSize:15];
    _userNameView.leftViewColor = UIColorRGB(0xb8b8b8);
    _userNameView.contentViewFont = [UIFont systemFontOfSize:15];
    _userNameView.contentViewColor = fontBlackColor;
    [self.contentView addSubview:_userNameView];
    _userNameView.contentViewText = @" ";
    
    _dateView = [[YZKLeftViewLabel alloc] init];
    _dateView.leftViewText = @"日期:";
    _dateView.leftViewFont = [UIFont systemFontOfSize:15];
    _dateView.leftViewColor = UIColorRGB(0xb8b8b8);
    _dateView.contentViewFont = [UIFont systemFontOfSize:12];
    _dateView.contentViewColor = fontBlackColor;
    [self.contentView addSubview:_dateView];
    _dateView.contentViewText = @"" ;
    
    
    CGFloat leadding = myheight(20);
    CGFloat padding = mywidth(20);
    
    [_opinionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(leadding);
        make.left.equalTo(self.contentView).offset(padding);
        make.right.equalTo(self.contentView).offset(-padding);
    }];
    
    [_userNameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_opinionView.mas_bottom).offset(leadding);
        make.left.equalTo(self.contentView).offset(padding);
        make.right.equalTo(self.contentView).offset(-padding);
    }];
    
    [_dateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_userNameView.mas_bottom).offset(leadding);
        make.left.equalTo(self.contentView).offset(padding);
        make.right.equalTo(self.contentView).offset(-padding);
        make.bottom.equalTo(self.contentView).offset(-leadding);
    }];

}
- (void)setModel:(ReceiveManageOponionModel *)model
{
    _opinionView.contentViewText = model.opinion;
    _userNameView.contentViewText = model.currentOptName;
    _dateView.contentViewText = [NSDate dateFromInterval:model.createDate];
}
- (void)setSeat:(NSNumber *)seat
{
    switch ([seat integerValue]) {
        case 1:
        {
           _opinionView.leftViewText = @"局长意见";
        }
            break;
        case 2:
        {
            _opinionView.leftViewText = @"分管领导意见";

        }
            break;
        case 3:
        {
            _opinionView.leftViewText = @"承办处室意见";

        }
            break;
        case 4:
        {
            _opinionView.leftViewText = @"办公室意见";

        }
            break;

    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end

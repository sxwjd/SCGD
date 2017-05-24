//
//  HomeCell.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/18.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "HomeCell.h"
@interface HomeCell()
/**
 *  title
 */
@property (nonatomic, strong) UILabel *titleLabel;
/**
 *  date
 */
@property (nonatomic, strong) UILabel *dateLabel;
@end
@implementation HomeCell
+(HomeCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *cellID = @"Home";
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        
        cell = [[HomeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
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
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = [UIFont systemFontOfSize:14];
    _titleLabel.textColor = fontBlackColor;
    [self.contentView addSubview:_titleLabel];
    _titleLabel.text = @"我局部署全省新闻出版社广播影视重我局部署全省新闻出版社广播影视重";
    
    _dateLabel = [[UILabel alloc] init];
    _dateLabel.font = [UIFont systemFontOfSize:12];
    _dateLabel.textColor = fontlightGrayColor;
    _dateLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:_dateLabel];
    _dateLabel.text = @"2016-07-08";
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-mywidth(30));
        make.centerY.equalTo(self.contentView);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(mywidth(38));
        make.right.equalTo(_dateLabel.mas_left).offset(-mywidth(88));
        make.centerY.equalTo(self.contentView);
    }];
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

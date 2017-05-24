//
//  PrivateSectionCell.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/19.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "PrivateSectionCell.h"
@interface PrivateSectionCell()
/**
 *  leftIcon
 */
@property (nonatomic, strong) UIImageView *leftIcon;
/**
 *  titleView
 */
@property (nonatomic, strong) UILabel *titleView;
@end
@implementation PrivateSectionCell
+(PrivateSectionCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *cellID = @"PrivateSectionCell";
    PrivateSectionCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        
        cell = [[PrivateSectionCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
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
    _leftIcon = [[UIImageView alloc] init];
    _leftIcon.image = [UIImage imageNamed:@"contact_name"];
    [self.contentView addSubview:_leftIcon];
    
    _titleView = [[UILabel alloc] init];
    _titleView.textColor = fontGrayColor;
    _titleView.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_titleView];
    _titleView.text = @"组名";
    
    [_leftIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(mywidth(20));
        make.centerY.equalTo(self.contentView);
    }];
    
    [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_leftIcon.mas_right).offset(mywidth(24));
        make.centerY.equalTo(self.contentView);
    }];
}
- (void)setTitle:(NSString *)title
{
    _title = title;
    _titleView.text = _title;
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

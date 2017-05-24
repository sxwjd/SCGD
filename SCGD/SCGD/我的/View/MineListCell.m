//
//  MineListCell.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/19.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "MineListCell.h"
@interface MineListCell()
/**
 *  leftIcon
 */
@property (nonatomic, strong) UIImageView *leftIcon;
/**
 *  titleView
 */
@property (nonatomic, strong) UILabel *titleView;
/**
 *  moreView
 */
@property (nonatomic, strong) UIImageView *moreView;
@end
@implementation MineListCell
+(MineListCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *cellID = @"MineListCell";
    MineListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        
        cell = [[MineListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
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
    _leftIcon.image = [UIImage imageNamed:@"profile_modify"];
    [self.contentView addSubview:_leftIcon];
    
    _titleView = [[UILabel alloc] init];
    _titleView.font = [UIFont systemFontOfSize:16];
    _titleView.textColor = UIColorRGB(0x333333);
    _titleView.text = @"密码修改";
    [self.contentView addSubview:_titleView];
    
    _moreView = [[UIImageView alloc] init];
    _moreView.image = [UIImage imageNamed:@"profile_right-arrow"];
    [self.contentView addSubview:_moreView];
    
    [_leftIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(mywidth(30));
        make.centerY.equalTo(self.contentView);
    }];
    
    [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_leftIcon.mas_right).offset(mywidth(30));
        make.centerY.equalTo(self.contentView);
    }];
    
    [_moreView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-mywidth(30));
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

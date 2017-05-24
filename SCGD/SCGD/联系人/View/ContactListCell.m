//
//  ContactListCell.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/19.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "ContactListCell.h"
#import "ContactMsg.h"

@interface ContactListCell()
/**
 *  icon
 */
@property (nonatomic, strong) UIImageView *iconView;
/**
 *  name
 */
@property (nonatomic, strong) UILabel *nameView;
/**
 *  tel1
 */
@property (nonatomic, strong) UILabel *tel1View;
/**
 *  tel1Btn
 */
@property (nonatomic, strong) UIButton *tel1Btn;

@end
@implementation ContactListCell
+(ContactListCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *cellID = @"ContactListCell";
    ContactListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        
        cell = [[ContactListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
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
    _iconView = [[UIImageView alloc] init];
    _iconView.image = [UIImage imageNamed:@"contact_icon"];
    [self.contentView addSubview:_iconView];
    
    _nameView = [[UILabel alloc] init];
    _nameView.textColor = fontGrayColor;
    _nameView.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_nameView];
    
    _tel1View = [[UILabel alloc] init];
    _tel1View.textAlignment = NSTextAlignmentRight;
    _tel1View.textColor = fontGrayColor;
    _tel1View.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:_tel1View];
    
    _tel1Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_tel1Btn setImage:[UIImage imageNamed:@"contact_phone"] forState:UIControlStateNormal];
     [_tel1Btn addTarget:self action:@selector(tel:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_tel1Btn];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    UIView *contentView = self.contentView;
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(contentView).offset(mywidth(32));
        make.centerY.equalTo(contentView);
    }];
    
    [_nameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconView.mas_right).offset(mywidth(22));
        make.centerY.equalTo(contentView);
    }];
    [_tel1Btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(contentView).offset(-mywidth(30));
        make.centerY.equalTo(contentView);
    }];
    [_tel1View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_tel1Btn.mas_left).offset(-mywidth(22));
        make.centerY.equalTo(contentView);
    }];
    
}

- (void)tel:(UIButton *)sender
{
    NSMutableString* str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",_tel1View.text                                        ];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}
- (void)setContact:(ContactMsg *)contact
{
    _tel1View.text = @" ";
    _nameView.text = contact.addName;
    if (contact.unitTel.length) {
        _tel1View.text = [contact.unitTel isKindOfClass:[NSString class]] ? contact.unitTel : @" ";
    }
    if (contact.cellPhone.length) {
        _tel1View.text = [contact.cellPhone isKindOfClass:[NSString class]] ? contact.cellPhone : @" ";
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

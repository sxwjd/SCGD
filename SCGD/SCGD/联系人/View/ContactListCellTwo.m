//
//  ContactListCellTwo.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/20.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "ContactListCellTwo.h"
#import "ContactMsg.h"
@interface ContactListCellTwo()
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
/**
 *  tel2
 */
@property (nonatomic, strong) UILabel *tel2View;
/**
 *  tel2Btn
 */
@property (nonatomic, strong) UIButton *tel2Btn;
@end

@implementation ContactListCellTwo
+(ContactListCellTwo *)cellWithTableView:(UITableView *)tableView
{
    static NSString *cellID = @"ContactListCellTwo";
    ContactListCellTwo *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        
        cell = [[ContactListCellTwo alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
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
    _tel1Btn.tag = 1;
    [_tel1Btn setImage:[UIImage imageNamed:@"contact_phone"] forState:UIControlStateNormal];
    [_tel1Btn addTarget:self action:@selector(tel:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_tel1Btn];
    
    _tel2View = [[UILabel alloc] init];
    _tel2View.textAlignment = NSTextAlignmentRight;
    _tel2View.textColor = fontGrayColor;
    _tel2View.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:_tel2View];
    
    _tel2Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_tel2Btn setImage:[UIImage imageNamed:@"contact_phone"] forState:UIControlStateNormal];
    _tel2Btn.tag = 2;
    [_tel2Btn addTarget:self action:@selector(tel:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_tel2Btn];
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
        make.top.equalTo(contentView).offset(myheight(15));
    }];
    [_tel1View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_tel1Btn.mas_left).offset(-mywidth(22));
        make.centerY.equalTo(_tel1Btn);
    }];
    
    [_tel2Btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(contentView).offset(-mywidth(30));
        make.bottom.equalTo(contentView).offset(-myheight(15));
        make.height.equalTo(_tel1Btn);
    }];
    [_tel2View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_tel1Btn.mas_left).offset(-mywidth(22));
        make.centerY.equalTo(_tel2Btn);
        make.height.equalTo(_tel1View);
    }];

}

- (void)tel:(UIButton *)sender
{
    NSString *tel;
    switch (sender.tag) {
        case 1:
            tel = _tel1View.text;
            break;
        default:
            tel = _tel2View.text;
            break;
    }
    NSMutableString* str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",tel];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}
- (void)setContact:(ContactMsg *)contact
{
    _tel1View.text = @" ";
    _tel2View.text = @" ";
    _nameView.text = [contact.addName isKindOfClass:[NSString class]] ? contact.addName : @"";
    _tel1View.text = [contact.unitTel isKindOfClass:[NSString class]] ? contact.unitTel : @" ";
    _tel2View.text = [contact.cellPhone isKindOfClass:[NSString class]] ? contact.cellPhone : @" ";

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

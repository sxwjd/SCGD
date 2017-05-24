//
//  ImportNewsDetailCell.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/26.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "ImportNewsDetailCell.h"
#import "ImportNewsDetailListModel.h"
#import "NSDate+Extension.h"

@interface ImportNewsDetailCell()
/**
 *  contentLabel
 */
@property (nonatomic, strong) UILabel *contentLabel;
@end
@implementation ImportNewsDetailCell
+(ImportNewsDetailCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *cellID = @"ImportNewsDetailCell";
    ImportNewsDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        
        cell = [[ImportNewsDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = mainBackgroundColor;
        [self loadSubViews];
    }
    return  self;
}
- (void)loadSubViews
{
    _contentLabel = [[UILabel alloc] init];
    _contentLabel.textColor = UIColorRGB(0x666666);
    _contentLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:_contentLabel];
    
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(mywidth(112));
        make.right.equalTo(self.contentView).offset(-mywidth(20));
        make.top.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
    }];
}
- (void)setModel:(ImportNewsDetailListModel *)model
{
    _contentLabel.text = [NSString stringWithFormat:@"%@【%@|%@】",model.loginName, model.deptName, [NSDate dateFromInterval:model.createDate]];
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

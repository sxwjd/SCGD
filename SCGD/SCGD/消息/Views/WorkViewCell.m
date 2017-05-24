//
//  WorkViewCell.m
//  ZhaiHang
//
//  Created by 佳冬  on 16/5/30.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "WorkViewCell.h"
@interface WorkViewCell()
/**
 *  背景图片
 */
@property (nonatomic, strong) UIButton *iconView;
/**
 *  标题
 */
@property (nonatomic, strong) UILabel *titleView;
@end
@implementation WorkViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
//        self.layer.borderWidth = 1;
//        self.layer.borderColor = lineColor.CGColor;
        [self loadSubView];
    }
    return self;
}
- (void)loadSubView
{
    _iconView = [UIButton buttonWithType:UIButtonTypeCustom];
    _iconView.userInteractionEnabled = NO;
    [self.contentView addSubview:_iconView];
    
    _titleView = [[UILabel alloc] init];
    _titleView.textAlignment = NSTextAlignmentCenter;
    _titleView.font = [UIFont systemFontOfSize:16];
    _titleView.textColor = UIColorRGB(0x666666);
    [self.contentView addSubview:_titleView];
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.top.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
    }];
    [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-myheight(74));
        make.right.equalTo(self.contentView);
        make.left.equalTo(self.contentView);
    }];
}
- (void)setIconStr:(NSString *)iconStr
{
    _iconStr = iconStr;
    [_iconView setImage:[UIImage imageNamed:_iconStr] forState:UIControlStateNormal];
   
}
- (void)setTitleStr:(NSString *)titleStr
{
    _titleStr = titleStr;
    _titleView.text = _titleStr;
}
@end

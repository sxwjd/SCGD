//
//  YZKLeftViewLabel.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/22.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKLeftViewLabel.h"
#import "NSString+YZKExtention.h"

@interface YZKLeftViewLabel()
/**
 *  leftView
 */
@property (nonatomic, strong) UILabel *leftView;
/**
 *  contentView
 */
@property (nonatomic, strong) UILabel *contentView;
@end
@implementation YZKLeftViewLabel
- (instancetype)init
{
    if (self = [super init]) {
        _ContentnumberOfLines = 1;
        [self setUpSubView];
    }
    return self;
}
- (void)setUpSubView
{
    _leftView = [[UILabel alloc] init];
    [self addSubview:_leftView];
    
    _contentView = [[UILabel alloc] init];
    [self addSubview:_contentView];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = [_leftViewText sizeWithFont:_leftViewFont andMaxSize:CGSizeMake(CGFLOAT_MAX, 15)].width + 2;
    
    if (_ContentnumberOfLines == 0) {
        [_leftView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.left.equalTo(self);
            make.width.mas_equalTo(width);
        }];
        
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.left.equalTo(_leftView.mas_right).offset(mywidth(10));
            make.right.equalTo(self);
            make.bottom.equalTo(self);
        }];
    }else
    {
        [_leftView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.left.equalTo(self);
            make.width.mas_equalTo(width);
            make.bottom.equalTo(self);
        }];
        
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_leftView.mas_right).offset(mywidth(10));
            make.right.equalTo(self);
            make.centerY.equalTo(_leftView);
        }];
    }
}
- (void)setLeftViewColor:(UIColor *)leftViewColor
{
    _leftViewColor = leftViewColor;
    _leftView.textColor = leftViewColor;
}
- (void)setContentViewColor:(UIColor *)contentViewColor
{
    _contentViewColor = contentViewColor;
    _contentView.textColor = contentViewColor;
}
- (void)setLeftViewFont:(UIFont *)leftViewFont
{
    _leftViewFont = leftViewFont;
    _leftView.font = leftViewFont;
}
- (void)setContentViewFont:(UIFont *)contentViewFont
{
    _contentViewFont = contentViewFont;
    _contentView.font = contentViewFont;
}
- (void)setContentnumberOfLines:(CGFloat)ContentnumberOfLines
{
    _ContentnumberOfLines = ContentnumberOfLines;
    _contentView.numberOfLines = ContentnumberOfLines;
}
- (void)setLeftViewText:(NSString *)leftViewText
{
    _leftViewText = leftViewText;
    _leftView.text = leftViewText;
}
- (void)setContentViewText:(NSString *)contentViewText
{
    _contentViewText = contentViewText;
    _contentView.text = contentViewText;
}
@end

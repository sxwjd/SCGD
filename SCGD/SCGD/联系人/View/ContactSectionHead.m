//
//  ContactSectionHead.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/19.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "ContactSectionHead.h"
@interface ContactSectionHead()
/**
 *  组名
 */
@property (nonatomic, strong) UILabel *titleLabel;
@end
@implementation ContactSectionHead
- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = mainBackgroundColor;
        [self loadSubView];
    }
    return self;
}
- (void)loadSubView
{
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = UIColorRGB(0x666666);
    _titleLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_titleLabel];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(mywidth(20));
        make.top.equalTo(self);
        make.bottom.equalTo(self);
        make.right.equalTo(self).offset(-mywidth(20));
    }];
}
- (void)setTitle:(NSString *)title
{
    _title = title;
    _titleLabel.text = _title;
}
@end

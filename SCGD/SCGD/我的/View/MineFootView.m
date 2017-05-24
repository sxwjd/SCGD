//
//  MineFootView.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/19.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "MineFootView.h"
@interface MineFootView()
/**
 *  signOut
 */
@property (nonatomic, strong) UIButton *signOutBtn;
@end
@implementation MineFootView
- (instancetype)init
{
    if (self = [super init]) {
        [self loadSubView];
    }
    return self;
}
- (void)loadSubView
{
    _signOutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _signOutBtn.backgroundColor = mainColor;
    [_signOutBtn setTitle:@"退出系统" forState:UIControlStateNormal];
    _signOutBtn.layer.cornerRadius = 5.0;
    [_signOutBtn addTarget:self action:@selector(signOut) forControlEvents:UIControlEventTouchUpInside];
    _signOutBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [self addSubview:_signOutBtn];
    
    [_signOutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(mywidth(20));
        make.right.equalTo(self).offset(-mywidth(20));
        make.top.equalTo(self).offset(myheight(80));
        make.height.equalTo(@(myheight(76)));
    }];
}
- (void)signOut
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(signOutInMineFootView:)]) {
        [self.delegate signOutInMineFootView:self];
    }
}
@end

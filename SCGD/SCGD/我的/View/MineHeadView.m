//
//  MineHeadView.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/19.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "MineHeadView.h"
#import "UserMessage.h"

@interface MineHeadView()
/**
 *  iconView
 */
@property (nonatomic, strong) UIImageView *iconView;
/**
 *  nameView
 */
@property (nonatomic, strong) UILabel *nameView;
/**
 *  positionView
 */
@property (nonatomic, strong) UILabel *positionView;
/**
 *  line
 */
@property (nonatomic, strong) UIView *line;
@end
@implementation MineHeadView
- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        [self loadSubView];
    }
    return self;
}
- (void)loadSubView
{
    _iconView = [[UIImageView alloc] init];
    _iconView.image = [UIImage imageNamed:@"profile_icon"];
    [self addSubview:_iconView];
    
    _nameView = [[UILabel alloc] init];
    _nameView.textColor = fontBlackColor;
    _nameView.font = [UIFont systemFontOfSize:17];
    [self addSubview:_nameView];
    _nameView.text = @" ";
    
    _positionView = [[UILabel alloc] init];
    _positionView.textColor = fontGrayColor;
    _positionView.font = [UIFont systemFontOfSize:16];
    [self addSubview:_positionView];
    _positionView.text = @" ";
    
    _line = [[UIView alloc] init];
    _line.backgroundColor = lineColor;
    [self addSubview:_line];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(mywidth(20));
        make.top.equalTo(self).offset(myheight(40));
        make.bottom.equalTo(self).offset(-myheight(40));
    }];
    
    [_nameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconView.mas_right).offset(mywidth(32));
        make.top.equalTo(self).offset(myheight(50));
    }];
    
    [_positionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameView);
        make.bottom.equalTo(self).offset(-myheight(50));

    }];
    
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.bottom.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(@1);
    }];
}
- (void)setUserMsg:(UserMessage *)userMsg
{
    _userMsg = userMsg;
    _nameView.text = [_userMsg.userName isKindOfClass:[NSString class]] ? userMsg.userName : @" ";
    _positionView.text = [_userMsg.levelName isKindOfClass:[NSString class]] ? _userMsg.levelName : @" ";
}
@end

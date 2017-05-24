//
//  ImportNewsDetailHeadView.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/25.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "ImportNewsDetailHeadView.h"
#import "YZKLeftViewLabel.h"
#import "ImportNewsDetailModel.h"

@interface ImportNewsDetailHeadView()
/**
 *  编号
 */
@property (nonatomic, strong) YZKLeftViewLabel *numberView;
/**
 *  标题
 */
@property (nonatomic, strong) YZKLeftViewLabel *titleView;
/**
 *  拟稿
 */
@property (nonatomic, strong) YZKLeftViewLabel *draftView;
/**
 *  签发
 */
@property (nonatomic, strong) YZKLeftViewLabel *issuedView;
/**
 *  拟稿部门
 */
@property (nonatomic, strong) YZKLeftViewLabel *departmentView;
/**
 *  发布时间
 */
@property (nonatomic, strong) YZKLeftViewLabel *dateView;
/**
 *  意见
 */
@property (nonatomic, strong) YZKLeftViewLabel *opinionView;
/**
 *  分割线
 */
@property (nonatomic, strong) UIView *bottomLine;

/**
 *  分割线
 */
@property (nonatomic, strong) UIView *topLine;
@end
@implementation ImportNewsDetailHeadView
- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}
- (void)initView
{
    _numberView = [[YZKLeftViewLabel alloc] init];
    _numberView.leftViewText = @"编号:";
    _numberView.leftViewFont = [UIFont systemFontOfSize:15];
    _numberView.leftViewColor = UIColorRGB(0xb8b8b8);
    _numberView.contentViewFont = [UIFont systemFontOfSize:12];
    _numberView.contentViewColor = fontBlackColor;
    [self addSubview:_numberView];
//    _numberView.contentViewText = @" ";
    
    _titleView = [[YZKLeftViewLabel alloc] init];
    _titleView.leftViewText = @"标题:";
    _titleView.leftViewFont = [UIFont systemFontOfSize:15];
    _titleView.leftViewColor = UIColorRGB(0xb8b8b8);
    _titleView.contentViewFont = [UIFont systemFontOfSize:15];
    _titleView.contentViewColor = fontBlackColor;
    _titleView.ContentnumberOfLines = 0;
    [self addSubview:_titleView];
//    _titleView.contentViewText = @"【“两学一做”学习教育信息宣传通知】";
    
    _draftView = [[YZKLeftViewLabel alloc] init];
    _draftView.leftViewText = @"拟稿:";
    _draftView.leftViewFont = [UIFont systemFontOfSize:15];
    _draftView.leftViewColor = UIColorRGB(0xb8b8b8);
    _draftView.contentViewFont = [UIFont systemFontOfSize:15];
    _draftView.contentViewColor = fontBlackColor;
    [self addSubview:_draftView];
//    _draftView.contentViewText = @"阳向辉";
    
    _issuedView = [[YZKLeftViewLabel alloc] init];
    _issuedView.leftViewText = @"签发:";
    _issuedView.leftViewFont = [UIFont systemFontOfSize:15];
    _issuedView.leftViewColor = UIColorRGB(0xb8b8b8);
    _issuedView.contentViewFont = [UIFont systemFontOfSize:15];
    _issuedView.contentViewColor = fontBlackColor;
    [self addSubview:_issuedView];
//    _issuedView.contentViewText = @"杨静";
    
    _departmentView = [[YZKLeftViewLabel alloc] init];
    _departmentView.leftViewText = @"拟稿部门:";
    _departmentView.leftViewFont = [UIFont systemFontOfSize:15];
    _departmentView.leftViewColor = UIColorRGB(0xb8b8b8);
    _departmentView.contentViewFont = [UIFont systemFontOfSize:15];
    _departmentView.contentViewColor = fontBlackColor;
    [self addSubview:_departmentView];
//    _departmentView.contentViewText = @"机关党委办公室";
    
    _dateView = [[YZKLeftViewLabel alloc] init];
    _dateView.leftViewText = @"拟稿部门:";
    _dateView.leftViewFont = [UIFont systemFontOfSize:15];
    _dateView.leftViewColor = UIColorRGB(0xb8b8b8);
    _dateView.contentViewFont = [UIFont systemFontOfSize:15];
    _dateView.contentViewColor = fontBlackColor;
    [self addSubview:_dateView];
   
    
    _opinionView = [[YZKLeftViewLabel alloc] init];
    _opinionView.leftViewText = @"意见:";
    _opinionView.leftViewFont = [UIFont systemFontOfSize:15];
    _opinionView.leftViewColor = UIColorRGB(0xb8b8b8);
    _opinionView.contentViewFont = [UIFont systemFontOfSize:15];
    _opinionView.contentViewColor = fontBlackColor;
    _opinionView.ContentnumberOfLines = 0;
    [self addSubview:_opinionView];
   
    
    _bottomLine = [[UIView alloc] init];
    _bottomLine.backgroundColor = lineColor;
    [self addSubview:_bottomLine];
    
    _topLine = [[UIView alloc] init];
    _topLine.backgroundColor = lineColor;
    [self addSubview:_topLine];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat leadding = myheight(20);
    CGFloat padding = mywidth(20);
    [_numberView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(leadding);
        make.left.equalTo(self).offset(padding);
        make.right.equalTo(self).offset(-padding);
    }];
    
    [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_numberView.mas_bottom).offset(leadding);
        make.left.equalTo(self).offset(padding);
        make.right.equalTo(self).offset(-padding);
    }];
    
    [_draftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleView.mas_bottom).offset(leadding);
        make.left.equalTo(self).offset(padding);
        make.right.equalTo(self).offset(-padding);
    }];
    
    [_issuedView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_draftView.mas_bottom).offset(leadding);
        make.left.equalTo(self).offset(padding);
        make.right.equalTo(self).offset(-padding);
    }];
    
    [_departmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_issuedView.mas_bottom).offset(leadding);
        make.left.equalTo(self).offset(padding);
        make.right.equalTo(self).offset(-padding);
    }];
    
    [_dateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_departmentView.mas_bottom).offset(leadding);
        make.left.equalTo(self).offset(padding);
        make.right.equalTo(self).offset(-padding);
    }];
    
    [_opinionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_dateView.mas_bottom).offset(leadding);
        make.left.equalTo(self).offset(padding);
        make.right.equalTo(self).offset(-padding);
    }];
    
    
    [_bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_opinionView.mas_bottom).offset(leadding);
        make.height.equalTo(@0.5);
        make.left.equalTo(self).offset(0);
        make.right.equalTo(self).offset(0);
        make.bottom.equalTo(self).offset(0);
    }];
    
    [_topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(0);
        make.height.equalTo(@0.5);
        make.left.equalTo(self).offset(0);
        make.right.equalTo(self).offset(0);
    }];
}
- (void)setDetail:(ImportNewsDetailModel *)detail
{
    _numberView.contentViewText = @" ";
    _titleView.contentViewText = [detail.title length] ? detail.title :@" ";
    _draftView.contentViewText = [detail.draftsName length] ? detail.draftsName : @" ";
    _departmentView.contentViewText = [detail.draftsDeptName length] ? detail.draftsDeptName : @" ";
    _issuedView.contentViewText = [detail.currentOptName length] ? detail.currentOptName : @" ";
    _dateView.contentViewText = [detail.textTime length]? detail.textTime: @" ";
    _opinionView.contentViewText = [detail.opinion length] ?detail.opinion :@" ";
    
}
@end

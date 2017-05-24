//
//  YZKSearchBarButtonView.m
//  SCGD
//
//  Created by Lizeyu on 16/10/17.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKSearchBarButtonView.h"

@interface YZKSearchBarButtonView() <UISearchBarDelegate>
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UIButton *searchBtn;
@property (nonatomic, copy) NSString *searchTitle;

@end

@implementation YZKSearchBarButtonView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI{
    self.backgroundColor = UIColorRGB(0xe1e1e1);
    
    _searchBar = [[UISearchBar alloc] init];
    _searchBar.placeholder = @"请输入关键字";
    for (UIView *view in self.searchBar.subviews) {
        [[view.subviews objectAtIndex:0] removeFromSuperview];
        break;
    }
    _searchBar.delegate = self;
    [self addSubview:_searchBar];
        _searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
        [_searchBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [_searchBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_searchBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [_searchBtn setBackgroundImage:[UIImage imageNamed:@"application_btn"] forState:UIControlStateNormal];
        [_searchBtn addTarget:self action:@selector(searchBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_searchBtn];
}

- (void)searchBtnDidClick:(UIButton *)button{
    [self.searchBar endEditing:YES];
    [self.searchBar resignFirstResponder];
    if ([_delegate respondsToSelector:@selector(searchBarView:withSearchTitle:searchBtnDidClick:)]) {
        [_delegate searchBarView:self withSearchTitle:self.searchTitle searchBtnDidClick:button];
    }
    
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    self.searchTitle = searchBar.text;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    if (_searchBar) {
        [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(mywidth(36));
            make.centerY.equalTo(self.mas_centerY);
            make.width.mas_equalTo(mywidth(512));
            make.height.mas_equalTo(myheight(64));
            
        }];
    }
    if (_searchBtn) {
        [_searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-mywidth(40));
            make.centerY.equalTo(self.mas_centerY);
        }];
    }
}
- (void)searchBarBecomFirstResponder
{
    [_searchBar becomeFirstResponder];
}
@end

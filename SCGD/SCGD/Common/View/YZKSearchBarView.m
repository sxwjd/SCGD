//
//  YZKSearchBarView.m
//  SCGD
//
//  Created by Lizeyu on 16/10/17.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKSearchBarView.h"

@interface YZKSearchBarView() <UISearchBarDelegate>
@property (nonatomic, strong) UISearchBar *searchBar;
@end

@implementation YZKSearchBarView

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
    

}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    if ([_delegate respondsToSelector:@selector(searchBarView:searchBarDidClick:)]) {
        [_delegate searchBarView:self searchBarDidClick:searchBar];
    }
    return NO;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    if (_searchBar) {
        [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(18);
            make.centerY.equalTo(self.mas_centerY);
            make.right.equalTo(self.mas_right).offset(-18);
            
        }];
    }
}


@end

//
//  YZKSearchBarButtonView.h
//  SCGD
//
//  Created by Lizeyu on 16/10/20.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YZKSearchBarButtonView;
@protocol YZKSearchBarButtonViewDelegate <NSObject>
@optional
//- (void)searchBarView:(YZKSearchBarButtonView *)searchView searchBarDidClick:(UISearchBar *)searchBar;
- (void)searchBarView:(YZKSearchBarButtonView *)searchView withSearchTitle:(NSString *)title searchBtnDidClick:(UIButton *)searchBtn;
@end

@interface YZKSearchBarButtonView : UIView
@property (nonatomic, weak) id<YZKSearchBarButtonViewDelegate> delegate;
@end

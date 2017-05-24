//
//  YZKSearchBarView.h
//  SCGD
//
//  Created by Lizeyu on 16/10/17.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YZKSearchBarView;
@protocol YZKSearchBarViewDelegate <NSObject>
- (void)searchBarView:(YZKSearchBarView *)searchView searchBarDidClick:(UISearchBar *)searchBar;
@end

@interface YZKSearchBarView : UIView
@property (nonatomic, weak) id<YZKSearchBarViewDelegate> delegate;
@end

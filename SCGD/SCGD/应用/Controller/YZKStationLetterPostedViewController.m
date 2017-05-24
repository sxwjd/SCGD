//
//  YZKStationLetterViewController.m
//  SCGD
//
//  Created by Lizeyu on 16/10/17.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKStationLetterPostedViewController.h"
#import "YZKSearchBarView.h"
#import "YZKPopOverViewController.h"
#import "YZKPopOverModel.h"
#import "YZKStationLetterDataController.h"
#import "YZKSearchViewController.h"
#import "YZKCommonCell.h"
#import "YZKStationLetterPostedModel.h"
#import "YZKStationLetterDetailViewController.h"
#import "YZKStationLetterPostedModel.h"

@interface YZKStationLetterPostedViewController() <YZKSearchBarViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *dataList;
@property (nonatomic, strong) YZKSearchBarView *searchView;
@property (nonatomic, strong) YZKPopOverModel *model;
@property (nonatomic, strong) YZKStationLetterDataController *dataController;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) NSUInteger page;
@end

@implementation YZKStationLetterPostedViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self setupUI];
    [self loadFreshLetter];
}

#pragma mark - YZKSearchBarView Delegate


- (void)searchBarView:(YZKSearchBarView *)searchView searchBarDidClick:(UISearchBar *)searchBar{
    YZKSearchViewController *searchVc = [[YZKSearchViewController alloc] init];
    searchVc.searchType = postStationLetter;
    [self.navigationController pushViewController:searchVc animated:YES];
}

#pragma mark - UITableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YZKCommonCell *cell = (YZKCommonCell *)[YZKStyleManager initCellWithCellType:YZKCellCommon forTableView:tableView];
    cell.letterPostedModel = self.dataList[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return myheight(126);
}


#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    YZKStationLetterPostedModel *postedModel = self.dataList[indexPath.row];
    YZKStationLetterDetailViewController *detailVc = [[YZKStationLetterDetailViewController alloc] init];
    detailVc.postedModel = postedModel;
    [self.navigationController pushViewController:detailVc animated:YES];
}

#pragma mark - private method

- (void)setupUI{
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"已发";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(rightItemDidClick) image:@"navigationBar_more" highImage:nil title: nil];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"navigationbar_left-arrow" highImage:@"navigationbar_left-arrow"];
    [self.view addSubview:self.searchView];
    [self.view addSubview:self.tableView];
}

- (void)loadFreshLetter{
    _page = 1;
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
    params[LOGINID] = [[NSUserDefaults standardUserDefaults] objectForKey:LOGINID];
    [self.dataController requestDataForLetterType:Posted params:params success:^{
        
        self.dataList = [NSMutableArray arrayWithArray:self.dataController.dataList];
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self.tableView.mj_header endRefreshing];
    }];
}

- (void)loadMoreLetter{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
    params[LOGINID] = [[NSUserDefaults standardUserDefaults] objectForKey:LOGINID];
    params[@"currentPage"] = @(_page + 1);
    [self.dataController requestDataForLetterType:Posted params:params success:^{
        if (self.dataController.dataList.count > 0) {
            _page = _page + 1;
            NSArray *moreData = self.dataController.dataList;
            [self.dataList addObjectsFromArray:moreData];
            [self.tableView reloadData];
            [self.tableView.mj_footer endRefreshing];
        }else if (self.dataController.dataList.count == 0){
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self.tableView.mj_footer endRefreshing];
    }];
    if (self.dataList.count == 0) {
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
    }
}

#pragma mark - event response

- (void)rightItemDidClick{
    YZKPopOverViewController *popVc = [[YZKPopOverViewController alloc] init];
    popVc.dataList = @[@{@"iconName": @"navigationbar_pop_plane", @"text":@"写信"}, @{@"iconName": @"navigationbar_pop_my", @"text":@"已发"}, @{@"iconName": @"navigationbar_pop_note", @"text":@"草稿"}];
    popVc.modalPresentationStyle = UIModalPresentationCustom;
    popVc.transitioningDelegate = self.model;
    popVc.frame = self.model.frame;
    [self presentViewController:popVc animated:YES completion:nil];
}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - getter and setter

- (YZKSearchBarView *)searchView{
    if (_searchView == nil) {
        _searchView = [[YZKSearchBarView alloc] init];
        _searchView.frame = CGRectMake(0, 0, SCREEN_WIDTH, myheight(88));
        _searchView.delegate = self;
    }
    return _searchView;
}

- (YZKPopOverModel *)model{
    if (_model == nil) {
        _model = [[YZKPopOverModel alloc] init];
        _model.frame = CGRectMake(SCREEN_WIDTH - mywidth(154) - mywidth(40), myheight(54), mywidth(156), myheight(190));
    }
    return _model;
}

- (YZKStationLetterDataController *)dataController{
    if (_dataController == nil) {
        _dataController = [[YZKStationLetterDataController alloc] init];
    }
    return _dataController;
}

//- (NSMutableArray *)dataList{
//    if (_dataList == nil) {
//        _dataList = [NSMutableArray arrayWithCapacity:0];
//    }
//    return _dataList;
//}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, myheight(88), self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor whiteColor];
        _tableView.tableFooterView = view;
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadFreshLetter)];
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreLetter)];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    }
    return _tableView;
}

@end

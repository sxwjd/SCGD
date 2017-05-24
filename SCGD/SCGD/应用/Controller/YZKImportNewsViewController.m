//
//  YZKImportNewsViewController.m
//  SCGD
//
//  Created by Lizeyu on 16/10/17.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKImportNewsViewController.h"
#import "YZKSearchBarView.h"
#import "YZKPopOverViewController.h"
#import "YZKPopOverModel.h"
#import "YZKCommonDataController.h"
#import "YZKSearchViewController.h"
#import "YZKImportNewsDetailViewController.h"
#import "YZKAnnounceModel.h"


@interface YZKImportNewsViewController() <YZKSearchBarViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *dataList;
@property (nonatomic, strong) YZKSearchBarView *searchView;
@property (nonatomic, strong) YZKPopOverModel *model;
@property (nonatomic, strong) YZKCommonDataController *dataController;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) NSUInteger page;
@end

@implementation YZKImportNewsViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    _page = 1;
    [self setupUI];
    [self loadFreshNews];
}

#pragma mark - YZKSearchBarView Delegate


- (void)searchBarView:(YZKSearchBarView *)searchView searchBarDidClick:(UISearchBar *)searchBar{
    YZKSearchViewController *searchVc = [[YZKSearchViewController alloc] init];
    searchVc.searchType = importNews;
    [self.navigationController pushViewController:searchVc animated:YES];
}

#pragma mark - UITableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YZKCommonCell *cell = (YZKCommonCell *)[YZKStyleManager initCellWithCellType:YZKCellCommon forTableView:tableView];
    cell.model = self.dataList[indexPath.row];
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
    YZKAnnounceModel *model = self.dataList[indexPath.row];
    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithCapacity:0];
    param[@"loginId"] = [[NSUserDefaults standardUserDefaults] objectForKey:LOGINID];
    param[@"id"] = model.id;
    YZKImportNewsDetailViewController *detail = [[YZKImportNewsDetailViewController alloc]init];
    detail.url = IMPORTNEWSDETAIL;
    detail.param = param;
    [self.navigationController pushViewController:detail animated:YES];
}

#pragma mark - private method

- (void)setupUI{
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"要情";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(rightItemDidClick) image:@"navigationBar_more" highImage:nil title: nil];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"navigationbar_left-arrow" highImage:@"navigationbar_left-arrow"];
    [self.view addSubview:self.searchView];
    [self.view addSubview:self.tableView];
}

- (void)loadFreshNews{
    
    [self.dataController requestDataWithType:importNewType params:nil success:^{
        self.dataList = [NSMutableArray arrayWithArray:self.dataController.dataList];
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
        [self.tableView.mj_header endRefreshing];
    }];
}


- (void)loadMoreNews{
    NSDictionary *params = @{@"currentPage":@(_page  + 1)};
    [self.dataController requestDataWithType:importNewType params:params success:^{
        NSArray *newArray = self.dataController.dataList;
        if (self.dataController.dataList.count == 0) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        
        }else if (self.dataController.dataList.count > 0)
        {
            _page = _page + 1;
            [self.dataList addObjectsFromArray:newArray];
            [self.tableView reloadData];
            [self.tableView.mj_footer endRefreshing];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
        [self.tableView.mj_footer endRefreshing];
    }];
    

}

#pragma mark - event response

- (void)rightItemDidClick{
    YZKPopOverViewController *popVc = [[YZKPopOverViewController alloc] init];
    popVc.dataList = @[@{@"iconName": @"navigationbar_pop_plane", @"text":@"发布公告"}, @{@"iconName": @"navigationbar_pop_note", @"text":@"我的草稿"}, @{@"iconName": @"navigationbar_pop_my", @"text":@"我的申请"}, @{@"iconName": @"navigationbar_pop_clock", @"text":@"待审核"}, @{@"iconName": @"navigationbar_pop_icon", @"text":@"经我审核"}];
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
        _model.frame = CGRectMake(SCREEN_WIDTH - mywidth(216) - mywidth(30), myheight(54), mywidth(216), myheight(320));
    }
    return _model;
}

- (YZKCommonDataController *)dataController{
    if (_dataController == nil) {
        _dataController = [[YZKCommonDataController alloc] init];
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
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, myheight(88), self.view.bounds.size.width, self.view.bounds.size.height - myheight(88)) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor whiteColor];
        _tableView.tableFooterView = view;
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadFreshNews)];
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreNews)];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;
    }
    return _tableView;
}



@end

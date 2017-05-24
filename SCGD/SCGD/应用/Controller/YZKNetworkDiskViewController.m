//
//  YZKNetworkDiskViewController.m
//  SCGD
//
//  Created by Lizeyu on 16/10/17.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKNetworkDiskViewController.h"
#import "YZKSearchBarView.h"
#import "YZKPopOverViewController.h"
#import "YZKPopOverModel.h"
#import "YZKSearchViewController.h"
#import "YZKReserveCell.h"
#import "YZKNetworkDiskDataController.h"
#import "HeadSelectedView.h"
#import "YZKNetDiskDetailViewController.h"

@interface YZKNetworkDiskViewController() <YZKSearchBarViewDelegate, UITableViewDelegate, UITableViewDataSource, HeadSelectedViewDelegate>
@property (nonatomic, strong) NSMutableArray *dataList;
@property (nonatomic, strong) YZKSearchBarView *searchView;
@property (nonatomic, strong) YZKPopOverModel *model;
@property (nonatomic, strong) YZKNetworkDiskDataController *dataController;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) HeadSelectedView *headerView;
@property (nonatomic, assign) NSUInteger page;
@property (nonatomic, assign) NSUInteger chooseBtn;
@end

@implementation YZKNetworkDiskViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self setupUI];
    [self loadFreshProfile];
}

#pragma mark - YZKSearchBarView Delegate


- (void)searchBarView:(YZKSearchBarView *)searchView searchBarDidClick:(UISearchBar *)searchBar{
    YZKSearchViewController *searchVc = [[YZKSearchViewController alloc] init];
    searchVc.searchType = networkDisk;
    if (_chooseBtn == 0) {
        searchVc.fileType = shareFileType;
    }else if (_chooseBtn == 1){
        searchVc.fileType = mineFileType;
    }
    [self.navigationController pushViewController:searchVc animated:YES];
}

#pragma mark - UITableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YZKReserveCell *cell = (YZKReserveCell *)[YZKStyleManager initCellWithCellType:YZKCellReserve forTableView:tableView];
    cell.networkDiskModel = self.dataList[indexPath.row];
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
    return myheight(170);
}


#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    YZKNetDiskDetailViewController *detailVc = [[YZKNetDiskDetailViewController alloc] init];
    detailVc.model = self.dataList[indexPath.row];
    [self.navigationController pushViewController:detailVc animated:YES];
}

#pragma mark - HeadSelectedViewDelegate

- (void)headSelectedView:(HeadSelectedView *)headSelectedView SelectedWithTag:(NSInteger)tag{
    switch (tag) {
        case 0:
        {
            _page = 1;
            _chooseBtn = 0;
            NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
            params[LOGINID] = [[NSUserDefaults standardUserDefaults] objectForKey:LOGINID];
            [self.dataController requestDataForFileType:shareFileType params:params success:^{
                self.dataList = [NSMutableArray arrayWithArray:self.dataController.dataList];
                [self.tableView reloadData];
                [self.tableView.mj_header endRefreshing];
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                [self.tableView.mj_header endRefreshing];
            }];
            self.tableView.mj_footer.state = MJRefreshStateIdle;
        }
            break;
        case 1:
        {
            _page = 1;
            _chooseBtn = 1;
            NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
            params[LOGINID] = [[NSUserDefaults standardUserDefaults] objectForKey:LOGINID];
            [self.dataController requestDataForFileType:mineFileType params:params success:^{
                self.dataList = [NSMutableArray arrayWithArray:self.dataController.dataList];
                [self.tableView reloadData];
                [self.tableView.mj_header endRefreshing];
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                [self.tableView.mj_header endRefreshing];
            }];
            self.tableView.mj_footer.state = MJRefreshStateIdle;
        }
            break;
    }
}

#pragma mark - private method

- (void)setupUI{
    _chooseBtn = 0;
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"网络硬盘";
    //    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(rightItemDidClick) image:@"navigationBar_more" highImage:nil title: nil];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"navigationbar_left-arrow" highImage:@"navigationbar_left-arrow"];
    [self.view addSubview:self.searchView];
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.tableView];
}

- (void)loadFreshProfile{
    _page = 1;
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
    params[LOGINID] = [[NSUserDefaults standardUserDefaults] objectForKey:LOGINID];
    switch (_chooseBtn) {
        case 0:
        {
            [self.dataController requestDataForFileType:shareFileType params:params success:^{
                self.dataList = [NSMutableArray arrayWithArray:self.dataController.dataList];
                [self.tableView reloadData];
                [self.tableView.mj_header endRefreshing];
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                [self.tableView.mj_header endRefreshing];
            }];
        }
            break;
        case 1:
        {
            [self.dataController requestDataForFileType:mineFileType params:params success:^{
                self.dataList = [NSMutableArray arrayWithArray:self.dataController.dataList];
                [self.tableView reloadData];
                [self.tableView.mj_header endRefreshing];
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                [self.tableView.mj_header endRefreshing];
            }];
        }
            break;
    }
}

- (void)loadMoreProfile{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
    params[LOGINID] = [[NSUserDefaults standardUserDefaults] objectForKey:LOGINID];
    params[@"currentPage"] = @(_page + 1);
    switch (_chooseBtn) {
        case 0:
        {
            [self.dataController requestDataForFileType:shareFileType params:params success:^{
                if (self.dataController.dataList.count > 0) {
                    _page = _page + 1;
                    NSArray *moreData = self.dataController.dataList;
                    [self.dataList addObjectsFromArray:moreData];
                    [self.tableView reloadData];
                    [self.tableView.mj_footer endRefreshing];
                }else if (self.dataController.dataList.count == 0){
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }
                NSLog(@"share file type");
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                [self.tableView.mj_header endRefreshing];
            }];
            if (self.dataList.count == 0) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
        }
            break;
        case 1:
        {
            [self.dataController requestDataForFileType:mineFileType params:params success:^{
                if (self.dataController.dataList.count > 0) {
                    _page = _page + 1;
                    NSArray *moreData = self.dataController.dataList;
                    [self.dataList addObjectsFromArray:moreData];
                    [self.tableView reloadData];
                    [self.tableView.mj_footer endRefreshing];
                }else if (self.dataController.dataList.count == 0){
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }
                NSLog(@"mine file type");
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                [self.tableView.mj_header endRefreshing];
            }];
            if (self.dataList.count == 0) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
        }
            break;
    }
}

#pragma mark - event response

//- (void)rightItemDidClick{
//    YZKPopOverViewController *popVc = [[YZKPopOverViewController alloc] init];
//    popVc.dataList = @[@{@"iconName": @"navigationbar_pop_plane", @"text":@"写信"}, @{@"iconName": @"navigationbar_pop_my", @"text":@"已发"}, @{@"iconName": @"navigationbar_pop_note", @"text":@"草稿"}];
//    popVc.modalPresentationStyle = UIModalPresentationCustom;
//    popVc.transitioningDelegate = self.model;
//    popVc.frame = self.model.frame;
//    [self presentViewController:popVc animated:YES completion:nil];
//}

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

//- (YZKPopOverModel *)model{
//    if (_model == nil) {
//        _model = [[YZKPopOverModel alloc] init];
//        _model.frame = CGRectMake(SCREEN_WIDTH - mywidth(154) - mywidth(40), myheight(54), mywidth(156), myheight(190));
//    }
//    return _model;
//}

- (YZKNetworkDiskDataController *)dataController{
    if (_dataController == nil) {
        _dataController = [[YZKNetworkDiskDataController alloc] init];
    }
    return _dataController;
}

- (NSMutableArray *)dataList{
    if (_dataList == nil) {
        _dataList = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataList;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, myheight(86) + myheight(88), self.view.bounds.size.width, self.view.bounds.size.height - myheight(88)) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        UIView *view = [UIView new];
        view.backgroundColor = UIColorRGB(0xf8f8f8);
        _tableView.tableFooterView = view;
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadFreshProfile)];
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreProfile)];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;
        _tableView.mj_footer.backgroundColor = UIColorRGB(0xf8f8f8);
        _tableView.backgroundColor = UIColorRGB(0xf8f8f8);
    }
    return _tableView;
}

- (HeadSelectedView *)headerView{
    if (_headerView == nil) {
        _headerView = [[HeadSelectedView alloc] init];
        _headerView.frame = CGRectMake(0, myheight(88), SCREEN_WIDTH, myheight(86));
        _headerView.leftTitle = @"共享文件";
        _headerView.rightTitle = @"我的文件";
        _headerView.delegate = self;
    }
    return _headerView;
}
@end

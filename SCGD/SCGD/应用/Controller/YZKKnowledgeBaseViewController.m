//
//  YZKKnowledgeBaseViewController.m
//  SCGD
//
//  Created by Lizeyu on 16/10/17.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKKnowledgeBaseViewController.h"
#import "YZKSearchBarView.h"
#import "YZKPopOverViewController.h"
#import "YZKPopOverModel.h"
#import "YZKSearchViewController.h"
#import "YZKCommonCell.h"
#import "YZKKnowledgeBaseDataController.h"
#import "YZKTableCommonFooterView.h"
#import "YZKContentModel.h"

@interface YZKKnowledgeBaseViewController() <YZKSearchBarViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *dataList;
@property (nonatomic, strong) YZKSearchBarView *searchView;
@property (nonatomic, strong) YZKPopOverModel *model;
@property (nonatomic, strong) YZKKnowledgeBaseDataController *dataController;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) YZKTableCommonFooterView *tableFooterView;
@property (nonatomic, assign) NSUInteger page;
@end

@implementation YZKKnowledgeBaseViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self setupUI];
    [self loadFreshBase];
}

#pragma mark - YZKSearchBarView Delegate


- (void)searchBarView:(YZKSearchBarView *)searchView searchBarDidClick:(UISearchBar *)searchBar{
    YZKSearchViewController *searchVc = [[YZKSearchViewController alloc] init];
    searchVc.searchType = knowledgeBase;
    [self.navigationController pushViewController:searchVc animated:YES];
}

#pragma mark - UITableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [YZKStyleManager initCellWithCellType:YZKCellSubtitle forTableView:tableView];
    YZKContentModel *model = self.dataList[indexPath.row];
    cell.textLabel.text = model.srcFileName;
    cell.detailTextLabel.text = @"系统测试员共享";
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
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    [self.tableFooterView showWithTitle:@"提示: 详情请去PC端浏览"];
    return self.tableFooterView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return myheight(60);
}

#pragma mark - private method

- (void)setupUI{
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"知识库";
//    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(rightItemDidClick) image:@"navigationBar_more" highImage:nil title: nil];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"navigationbar_left-arrow" highImage:@"navigationbar_left-arrow"];
    [self.view addSubview:self.searchView];
    [self.view addSubview:self.tableView];
    
}



- (void)loadFreshBase{
    _page = 1;
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
    params[LOGINID] = [[NSUserDefaults standardUserDefaults] objectForKey:LOGINID];
    [self.dataController requestDataForAllBaseWithParams:params success:^{
        self.dataList = [NSMutableArray arrayWithArray:self.dataController.dataList];
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self.tableView.mj_header endRefreshing];
    }];
}

- (void)loadMoreBase{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
    params[LOGINID] = [[NSUserDefaults standardUserDefaults] objectForKey:LOGINID];
    params[@"currentPage"] = @(_page + 1);
    [self.dataController requestDataForAllBaseWithParams:params success:^{
        if (self.dataController.dataList.count > 0) {
            _page = _page + 1;
            NSArray *moreData = self.dataController.dataList;
            [self.dataList addObjectsFromArray: moreData];
            [self.tableView reloadData];
            [self.tableView.mj_footer endRefreshing];
        }else if (self.dataController.dataList.count == 0){
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self.tableView.mj_footer endRefreshing];
    }];
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

- (YZKKnowledgeBaseDataController *)dataController{
    if (_dataController == nil) {
        _dataController = [[YZKKnowledgeBaseDataController alloc] init];
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
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadFreshBase)];
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreBase)];
        _tableView.mj_footer.backgroundColor = UIColorRGB(0xf8f8f8);
        _tableView.backgroundColor = UIColorRGB(0xf8f8f8);
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    }
    return _tableView;
}

- (YZKTableCommonFooterView *)tableFooterView{
    if (_tableFooterView == nil) {
        _tableFooterView = [[YZKTableCommonFooterView alloc] init];
        _tableFooterView.backgroundColor = UIColorRGB(0xf8f8f8);
    }
    return _tableFooterView;;
}

@end

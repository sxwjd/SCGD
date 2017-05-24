//
//  YZKIndividualScheduleDayViewController.m
//  SCGD
//
//  Created by Lizeyu on 16/10/24.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKIndividualScheduleDayViewController.h"
#import "YZKDateChooseView.h"
#import "YZKScheduleDataController.h"
#import "YZKScheduleDayCell.h"
#import "YZKScheduleModel.h"
#import "YZKScheduleDetailViewController.h"

@interface YZKIndividualScheduleDayViewController ()<UITableViewDelegate, UITableViewDataSource, YZKDateChooseViewDelegate>
{
    NSString *_year;
    NSString *_month;
    NSString *_day;
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) YZKDateChooseView *dateView;
@property (nonatomic, strong) YZKScheduleDataController *dataController;
@property (nonatomic, strong) NSDictionary *dayInfo;
@property (nonatomic, assign) NSUInteger page;
@property (nonatomic, copy) NSString *searchField;
@end

@implementation YZKIndividualScheduleDayViewController

#pragma mark - life cycle

- (void)loadView{
    [super loadView];
    _dayInfo = self.dataList.lastObject;
    [self.dataList removeLastObject];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];

//    [self loadData];
}

#pragma mark - private method

- (void)setupUI{
    self.title = @"个人日程";
    [self.view addSubview:self.tableView];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    cell.detailTextLabel.text = _dayInfo[@"date"];
    
    _year = [[_dayInfo[@"date"] componentsSeparatedByString:@"-"][0] substringWithRange:NSMakeRange(0, 4)];
    _month = [[_dayInfo[@"date"] componentsSeparatedByString:@"-"][1] substringWithRange:NSMakeRange(0, 2)];
    _day = [[_dayInfo[@"date"] componentsSeparatedByString:@"-"][2] substringWithRange:NSMakeRange(0, 2)];
    _searchField = [NSString stringWithFormat:@"%@-%@-%@",_year,_month,_day];
    _page = 1;
}

#pragma mark - UITableView DateSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return self.dataList.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    YZKScheduleDayCell *cell = (YZKScheduleDayCell *)[YZKStyleManager initCellWithCellType:YZKCellScheduleDay forTableView:tableView];
    UITableViewCell *value1Cell = [YZKStyleManager initCellWithCellType:YZKCellValue1 forTableView:tableView];
    if (indexPath.section == 0) {
        value1Cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return value1Cell;
    }
    else{
        cell.model = self.dataList[indexPath.row];
        return cell;
    }
    
}




#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        [self.view addSubview:self.dateView];
        [self.dateView show];
    }else{
        YZKScheduleModel *model = self.dataList[indexPath.row];
        YZKScheduleDetailViewController *detailVc = [[YZKScheduleDetailViewController alloc] init];
        detailVc.model = model;
        [self.navigationController pushViewController:detailVc animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return myheight(20);
    }else{
        return CGFLOAT_MIN;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        return myheight(158);
    }else{
        return myheight(88);
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

#pragma mark - YZKDateChooseView Delegate

- (void)dateChooseView:(YZKDateChooseView *)view withSelectedYearMonth:(NSString *)year month:(NSString *)month day:(NSString *)day{
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@年-%@月-%@日",year,month,day];
    _searchField = [NSString stringWithFormat:@"%@-%@-%@",year,month,day];
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
    params[LOGINID] = [[NSUserDefaults standardUserDefaults] objectForKey:LOGINID];
    params[@"ymday"] = _searchField;
    _page = 1;
    [self.dataController requestDataWithScheduleType:individualType specifyYearMonthDay:_searchField params:params success:^{
        self.dataList = [NSMutableArray arrayWithArray:self.dataController.dataList];
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self.tableView.mj_header endRefreshing];
    }];

}

#pragma mark - private methods

- (void)loadFreshSchedule{
    _page = 1;
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
    params[LOGINID] = [[NSUserDefaults standardUserDefaults] objectForKey:LOGINID];
    params[@"ymday"] = _searchField;
    [self.dataController requestDataWithScheduleType:individualType specifyYearMonthDay:_searchField params:params success:^{
        self.dataList = [NSMutableArray arrayWithArray:self.dataController.dataList];
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self.tableView.mj_header endRefreshing];
    }];

}

- (void)loadMoreSchedule{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
    params[LOGINID] = [[NSUserDefaults standardUserDefaults] objectForKey:LOGINID];
    params[@"ymday"] = _searchField;
    params[@"currentPage"] = @(_page + 1);
    [self.dataController requestDataWithScheduleType:individualType specifyYearMonthDay:_searchField params:params success:^{
        if (self.dataController.dataList.count > 0) {
            _page = _page + 1;
            NSArray *moreData = self.dataController.dataList;
            [self.dataList addObjectsFromArray:moreData];
            [self.tableView reloadData];
            [self.tableView.mj_footer endRefreshing];
        }else if(self.dataController.dataList.count == 0){
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self.tableView.mj_footer endRefreshing];
    }];
    if (self.dataList.count == 0) {
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
    }
}

#pragma mark - getter and setter

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor whiteColor];
        _tableView.tableFooterView = view;
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadFreshSchedule)];
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreSchedule)];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    }
    return _tableView;
}

- (YZKDateChooseView *)dateView{
    if (_dateView == nil) {
        _dateView = [[YZKDateChooseView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _dateView.showDay = YES;
        _dateView.delegate = self;
    }
    return _dateView;
}

- (YZKScheduleDataController *)dataController{
    if (_dataController == nil) {
        _dataController = [[YZKScheduleDataController alloc] init];
    }
    return _dataController;
}

//- (NSMutableArray *)dataList{
//    if (_dataList == nil) {
//        _dataList = [NSMutableArray arrayWithCapacity:0];
//    }
//    return _dataList;
//}

@end

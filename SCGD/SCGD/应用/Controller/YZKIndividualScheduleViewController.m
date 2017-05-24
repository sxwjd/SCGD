//
//  YZKIndividualScheduleViewController.m
//  SCGD
//
//  Created by Lizeyu on 16/10/24.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKIndividualScheduleViewController.h"
#import "YZKDateChooseView.h"
#import "YZKScheduleDataController.h"
#import "YZKScheduleCell.h"
#import "YZKIndividualScheduleDayViewController.h"
#import "YZKScheduleModel.h"

@interface YZKIndividualScheduleViewController ()<UITableViewDelegate, UITableViewDataSource, YZKDateChooseViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) YZKDateChooseView *dateView;
@property (nonatomic, strong) YZKScheduleDataController *dataController;
@property (nonatomic, strong) NSMutableArray *dataList;
@property (nonatomic, assign) NSUInteger page;
@property (nonatomic, copy) NSString *searchField;
@end

@implementation YZKIndividualScheduleViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self loadFreshSchedule];
}

#pragma mark - private method

- (void)setupUI{
    self.title = @"个人日程";
    [self.view addSubview:self.tableView];
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
    YZKScheduleCell *cell = (YZKScheduleCell *)[YZKStyleManager initCellWithCellType:YZKCellSchedule forTableView:tableView];
    UITableViewCell *value1Cell = [YZKStyleManager initCellWithCellType:YZKCellValue1 forTableView:tableView];
    if (indexPath.section == 0) {
        value1Cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return value1Cell;
    }
    else{
        cell.individualModel = self.dataList[indexPath.row];
        [cell backGroundImage];
    }
    return cell;
}




#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        [self.view addSubview:self.dateView];
        [self.dateView show];
    }else{
        YZKScheduleMonthModel *dayModel = self.dataList[indexPath.row];
        YZKIndividualScheduleDayViewController *dayVc = [[YZKIndividualScheduleDayViewController alloc] init];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        YZKScheduleModel *model = dayModel.scheduleModels.firstObject;
        NSString *specifyDay = [NSString stringWithFormat:@"%@-%@日",cell.detailTextLabel.text, [[model.startTime componentsSeparatedByString:@"-"][2] componentsSeparatedByString:@" "][0]];
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
        dict[@"date"] = specifyDay;
        dayVc.dataList = dayModel.scheduleModels;
        [dayVc.dataList addObject:dict];
        [self.navigationController pushViewController:dayVc animated:YES];
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
        return myheight(178);
    }else{
        return myheight(88);
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsMake(0, mywidth(120), 0, 0)];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setSeparatorInset:UIEdgeInsetsMake(0, mywidth(120), 0, 0)];
    }
}

#pragma mark - YZKDateChooseView Delegate

- (void)dateChooseView:(YZKDateChooseView *)view withSelectedYearMonth:(NSString *)year month:(NSString *)month day:(NSString *)day{
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@年-%@月",year,month];
    NSString *searchField;
    if (month.length < 2) {
        searchField = [NSString stringWithFormat:@"%@-0%@",year,month];
    }else{
        searchField = [NSString stringWithFormat:@"%@-%@",year,month];
    }
    _page = 1;
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
    params[LOGINID] = [[NSUserDefaults standardUserDefaults] objectForKey:LOGINID];
    params[@"yMon"] = _searchField;
    [self.dataController requestDataWithScheduleType:individualType specifyYearMonth:_searchField params:params success:^{
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
    [self.dataController requestDataWithScheduleType:individualType params:params success:^{
        self.dataList = [NSMutableArray arrayWithArray:self.dataController.dataList];
        NSDictionary *dict = self.dataList.lastObject;
        NSString *date = dict[@"date"];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@年-%@月",[date componentsSeparatedByString:@"-"][0], [date componentsSeparatedByString:@"-"][1]];
        [self.dataList removeLastObject];
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self.tableView.mj_header endRefreshing];
    }];
}

- (void)loadMoreSchedule{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
    params[LOGINID] = [[NSUserDefaults standardUserDefaults] objectForKey:LOGINID];
    params[@"currentPage"] = @(_page + 1);
    [self.dataController requestDataWithScheduleType:individualType params:params success:^{
        NSMutableArray *moreData = [NSMutableArray arrayWithArray:self.dataController.dataList];
        [moreData removeLastObject];
        if (moreData.count > 0) {
            self.dataList = moreData;
            [self.tableView reloadData];
            [self.tableView.mj_footer endRefreshing];
        }else if(moreData.count == 0){
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
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;
    }
    return _tableView;
}

- (YZKDateChooseView *)dateView{
    if (_dateView == nil) {
        _dateView = [[YZKDateChooseView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _dateView.showDay = NO;
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

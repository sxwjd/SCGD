//
//  YZKMeetReserveViewController.m
//  SCGD
//
//  Created by Lizeyu on 16/10/17.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKMeetReserveViewController.h"
#import "YZKSearchBarView.h"
#import "YZKPopOverViewController.h"
#import "YZKPopOverModel.h"
#import "YZKMeetReserveDataController.h"
#import "YZKSearchViewController.h"
#import "YZKReserveModel.h"
#import "YZKReserveCell.h"
#import "YZKMeetChooseViewController.h"
#import "YZKMeetReserveDetailViewController.h"

@interface YZKMeetReserveViewController() <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *dataList;
@property (nonatomic, strong) YZKPopOverModel *model;
@property (nonatomic, strong) YZKMeetReserveDataController *dataController;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) NSUInteger page;
@property (nonatomic, copy) NSString *roomId;
@end

@implementation YZKMeetReserveViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self setupUI];
    [self loadFreshReserve];
}

#pragma mark - YZKSearchBarView Delegate


#pragma mark - UITableView DataSource

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
    if (indexPath.section == 0) {
        UITableViewCell *cell = [YZKStyleManager initCellWithCellType:YZKCellValue1 forTableView:tableView];
        cell.textLabel.text = @"会议室选择";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }else{
        YZKReserveCell *cell = (YZKReserveCell *)[YZKStyleManager initCellWithCellType:YZKCellReserve forTableView:tableView];
        cell.model = self.dataList[indexPath.row];
        return cell;
    }
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
    if (indexPath.section == 0 && indexPath.row == 0) {
        return myheight(88);
    }else{
        return myheight(190);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return myheight(20);
    }else{
        return 0;
    }
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0 && indexPath.row == 0) {
        YZKMeetChooseViewController *chooseVc = [[YZKMeetChooseViewController alloc] init];
        chooseVc.block = ^(NSMutableArray *dataList, NSString *text, NSString *roomId){
            self.dataList = dataList;
            NSIndexSet *set = [NSIndexSet indexSetWithIndex:1];
            [self.tableView reloadSections:set withRowAnimation:UITableViewRowAnimationBottom];
            UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
            cell.detailTextLabel.text = text;
            self.tableView.mj_footer.state = MJRefreshStateIdle;
            _page = 1;
            _roomId = roomId;
        };
        chooseVc.selectedRow = self.roomId;
        [self.navigationController pushViewController:chooseVc animated:YES];
    }else{
        YZKMeetReserveDetailViewController  *detailVc = [[YZKMeetReserveDetailViewController alloc] init];
        detailVc.model = self.dataList[indexPath.row];
        [self.navigationController pushViewController:detailVc animated:YES];
    }
}

#pragma mark - private method

- (void)setupUI{
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"会议室预约";
//    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(rightItemDidClick) image:@"navigationBar_more" highImage:nil title: nil];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"navigationbar_left-arrow" highImage:@"navigationbar_left-arrow"];
    
    [self.view addSubview:self.tableView];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    cell.detailTextLabel.text = @"全部";
}

- (void)loadFreshReserve{
    _page = 1;
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
    params[LOGINID] = [[NSUserDefaults standardUserDefaults] objectForKey:LOGINID];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    if ([cell.detailTextLabel.text isEqualToString:@"全部"]) {
        [self.dataController requestDataForAllReserverWithParams:params success:^{
            self.dataList = [NSMutableArray arrayWithArray:self.dataController.dataList];
            [self.tableView reloadData];
            [self.tableView.mj_header endRefreshing];
            NSLog(@"全部 刷新 成功");
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [self.tableView.mj_header endRefreshing];
        }];
    }else if ([cell.detailTextLabel.text isEqualToString:@"党委会议室"]){
        [self.dataController requestDatAForSpecifyMeetingRoomId:@"1" success:^{
            self.dataList = [NSMutableArray arrayWithArray:self.dataController.dataList];
            [self.tableView reloadData];
            [self.tableView.mj_header endRefreshing];
            NSLog(@"党委 刷新 成功");
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [self.tableView.mj_header endRefreshing];
        }];
    }else if ([cell.detailTextLabel.text isEqualToString:@"七楼会议室"]){
        [self.dataController requestDatAForSpecifyMeetingRoomId:@"3" success:^{
            self.dataList = [NSMutableArray arrayWithArray:self.dataController.dataList];
            [self.tableView reloadData];
            [self.tableView.mj_header endRefreshing];
            NSLog(@"七楼 刷新 成功");
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [self.tableView.mj_header endRefreshing];
        }];
    }else if ([cell.detailTextLabel.text isEqualToString:@"四楼会议室"]){
        [self.dataController requestDatAForSpecifyMeetingRoomId:@"4" success:^{
            self.dataList = [NSMutableArray arrayWithArray:self.dataController.dataList];
            [self.tableView reloadData];
            [self.tableView.mj_header endRefreshing];
            NSLog(@"四楼 刷新 成功");
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [self.tableView.mj_header endRefreshing];
        }];
    }
}

- (void)loadMoreReserve{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
    params[@"currentPage"] = @(_page + 1);
    params[LOGINID] = [[NSUserDefaults standardUserDefaults] objectForKey:LOGINID];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    NSLog(@"%@",cell.detailTextLabel.text);
    if ([cell.detailTextLabel.text isEqualToString:@"全部"]) {
        [self.dataController requestDataForAllReserverWithParams:params success:^{
            if(self.dataController.dataList.count > 0){
                _page = _page + 1;
                NSArray *moreData = self.dataController.dataList;
                [self.dataList addObjectsFromArray:moreData];
                [self.tableView reloadData];
                [self.tableView.mj_footer endRefreshing];
                
            }else if (self.dataController.dataList.count == 0){
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
                
            }
            NSLog(@"全部 刷新 成功");
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [self.tableView.mj_footer endRefreshing];
        }];
    }else if ([cell.detailTextLabel.text isEqualToString:@"党委会议室"]){
        params[@"roomId"] = [NSNumber numberWithUnsignedInteger:1];
        [self.dataController requestDataForAllReserverWithParams:params success:^{
            if (self.dataController.dataList.count > 0) {
                _page = _page + 1;
                NSArray *moreData = self.dataController.dataList;
                [self.dataList addObjectsFromArray:moreData];
                [self.tableView reloadData];
                [self.tableView.mj_footer endRefreshing];
            }else if(self.dataController.dataList.count == 0){
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
                
            }
            NSLog(@"党委 finish");
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
            self.tableView.mj_footer.hidden = YES;
        }];
    }else if ([cell.detailTextLabel.text isEqualToString:@"七楼会议室"]){
        params[@"roomId"] = [NSNumber numberWithUnsignedInteger:3];
        [self.dataController requestDataForAllReserverWithParams:params success:^{
            if (self.dataController.dataList.count > 0) {
                _page = _page + 1;
                NSArray *moreData = self.dataController.dataList;
                [self.dataList addObjectsFromArray:moreData];
                [self.tableView reloadData];
                [self.tableView.mj_footer endRefreshing];
            }else if(self.dataController.dataList.count == 0){
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            NSLog(@"seven finish");
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [self.tableView.mj_footer endRefreshing];
            
        }];
    }else if ([cell.detailTextLabel.text isEqualToString:@"四楼会议室"]){
        params[@"roomId"] = [NSNumber numberWithUnsignedInteger:4];
        [self.dataController requestDataForAllReserverWithParams:params success:^{
            if (self.dataController.dataList.count > 0) {
                _page = _page + 1;
                NSArray *moreData = self.dataController.dataList;
                [self.dataList addObjectsFromArray:moreData];
                [self.tableView reloadData];
                [self.tableView.mj_footer endRefreshing];
            }else if(self.dataController.dataList.count == 0){
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
                
            }
            NSLog(@"four finish");
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
            
        }];
        if (self.dataList.count == 0) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
//    [self.dataController requestDataForAllReserverWithParams:params success:^{
//        if (self.dataController.dataList.count > 0) {
//            _page = _page + 1;
//            NSArray *moreData = self.dataController.dataList;
//            [self.dataList addObjectsFromArray:moreData];
//            [self.tableView reloadData];
//            [self.tableView.mj_footer endRefreshing];
//        }else if(self.dataController.dataList.count == 0){
//            [self.tableView.mj_footer endRefreshingWithNoMoreData];
//            self.tableView.mj_footer.hidden = YES;
//        }
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        [self.tableView.mj_footer endRefreshing];
//    }];
}

#pragma mark - event response

//- (void)rightItemDidClick{
//    YZKPopOverViewController *popVc = [[YZKPopOverViewController alloc] init];
//    popVc.dataList = @[@{@"iconName": @"navigationbar_pop_plane", @"text":@"登记收文"}, @{@"iconName": @"navigationbar_pop_note", @"text":@"我的草稿"}, @{@"iconName": @"navigationbar_pop_my", @"text":@"我的申请"}, @{@"iconName": @"navigationbar_pop_clock", @"text":@"待审核"}, @{@"iconName": @"navigationbar_pop_icon", @"text":@"经我审核"}, @{@"iconName": @"navigationbar_pop_square", @"text":@"发文存档"}, @{@"iconName": @"navigationbar_pop_notebook", @"text":@"发文督办"}];
//    popVc.modalPresentationStyle = UIModalPresentationCustom;
//    popVc.transitioningDelegate = self.model;
//    popVc.frame = self.model.frame;
//    [self presentViewController:popVc animated:YES completion:nil];
//}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - getter and setter

- (YZKPopOverModel *)model{
    if (_model == nil) {
        _model = [[YZKPopOverModel alloc] init];
        _model.frame = CGRectMake(SCREEN_WIDTH - mywidth(216) - mywidth(30), myheight(54), mywidth(216), myheight(436));
    }
    return _model;
}

- (YZKMeetReserveDataController *)dataController{
    if (_dataController == nil) {
        _dataController = [[YZKMeetReserveDataController alloc] init];
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
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = myheight(166);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor whiteColor];
        _tableView.tableFooterView = view;
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadFreshReserve)];
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreReserve)];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    }
    return _tableView;
}

@end

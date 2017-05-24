//
//  YZKScheduleDetailViewController.m
//  SCGD
//
//  Created by Lizeyu on 16/10/27.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKScheduleDetailViewController.h"
#import "YZKScheduleModel.h"
#import "YZKSingleLineCell.h"
#import "YZKContentModel.h"

@interface YZKScheduleDetailViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

static NSString *const cellReuseID = @"cellReuseID";
@implementation YZKScheduleDetailViewController

#pragma mark - life cycle

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setupUI];
}


#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }else{
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YZKSingleLineCell *cell = (YZKSingleLineCell *)[YZKStyleManager initCellWithCellType:YZKCellSingleLine forTableView:tableView];
    if (indexPath.section == 0 && indexPath.row == 0) {
        [cell createWithTitle:@"时间" content:self.model.startTime rightLabel:@"" rightContent:@"" showIcon:NO];
    }else if (indexPath.section == 0  && indexPath.row == 1){
        [cell createWithTitle:@"内容" content:self.model.content rightLabel:@"" rightContent:@"" showIcon:NO];
    }else{
        [cell createWithTitle:@"是否设置消息提醒" content:@"" rightLabel:@"" rightContent:@"已设置" showIcon:NO];
    }
    [cell layoutIfNeeded];

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

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return myheight(20);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

#pragma mark - UITableView Delegate



#pragma mark - private method

- (void)setupUI{
    self.title = @"日程详情";
    [self.view addSubview:self.tableView];
}

#pragma mark - getter and setter

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = myheight(300);
        _tableView.allowsSelection = NO;
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor whiteColor];
        _tableView.tableFooterView = view;
    }
    return _tableView;
}

@end

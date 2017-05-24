//
//  YZKNoteDetailViewController.m
//  SCGD
//
//  Created by Lizeyu on 16/10/27.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKNoteDetailViewController.h"
#import "YZKScheduleModel.h"
#import "YZKSingleLineCell.h"
#import "YZKNoteModel.h"


@interface YZKNoteDetailViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

static NSString *const cellReuseID = @"cellReuseID";
@implementation YZKNoteDetailViewController

#pragma mark - life cycle

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setupUI];
}


#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YZKSingleLineCell *cell = (YZKSingleLineCell *)[YZKStyleManager initCellWithCellType:YZKCellSingleLine forTableView:tableView];
    switch (indexPath.row) {
        case 0:
        {
            [cell createWithTitle:@"标题" content:self.model.title rightLabel:@"" rightContent:@"" showIcon:NO];
        }
            break;
        case 1:
        {
            [cell createWithTitle:@"用户名" content:self.model.userName rightLabel:@"" rightContent:@"" showIcon:NO];
        }
            break;
        case 2:
        {
            [cell createWithTitle:@"模块名称" content:self.model.modeName rightLabel:@"" rightContent:@"" showIcon:NO];
        }
            break;
        case 3:
        {
            [cell createWithTitle:@"提醒时间" content:self.model.alertTime rightLabel:@"" rightContent:@"" showIcon:NO];
        }
            break;
        case 4:
        {
            [cell createWithTitle:@"提醒状态" content:[NSString stringWithFormat:@"%lu",(unsigned long)self.model.status] rightLabel:@"" rightContent:@"" showIcon:NO];
        }
            break;
        case 5:
        {
            [cell createWithTitle:@"内容" content:self.model.remark rightLabel:@"" rightContent:@"" showIcon:NO];
        }
            break;
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
    self.title = @"备忘录详情";
    [self.view addSubview:self.tableView];
}

#pragma mark - getter and setter

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = myheight(88);
        _tableView.allowsSelection = NO;
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor whiteColor];
        _tableView.tableFooterView = view;
    }
    return _tableView;
}

@end

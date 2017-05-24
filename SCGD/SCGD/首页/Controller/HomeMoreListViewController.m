//
//  HomeMoreListViewController.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/18.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "HomeMoreListViewController.h"
#import "HomeCell.h"
#import "HomeMoreListDataController.h"

@interface HomeMoreListViewController ()<UITableViewDataSource, UITableViewDelegate>
/**
 *  tableView
 */
@property (nonatomic, strong) UITableView *tableView;
/**
 *  dataController
 */
@property (nonatomic, strong) HomeMoreListDataController *homeMoreListDataController;
@end

@implementation HomeMoreListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = mainBackgroundColor;
    [self setUpSubView];
    [self layoutSubView];
    [self fetchData];
}
- (void)setUpSubView
{
    _homeMoreListDataController = [[HomeMoreListDataController alloc] init];
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
     _tableView.backgroundColor = mainBackgroundColor;
    _tableView.separatorStyle = NO;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self refreshData];
    }];
}
- (void)layoutSubView
{
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
}
- (void)refreshData
{
}
- (void)fetchData
{
}
#pragma mark --UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCell *cell = [HomeCell cellWithTableView:tableView];
    return cell;
}
#pragma mark --UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 51 / IPHONE6_HEIGHT * SCREEN_HEIGHT;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1)];
    line.backgroundColor = lineColor;
    return line;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *head = [[UIView alloc] init];
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = lineColor;
    [head addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(head);
        make.right.equalTo(head);
        make.height.equalTo(@1);
        make.bottom.equalTo(head.mas_bottom);
    }];
    return head;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  HomeViewController.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/14.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeDataController.h"
#import "ADView.h"
#import "HomeHeadView.h"
#import "BannerHeadView.h"
#import "HomeCell.h"
#import "HomeMoreListViewController.h"
#import "LoginViewController.h"

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource, HomeHeadViewDelegate>
{
    BOOL _islogin;
}
/**
 *  tableView
 */
@property (nonatomic, strong) UITableView *tableView;
/**
 *  dataController
 */
@property (nonatomic, strong) HomeDataController *homeDataController;
@end

@implementation HomeViewController
#pragma mark --life cycle
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _islogin = [[NSUserDefaults standardUserDefaults] boolForKey:ISLOGON];
    if (_islogin) {
        self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(note) image:@"navigationbar_login" highImage:@"navigationbar_login"];;
    }else
    {
        self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(login) title:@"登录" font:14 color:UIColorRGB(0xffffff)];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpSubView];
    [self layoutSubView];
    [self fetchData];
}
- (void)setUpSubView
{
    self.navigationItem.title = @"四川省新闻出版广电局";
   
    _homeDataController = [[HomeDataController alloc] init];
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
     _tableView.backgroundColor = mainBackgroundColor;
    _tableView.sectionFooterHeight = 10;
    _tableView.separatorStyle = NO;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self refreshData];
    }];
}
- (void)login
{
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    YZKNavigationController *nav = [[YZKNavigationController alloc] initWithRootViewController:loginVC];
    [self presentViewController:nav animated:YES completion:nil];
}
- (void)note
{
    [SVProgressHUD setMinimumDismissTimeInterval:2.0];
    [SVProgressHUD showSuccessWithStatus:@"已登录"];
    
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

//    [_homeDataController refreshBannerDataWithCallback:^(NSError *error) {
//        if (error == nil) {
//            [_tableView reloadData];
//            [_tableView.mj_header endRefreshing];
//        }
//    }];
    [_tableView.mj_header endRefreshing];

}
- (void)fetchData
{
//    [_homeDataController requestBannerDataWithCallback:^(NSError *error) {
//        if (error == nil) {
//            [_tableView reloadData];
//        }
//    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return 50 / IPHONE6_HEIGHT * SCREEN_HEIGHT;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return (300 + 80 + 88)/ IPHONE6_HEIGHT * SCREEN_HEIGHT;
    }else
        return 80 / IPHONE6_HEIGHT * SCREEN_HEIGHT;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
     
        BannerHeadView *headView = [[BannerHeadView alloc] initWithBannerData:_homeDataController.BannerData];
        headView.title = @"省局要闻";
        headView.delegate = self;
        return headView;
    }else
    {
        HomeHeadView *headView = [[HomeHeadView alloc] init];
        headView.delegate = self;
        headView.title = @"省局要闻";
        return headView;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *foot = [[UIView alloc] init];
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = lineColor;
    [foot addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(foot);
        make.right.equalTo(foot);
        make.height.equalTo(@1);
        make.top.equalTo(foot);
    }];
    return foot;
}

#pragma mark --HomeHeadViewDelegate
- (void)selectedMoreInHeadView:(HomeHeadView *)homeHeadView
{
    HomeMoreListViewController *list = [[HomeMoreListViewController alloc] init];
    list.title = homeHeadView.title;
    [self.navigationController pushViewController:list animated:YES];
}


@end

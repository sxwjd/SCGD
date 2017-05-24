//
//  YZKReceiveManageDetailViewController.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/22.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKReceiveManageDetailViewController.h"
#import "ReceiveManageHeadView.h"
#import "HeadSelectedView.h"
#import "ReceiveManageDetailCell.h"
#import "YZKRecevieManageDetailDataController.h"
#import "ReceiveManageListModel.h"
#import "ReceiveManageOponionModel.h"


@interface YZKReceiveManageDetailViewController ()<UITableViewDelegate, UITableViewDataSource>
/**
 *  dataController
 */
@property (nonatomic, strong) YZKRecevieManageDetailDataController *dataController;
/**
 *  headView
 */
@property (nonatomic, strong) HeadSelectedView *headView;
/**
 *  tableViewheadView
 */
@property (nonatomic, strong) ReceiveManageHeadView *tableViewheadView;
/**
 *  tableView
 */
@property (nonatomic, strong) UITableView *tableView;
/**
 *  webView
 */
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation YZKReceiveManageDetailViewController
#pragma mark --life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
    [self layOutView];
    [self loadData];
}
- (void)setupView
{
    
    self.navigationItem.title = @"处理签";
    //headView
//    _headView = [[HeadSelectedView alloc] init];
//    _headView.leftTitle = @"信息详情";
//    _headView.rightTitle = @"处理签";
//    _headView.delegate = self;
   // [self.view addSubview:_headView];
    
    //tableViewHeadView
    _tableViewheadView = [[ReceiveManageHeadView alloc] init];
    
    //webView
    _webView = [[UIWebView alloc] init];
    //[self.view addSubview:_webView];
    
    //tableview
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    _tableView.backgroundColor = mainBackgroundColor;
//    _tableView.tableHeaderView = _tableViewheadView;
    _tableView.sectionFooterHeight = CGFLOAT_MIN;
    _tableView.estimatedSectionHeaderHeight = myheight(848);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorColor = lineColor;
    [self.view addSubview:_tableView];
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadData];
    }];
    
    //dataController
    _dataController = [[YZKRecevieManageDetailDataController alloc] init];
    
    
}
- (void)loadData
{
    [_dataController requestDetailWithUrl:_url param:_param callBack:^{
        [_tableView reloadData];
        [_tableView.mj_header endRefreshing];
    }];
}
- (void)layOutView
{
   
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
       // make.top.equalTo(_headView.mas_bottom);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    //_tableView.hidden = YES;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark --UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataController.readList.count + 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }else
    {
        ReceiveManageListModel *list =_dataController.readList[section];
        return list.opinions.count;
    }
        
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ReceiveManageDetailCell *cell = [ReceiveManageDetailCell cellWithTableView:tableView];
    ReceiveManageListModel *list =_dataController.readList[indexPath.section];
    cell.model = list.opinions[indexPath.row];
    cell.seat = list.seat;
    return cell;
}
#pragma mark --UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return myheight(194);
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return UITableViewAutomaticDimension;
    }else
        return myheight(20);
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        [_tableViewheadView layoutIfNeeded];
        [_tableViewheadView setNeedsLayout];
        _tableViewheadView.model = _dataController.receiveManageDetail;
        _tableViewheadView.attachmentArr = _dataController.attachmentList;
        _tableViewheadView.processArr = _dataController.processList;
        return _tableViewheadView;
    }else
    {
        UIView *view = [[UIView alloc] init];
        return view;
    }
}
#pragma mark --HeadSelectedViewDelegate
//- (void)headSelectedView:(HeadSelectedView *)headSelectedView SelectedWithTag:(NSInteger)tag
//{
//    switch (tag) {
//        case 0:
//        {
//            _webView.hidden = NO;
//            _tableView.hidden = YES;
//        }
//            break;
//            
//        default:
//        {
//            _tableView.hidden = NO;
//            _webView.hidden = YES;
//        }
//            break;
//    }
//}
@end

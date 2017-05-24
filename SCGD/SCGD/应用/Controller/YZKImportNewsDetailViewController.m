//
//  YZKImportNewsDetailViewController.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/25.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKImportNewsDetailViewController.h"
#import "HeadSelectedView.h"
#import "ImportNewsDetailHeadView.h"
#import "ImportNewsDetailCell.h"
#import "YZKImportNewsDetailDataController.h"
#import "YZKDetailContentModel.h"

@interface YZKImportNewsDetailViewController ()<UITableViewDelegate, UITableViewDataSource, HeadSelectedViewDelegate>
/**
 *  dataController
 */
@property (nonatomic, strong) YZKImportNewsDetailDataController *dataController;
/**
 *  headView
 */
@property (nonatomic, strong)  HeadSelectedView *headView;
/**
 *  contentLabel
 */
@property (nonatomic, strong) UILabel *contentLabel;
/**
 *  contentView
 */
@property (nonatomic, strong) UIScrollView *contentView;
/**
 *  tableViewHeadView
 */
@property (nonatomic, strong) ImportNewsDetailHeadView *tableViewHeadView;
/**
 *  tableView
 */
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation YZKImportNewsDetailViewController
#pragma mark --life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpView];
    [self layOutView];
    [self loadData];
}
- (void)loadData
{
    [_dataController requestDetailWithUrl:_url param:_param callBack:^(void) {
        _contentLabel.text = _dataController.content.content;
        [_tableView reloadData];
        [_contentView.mj_header endRefreshing];
        [_tableView.mj_header endRefreshing];
    }];
}
- (void)setUpView
{
    //headView
    _headView = [[HeadSelectedView alloc] init];
    _headView.leftTitle = @"信息详情";
    _headView.rightTitle = @"处理签";
    _headView.delegate = self;
    [self.view addSubview:_headView];
    
    //contentView
    _contentView = [[UIScrollView alloc] init];
    _contentView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_contentView];
    _contentView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadData];
    }];
    
    //contentLabel
    _contentLabel = [[UILabel alloc] init];
    _contentLabel.textColor = fontBlackColor;
    _contentLabel.font = [UIFont systemFontOfSize:15];
    _contentLabel.numberOfLines = 0;
    [_contentView addSubview:_contentLabel];
    
    
    //tableViewHeadView
    _tableViewHeadView = [[ImportNewsDetailHeadView alloc] init];
    
    //tableView
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    _tableView.backgroundColor = mainBackgroundColor;
    _tableView.sectionFooterHeight = CGFLOAT_MIN;
    _tableView.estimatedSectionHeaderHeight = myheight(848);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = NO;
    [self.view addSubview:_tableView];
    
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadData];
    }];
    
    //dataController
    _dataController = [[YZKImportNewsDetailDataController alloc] init];
}
- (void)layOutView
{
    [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.height.mas_equalTo(myheight(86));
    }];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(_headView.mas_bottom);
        make.bottom.equalTo(self.view);
    }];
    _tableView.hidden = YES;
    
    
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(_headView.mas_bottom);
        make.bottom.equalTo(self.view);
    }];
    _contentView.hidden = NO;
    
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_contentView).offset(mywidth(20));
        make.right.equalTo(_contentView).offset(-mywidth(20));
        make.top.equalTo(_contentView).offset(myheight(30));
        make.width.mas_equalTo(SCREEN_WIDTH - mywidth(20) * 2);
        make.bottom.equalTo(_contentView).offset(-myheight(30));
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark --UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }else
        return _dataController.readList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ImportNewsDetailCell  *cell = [ImportNewsDetailCell cellWithTableView:tableView];
    cell.model = _dataController.readList[indexPath.row];
    return cell;
}
#pragma mark --UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return myheight(50);
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return UITableViewAutomaticDimension;
    }else
        return myheight(72);
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        [_tableViewHeadView layoutIfNeeded];
        [_tableViewHeadView setNeedsLayout];
        _tableViewHeadView.detail = _dataController.importNewsDetail;
        return _tableViewHeadView;
    }else
    {
        UILabel *countLabel = [[UILabel alloc] init];
        countLabel.textColor = UIColorRGB(0xb8b8b8);
        countLabel.font = [UIFont systemFontOfSize:15];
        countLabel.text = [NSString stringWithFormat:@"  已读(%ld)",_dataController.readList.count];
        return countLabel;
    }
}
#pragma mark --HeadSelectedViewDelegate
- (void)headSelectedView:(HeadSelectedView *)headSelectedView SelectedWithTag:(NSInteger)tag
{
    switch (tag) {
        case 0:
        {
            _contentView.hidden = NO;
            _tableView.hidden = YES;
        }
            break;
            
        default:
        {
            _tableView.hidden = NO;
            _contentView.hidden = YES;
        }
            break;
    }
}
@end

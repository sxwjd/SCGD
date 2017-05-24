//
//  YZKMeetChooseViewController.m
//  SCGD
//
//  Created by Lizeyu on 16/10/21.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKMeetChooseViewController.h"
#import "YZKTableCommonFooterView.h"
#import "YZKMeetReserveDataController.h"
#import "YZKContentModel.h"
#import "YZKReserveModel.h"

@interface YZKMeetChooseViewController () <UITableViewDelegate, UITableViewDataSource, YZKTableCommonFooterViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) YZKTableCommonFooterView *footerView;
@property (nonatomic, strong) NSMutableArray *dataList;
@property (nonatomic, strong) YZKMeetReserveDataController *dataController;
@property (nonatomic, strong) NSIndexPath *oldIndexPath;
@property (nonatomic, copy) NSDictionary *rowDict;



@end

@implementation YZKMeetChooseViewController


#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    _rowDict = @{@"1":@"1", @"3":@"2", @"4":@"3"};
    [self setupUI];
    [self loadData];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (self.selectedRow == nil) {
        self.oldIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:self.oldIndexPath];
        cell.accessoryView.hidden = NO;
    }else{
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:[self.rowDict[self.selectedRow] integerValue] inSection:0]];
        cell.accessoryView.hidden = NO;
        self.oldIndexPath = [NSIndexPath indexPathForRow:[self.rowDict[self.selectedRow] integerValue] inSection:0];
    }
   
    
}

#pragma mark - UITableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [YZKStyleManager initCellWithCellType:YZKCellValue1 forTableView:tableView];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"application_pitch-on"] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, button.currentImage.size.width, button.currentImage.size.height);
    cell.accessoryView = button;
    cell.accessoryView.hidden = YES;
    
//    cell.textLabel.text = self.dataList[indexPath.row];
    YZKReserveModel *model = self.dataList[indexPath.row];
    cell.textLabel.text = model.roomName;
    return cell;
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:self.oldIndexPath];
    cell.accessoryView.hidden = YES;
    UITableViewCell *selectCell = [tableView cellForRowAtIndexPath:indexPath];
    selectCell.accessoryView.hidden = NO;
    self.oldIndexPath = indexPath;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return myheight(88);
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

#pragma mark - YZKTableCommonFooterViewDelegate 

- (void)tableCommonFooterView:(YZKTableCommonFooterView *)view sureBtnDidClick:(UIButton *)button{
    YZKReserveModel *model = self.dataList[self.oldIndexPath.row];
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
    params[LOGINID] = [[NSUserDefaults standardUserDefaults] objectForKey:LOGINID];
    if (model.id == 0) {
        [self.dataController requestDataForAllReserverWithParams:params success:^{
            if (self.block) {
                self.block(self.dataController.dataList, model.roomName, 0);
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
        }];
        
    }else{
        NSString *roomID = [NSString stringWithFormat:@"%ld",model.id];
       [self.dataController requestDatAForSpecifyMeetingRoomId:roomID success:^{
           if (self.block) {
               self.block(self.dataController.dataList, model.roomName, roomID);
           }
       } failure:^(NSURLSessionDataTask *task, NSError *error) {
           
       }];
    }
    [self.navigationController popViewControllerAnimated:YES];
    

}

#pragma mark - private methods

- (void)loadData{
    [self.dataController requestDataForMeetingRoomNameWithCompletion:^{
        self.dataList = self.dataController.dataList;
        YZKReserveModel *model = [[YZKReserveModel alloc] init];
        model.roomName = @"全部";
        model.id = 0;
        [self.dataList insertObject:model atIndex:0];
        [self.tableView reloadData];
    }];
}

- (void)setupUI{
    self.view.backgroundColor = UIColorRGB(0xf8f8f8);
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = self.footerView;
}


#pragma mark - getter and setter

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSMutableArray *)dataList{
    if (_dataList == nil) {
        _dataList = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataList;
}

- (YZKMeetReserveDataController *)dataController{
    if (_dataController == nil) {
        _dataController = [[YZKMeetReserveDataController alloc] init];
    }
    return _dataController;
}

- (YZKTableCommonFooterView *)footerView{
    if (_footerView == nil) {
        _footerView = [[YZKTableCommonFooterView alloc] init];
        _footerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        _footerView.delegate = self;
    }
    return _footerView;
}
@end

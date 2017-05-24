//
//  YZKStationLetterDetailViewController.m
//  SCGD
//
//  Created by Lizeyu on 16/10/27.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKStationLetterDetailViewController.h"
#import "YZKScheduleModel.h"
#import "YZKSingleLineCell.h"
#import "YZKNoteModel.h"
#import "YZKStationLetterReceiveModel.h"
#import "YZKStationLetterPostedModel.h"

@interface YZKStationLetterDetailViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

static NSString *const cellReuseID = @"cellReuseID";
@implementation YZKStationLetterDetailViewController

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
        return 5;
    }else{
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YZKSingleLineCell *cell = (YZKSingleLineCell *)[YZKStyleManager initCellWithCellType:YZKCellSingleLine forTableView:tableView];
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                {
                    [cell createWithTitle:@"发件人" content:self.receiveModel.senderName ? self.receiveModel.senderName : self.postedModel.senderId  rightLabel:@"" rightContent:@"" showIcon:NO];
                }
                    break;
                case 1:
                {
                      [cell createWithTitle:@"收件人" content:self.receiveModel.receiverId ? self.receiveModel.receiverId : self.postedModel.receiverNames  rightLabel:@"" rightContent:@"" showIcon:NO];
                }
                    break;
                case 2:
                {
                      [cell createWithTitle:@"标题" content:self.receiveModel.title ? self.receiveModel.title : self.postedModel.title  rightLabel:@"" rightContent:@"" showIcon:NO];
                }
                    break;
                case 3:
                {
                      [cell createWithTitle:@"时间" content:self.receiveModel.createDate ? self.receiveModel.createDate : self.postedModel.createDate  rightLabel:@"" rightContent:@"" showIcon:NO];
                }
                    break;
                case 4:
                {
                      [cell createWithTitle:@"内容" content:self.receiveModel.msgText ? self.receiveModel.msgText : self.postedModel.msgText  rightLabel:@"" rightContent:@"" showIcon:NO];
                }
                    break;
            }
        }
            break;
        case 1:
        {
                        [cell createWithTitle:@"附件" content:self.receiveModel.srcFileName ? self.receiveModel.srcFileName : self.postedModel.srcFileName  rightLabel:@"" rightContent:@"" showIcon:YES];
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
    self.title = @"预约详情";
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

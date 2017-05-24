//
//  YZKNetDiskDetailViewController.m
//  SCGD
//
//  Created by Lizeyu on 16/11/1.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKNetDiskDetailViewController.h"
#import "YZKSingleLineCell.h"
#import "YZKNetworkDiskModel.h"

@interface YZKNetDiskDetailViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation YZKNetDiskDetailViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
   
}

#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
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
                    [cell createWithTitle:@"标题" content:self.model.title rightLabel:nil rightContent:nil showIcon:NO];
                }
                    break;
                case 1:
                {
                    [cell createWithTitle:@"共享者" content:[[NSUserDefaults standardUserDefaults] objectForKey:USERNAME] rightLabel:nil rightContent:nil showIcon:NO];
                }
                    break;
                case 2:
                {
                    [cell createWithTitle:@"内容" content:self.model.content rightLabel:nil rightContent:nil showIcon:NO];
                }
                    break;
            }
        }
            break;
        case 1:
        {
            [cell createWithTitle:@"附件" content:self.model.srcFileName rightLabel:nil rightContent:nil showIcon:YES];
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                [button setImage:[UIImage imageNamed:@"application_download"] forState:UIControlStateNormal];
            button.size = button.currentImage.size;
            [button addTarget:self action:@selector(download:) forControlEvents:UIControlEventTouchUpInside];
            cell.accessoryView = button;
        }
            break;
    }
    [cell layoutIfNeeded];
    return cell;
    
}



#pragma mark - UITableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return myheight(20);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

#pragma mark - private method

- (void)setupUI{
    [self.view addSubview:self.tableView];
}

#pragma mark - event response

- (void)download:(UIButton *)button{
    NSLog(@"%s",__FUNCTION__);
}

#pragma mark - getter and setter

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    }
    return _tableView;
}


@end

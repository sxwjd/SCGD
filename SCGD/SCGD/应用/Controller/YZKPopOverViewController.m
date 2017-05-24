//
//  YZKPopOverViewController.m
//  SCGD
//
//  Created by Lizeyu on 16/10/17.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKPopOverViewController.h"
#import "YZKPopCommonCell.h"
#import "YZKApplicationModel.h"

@interface YZKPopOverViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *bgView;
@property (nonatomic, copy) NSMutableArray  *models;

@end

static NSString *const popOverCellId = @"popOverCellId";
@implementation YZKPopOverViewController

#pragma mark - life cycle


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    [self setupUI];
    [self tableFooterView];
    [self initData];
}

#pragma mark - UITableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YZKPopCommonCell *cell = [tableView dequeueReusableCellWithIdentifier:popOverCellId forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.model = self.models[indexPath.row];
    
    return cell;
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.delegate && [self.delegate respondsToSelector:@selector(popOverViewController:didSelectedIndex:)]) {
        [self.delegate popOverViewController:self didSelectedIndex:indexPath];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return myheight(60);
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
}



#pragma mark - private method

- (void)setupUI{
    [self.view addSubview:self.bgView];
    self.bgView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self.bgView addSubview:self.tableView];
    self.bgView.layer.borderWidth = 1;
    self.bgView.layer.borderColor= lineColor.CGColor;
    self.bgView.layer.cornerRadius = 4;
    self.bgView.layer.masksToBounds = YES;
    self.tableView.frame = CGRectMake(2, 2, self.frame.size.width - 2 * 2, self.frame.size.height - 2 * 2);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

- (void)tableFooterView{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    self.tableView.tableFooterView = view;
}

- (void)initData{
    for (NSDictionary *dict in self.dataList) {
        YZKApplicationModel *model = [YZKApplicationModel modelWithDict:dict];
        [self.models addObject:model];
    }
}

#pragma mark - getter and setter

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x + 10, self.view.frame.origin.y + 10, self.view.frame.size.width - 20, self.view.frame.size.height - 20) style:UITableViewStylePlain];
        [_tableView registerClass:[YZKPopCommonCell class] forCellReuseIdentifier:popOverCellId];
        [_tableView setBackgroundColor:[UIColor clearColor]];
        
        _tableView.layer.masksToBounds = YES;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UIImageView *)bgView{
    if (_bgView == nil) {
        _bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"application_bgview"]];
        _bgView.userInteractionEnabled = YES;
    }
    return _bgView;
}

- (NSMutableArray *)models{
    if (_models == nil) {
        _models = [NSMutableArray arrayWithCapacity:0];
    }
    return _models;
}



@end

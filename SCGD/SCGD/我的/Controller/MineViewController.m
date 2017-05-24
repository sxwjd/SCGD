//
//  MineViewController.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/14.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "MineViewController.h"
#import "MineHeadView.h"
#import "MineFootView.h"
#import "MineListCell.h"
#import "ChangePasswordViewController.h"
#import "NoteView.h"
#import "MineDataController.h"
#import "LoginViewController.h"

@interface MineViewController ()<UITableViewDataSource, UITableViewDelegate,MineFootViewDelegate,NoteViewDelegate>
{
    NSInteger _zero;
}
/**
 *  noteView
 */
@property (nonatomic, strong) NoteView *noteView;

/**
 *  headView
 */
@property (nonatomic, strong) MineHeadView *headView;
/**
 *  tableView
 */
@property (nonatomic, strong) UITableView *tableView;
/**
 *  dataController
 */
@property (nonatomic, strong) MineDataController *dataController;
@end

@implementation MineViewController
#pragma mark --life cycle
- (void)updateViewConstraints
{
    
    [_noteView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(_zero * SCREEN_HEIGHT);
        make.height.mas_equalTo(SCREEN_HEIGHT);
    }];
    [super updateViewConstraints];

}
-(void)viewDidLayoutSubviews {
    if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [_tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([_tableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [_tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    BOOL isLogin = [[NSUserDefaults standardUserDefaults] boolForKey:ISLOGON];
    if (isLogin) {
        [self getUserMessage];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpSubView];
    [self layoutSubView];
}
- (void)setUpSubView
{
    //nav
    self.navigationItem.title = @"我的";
    //headView
    _headView = [[MineHeadView alloc] init];
    [self.view addSubview:_headView];
    
    //tableView
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    _tableView.backgroundColor = mainBackgroundColor;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    //noteView
    _noteView = [[NoteView alloc] init];
    _noteView.delegate = self;
    [self.view addSubview:_noteView];
    
    //dataController
    _dataController = [[MineDataController alloc] init];
}
- (void)layoutSubView
{
    [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(@(myheight(200)));
    }];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(_headView.mas_bottom);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    _zero = 1;
    [_noteView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(_zero * SCREEN_HEIGHT);
        make.height.mas_equalTo(SCREEN_HEIGHT);
    }];
    
}
- (void)getUserMessage
{
    [_dataController getUserMessageWithCallback:^{
        _headView.userMsg = _dataController.userMessage;
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark --UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MineListCell  *cell = [MineListCell cellWithTableView:tableView];
    return cell;
}
#pragma mark --UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ChangePasswordViewController *detail = [[ChangePasswordViewController alloc] init];
    [self.navigationController pushViewController:detail animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return myheight(20);
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *foot = [[UIView alloc] init];
    foot.backgroundColor = mainBackgroundColor;
    return foot;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return myheight(160);
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    MineFootView *foot = [[MineFootView alloc] init];
    foot.delegate = self;
    return foot;
}
/**
 *  配合viewDidLayoutSubviews方法将cell的分割线通长
 */
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}
#pragma mark --MineFootViewDelegate
//退出登录
- (void)signOutInMineFootView:(MineFootView *)footView
{
    _zero = 0;
    [self updateView];
}
#pragma mark --NoteViewDelegate
- (void)signOutWithTag:(NSInteger)tag
{
    _zero = 1;
    [self updateView];
    switch (tag) {
        case 0:
        {
            //确定
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:ISLOGON];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:LOGINID];
            LoginViewController *login = [[LoginViewController alloc] init];
            YZKNavigationController *nav = [[YZKNavigationController alloc] initWithRootViewController:login];
            [UIApplication sharedApplication].keyWindow.rootViewController = nav;
        }
            break;
        default:
            //取消
            break;
    }
}
- (void)updateView
{
    // 告诉self.view约束需要更新
    [self.view setNeedsUpdateConstraints];
    // 调用此方法告诉self.view检测是否需要更新约束，若需要则更新，下面添加动画效果才起作用
    [self.view updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}
@end

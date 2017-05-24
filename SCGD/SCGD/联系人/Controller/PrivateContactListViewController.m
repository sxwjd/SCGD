//
//  PrivateContactListViewController.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/19.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "PrivateContactListViewController.h"
#import "ContactListCell.h"
#import "ContactListCellTwo.h"
#import "ContactSectionHead.h"
#import "PrivateContactDetailController.h"
#import "PrivateSectionDetail.h"
#import "ContactMsg.h"

@interface PrivateContactListViewController ()<UITableViewDelegate, UITableViewDataSource>
/**
 *  dataController
 */
@property (nonatomic, strong) PrivateContactDetailController *dataController;
/**
 *  tableView
 */
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation PrivateContactListViewController

#pragma mark --life cycle
-(void)viewDidLayoutSubviews {
    if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [_tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([_tableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [_tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpSubView];
    [self layoutSubView];
    [self loadData];
}
- (void)setUpSubView
{
    _dataController = [[PrivateContactDetailController alloc] init];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    _tableView.backgroundColor = mainBackgroundColor;
    _tableView.sectionFooterHeight = CGFLOAT_MIN;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
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
- (void)loadData
{
    [_dataController requestPrivateContactSectionDetailDataWithParm:@{@"typeId":_id} Callback:^(NSError *error) {
        if (!error) {
            [_tableView reloadData];
        }
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark --UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataController.privateContactSectionDetailArr.count;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    PrivateSectionDetail *Section = _dataController.privateContactSectionDetailArr[section];
    return Section.addressBook.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PrivateSectionDetail *contactSection = _dataController.privateContactSectionDetailArr[indexPath.section];
    ContactMsg *contact = contactSection.addressBook[indexPath.row];
    if (contact.cellPhone.length && contact.unitTel.length) {
        ContactListCellTwo *cell = [ContactListCellTwo cellWithTableView:tableView];
        cell.contact = contact;
        return cell;
    }else
    {
        ContactListCell *cell = [ContactListCell cellWithTableView:tableView];
        cell.contact = contact;
        return cell;
    }
}

#pragma mark --UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PrivateSectionDetail *contactSection = _dataController.privateContactSectionDetailArr[indexPath.section];
    ContactMsg *contact = contactSection.addressBook[indexPath.row];
    if (contact.cellPhone.length && contact.unitTel.length) {
        return myheight(128);
    }else
        return myheight(90);
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return myheight(68);
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    PrivateSectionDetail *contactSection = _dataController.privateContactSectionDetailArr[section];
    ContactSectionHead *head = [[ContactSectionHead alloc] init];
    head.title = contactSection.name;
    return head;
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
@end

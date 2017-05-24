//
//  ContactsViewController.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/14.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "ContactsViewController.h"
#import "HeadSelectedView.h"
#import "ContactListCell.h"
#import "ContactListCellTwo.h"
#import "ContactSectionHead.h"
#import "PrivateSectionCell.h"
#import "PrivateContactListViewController.h"
#import "ContactDataController.h"
#import "ContactSection.h"
#import "ContactMsg.h"
#import "PrivateSection.h"
#import "YZKPopOverViewController.h"
#import "YZKPopOverModel.h"

@interface ContactsViewController ()<UITableViewDelegate, UITableViewDataSource,HeadSelectedViewDelegate, YZKPopOverViewControllerDelegate>
{
    /**
     *  排序方式
     */
    NSInteger _sortTag;
    /**
     *  头选择
     */
    NSInteger _selectedTag;
}
@property (nonatomic, strong) YZKPopOverModel *model;

/**
 *  dataController
 */
@property (nonatomic, strong) ContactDataController *dataController;
/**
 *  contactHeadView
 */
@property (nonatomic, strong) HeadSelectedView *contactHeadView;
/**
 *  tableView
 */
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ContactsViewController
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
    [self reloadData];
}
- (void)setUpSubView
{
    //tag
    _selectedTag = 0;
    _sortTag = 0;
    //nav
    self.navigationItem.title = @"联系人";
    if (_selectedTag == 0) {
        self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(popSelectedView) image:@"navigationBar_more" highImage:@"navigationBar_more"];
    }
    //headview
    _contactHeadView = [[HeadSelectedView alloc] init];
    _contactHeadView.delegate = self;
    _contactHeadView.leftTitle = @"公共通讯录";
    _contactHeadView.rightTitle = @"私人通讯录";
    [self.view addSubview:_contactHeadView];
    //tableview
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    _tableView.backgroundColor = mainBackgroundColor;
    _tableView.sectionFooterHeight = CGFLOAT_MIN;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self reloadData];
    }];
    //datacontroller
    _dataController = [[ContactDataController alloc] init];
    
}
- (void)layoutSubView
{
    [_contactHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(@(myheight(86)));
    }];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(_contactHeadView.mas_bottom);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
}
- (void)popSelectedView
{
    YZKPopOverViewController *popVc = [[YZKPopOverViewController alloc] init];
    popVc.dataList = @[@{@"iconName": @"navigationbar_pop_plane", @"text":@"按组织"}, @{@"iconName": @"navigationbar_pop_note", @"text":@"按人员"}];
    popVc.modalPresentationStyle = UIModalPresentationCustom;
    popVc.transitioningDelegate = self.model;
    popVc.frame = self.model.frame;
    popVc.delegate = self;
    [self presentViewController:popVc animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark --UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    switch (_selectedTag) {
        case 0:
        {
            //公共通讯录
             return _dataController.organizationDataArr.count;
        }
            break;
            
        default:
        {
            //私人通讯录
            return 2;
        }
            break;
    }
   
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    switch (_selectedTag) {
        case 0:
        {
            //公共通讯录
            ContactSection *contactSection = _dataController.organizationDataArr[section];
            return contactSection.ggxl.count;
        }
            break;
            
        default:
        {
            //私人通讯录
            switch (section) {
                case 0:
                    //组名
                    return _dataController.privateContactSectionArr.count;
                    break;
                    
                default:
                    //组外人员
                    return 0;
                    break;
            }
        }
            break;
    }
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    switch (_selectedTag) {
        case 0:
        {
            //公共通讯录
            ContactSection *contactSection = _dataController.organizationDataArr[indexPath.section];
            ContactMsg *contact = contactSection.ggxl[indexPath.row];
            if (contact.cellPhone.length && contact.unitTel.length) {
                ContactListCellTwo *cell = [ContactListCellTwo cellWithTableView:tableView];
                cell.contact = contact;
                cell.selectionStyle = NO;
                return cell;
            }else
            {
                ContactListCell *cell = [ContactListCell cellWithTableView:tableView];
                cell.selectionStyle = NO;
                cell.contact = contact;
                return cell;
            }

        }
            break;
            
        default:
        {
            //私人通讯录
            if (indexPath.section == 1) {
                //组外人员
                if (indexPath.row == 0) {
                    //两个电话
                    ContactListCellTwo *cell = [ContactListCellTwo cellWithTableView:tableView];
                    cell.selectionStyle = NO;
                    return cell;
                    
                }else
                {
                    //一个电话
                    ContactListCell *cell = [ContactListCell cellWithTableView:tableView];
                    cell.selectionStyle = NO;
                    return cell;
                }
            }else
            {
                //组名
                PrivateSection *section = _dataController.privateContactSectionArr[indexPath.row];
                PrivateSectionCell *cell = [PrivateSectionCell cellWithTableView:tableView];
                cell.title = section.typeName;
                return cell;
            }
        }
            break;
    }
}

#pragma mark --UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (_selectedTag) {
        case 0:
            //公共通讯录
            return;
            break;
        default:
             //私人通讯录
            if (indexPath.section == 1) {
                //组外人员
                return;
            }else
            {
                PrivateSection *section = _dataController.privateContactSectionArr[indexPath.row];
                PrivateContactListViewController *sectionList = [[PrivateContactListViewController alloc] init];
                sectionList.id = section.id;
                sectionList.navigationItem.title = section.typeName;
                [self.navigationController pushViewController:sectionList animated:YES];
            }
            break;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (_selectedTag) {
        case 0:
        {
            //公共通讯录
            ContactSection *contactSection = _dataController.organizationDataArr[indexPath.section];
            ContactMsg *contact = contactSection.ggxl[indexPath.row];
            if (contact.cellPhone.length && contact.unitTel.length) {
                //两手机号
                return myheight(128);
            }else
                //一手机号
                return myheight(90);
        }
            break;
            
        default:
        {
            //私人通讯录
            if (indexPath.section == 1) {
                //组外人员
                if (indexPath.row == 0) {
                    //两手机号
                    return myheight(128);
                }else
                    //一手机号
                    return myheight(90);
              
            }else
            {
                //组名
                return myheight(88);
               
            }
        }
            break;
    }
  
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    switch (_selectedTag) {
        case 0:
        {
            //公共通讯录
           return myheight(68);
        }
            break;
            
        default:
        {
            //私人通讯录
            if (section == 1) {
                //组外人员
               return myheight(68);
                
            }else
            {
                //组名
                return CGFLOAT_MIN;
                
            }
        }
            break;
    }

    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    switch (_selectedTag) {
        case 0:
        {
            ContactSection *contactSection = _dataController.organizationDataArr[section];
            //公共通讯录
            ContactSectionHead *head = [[ContactSectionHead alloc] init];
            head.title = contactSection.name;
            return head;
        }
            break;
            
        default:
        {
            //私人通讯录
            if (section == 1) {
                //组外人员
                ContactSectionHead *head = [[ContactSectionHead alloc] init];
                head.title = @"组外联系人";
                return head;
                
            }else
            {
                //组名
                return nil;
                
            }
        }
            break;
    }
    
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
#pragma mark --HeadSelectedViewDelegate
- (void)headSelectedView:(HeadSelectedView *)headSelectedView SelectedWithTag:(NSInteger)tag
{
    _selectedTag = tag;
    [self reloadData];
    if (_selectedTag == 0) {
        self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(popSelectedView) image:@"navigationBar_more" highImage:@"navigationBar_more"];
    }else
    {
        self.navigationItem.rightBarButtonItem = nil;
    }
  
}
- (void)reloadData
{
    switch (_selectedTag) {
        case 0:
        {
            switch (_sortTag) {
                case 0:
                {
                    [_dataController requestContactDataSortByOrganizationWithCallback:^(NSError *error) {
                        if (!error) {
                            [_tableView reloadData];
                            [_tableView.mj_header endRefreshing];
                        }
                    }];
                }
                    break;
                    
                default:
                {
                    [_dataController requestContactDataSortByPersonnelWithCallback:^(NSError *error) {
                        if (!error) {
                            [_tableView reloadData];
                            [_tableView.mj_header endRefreshing];
                        }
                    }];
                }
                    break;
            }
        }
            break;
            
        default:
        {
            [_dataController requestPrivateContactSectionListDataWithCallback:^(NSError *error) {
                if (!error) {
                    [_tableView reloadData];
                    [_tableView.mj_header endRefreshing];
                }
            }];
        }
            break;
    }
}
- (YZKPopOverModel *)model{
    if (_model == nil) {
        _model = [[YZKPopOverModel alloc] init];
        _model.frame = CGRectMake(SCREEN_WIDTH - mywidth(216) - mywidth(30), myheight(54), mywidth(216), myheight(128));
    }
    return _model;
}
#pragma mark --YZKPopOverViewControllerDelegate
- (void)popOverViewController:(YZKPopOverViewController *)popOverViewController didSelectedIndex:(NSIndexPath *)indexPath
{
    _sortTag = indexPath.row;
    [self reloadData];
}
@end

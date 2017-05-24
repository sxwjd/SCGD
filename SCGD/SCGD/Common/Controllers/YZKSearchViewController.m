//
//  YZKSearchViewController.m
//  SCGD
//
//  Created by Lizeyu on 16/10/20.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKSearchViewController.h"
#import "YZKSearchBarButtonView.h"
#import "YZKContentModel.h"
#import "YZKAnnounceModel.h"
#import "UITableView+YZKCellStyle.h"
#import "YZKReserveCell.h"
#import "YZKReserveModel.h"
#import "YZKCommonDataController.h"
#import "YZKReceManageDataController.h"
#import "YZKStationLetterDataController.h"
#import "YZKContentModel.h"
#import "YZKKnowledgeBaseDataController.h"
#import "YZKNetworkDiskDataController.h"
#import "YZKNoteDataController.h"
#import "YZKStationLetterReceiveModel.h"
#import "YZKStationLetterDetailViewController.h"
#import "YZKStationLetterPostedModel.h"
#import "YZKNoteModel.h"
#import "YZKNoteDetailViewController.h"
#import "YZKImportNewsDetailViewController.h"
#import "YZKReceiveManageDetailViewController.h"
#import "YZKNetworkDiskModel.h"
#import "YZKNetDiskDetailViewController.h"

@interface YZKSearchViewController () <UITableViewDataSource, UITableViewDelegate, YZKSearchBarButtonViewDelegate>
@property (nonatomic, strong) YZKSearchBarButtonView *searchBar;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *resultList;
@property (nonatomic, copy) NSMutableArray *titleList;
/** 数据 抓取 */
@property (nonatomic, strong) YZKCommonDataController *dataController;
/** 收文管理 数据 抓取 */
@property (nonatomic, strong) YZKReceManageDataController *receManaDataController;
/** 站内信 数据 抓取*/
@property (nonatomic, strong) YZKStationLetterDataController *stationLetterDataController;
/** 知识库 数据 抓取*/
@property (nonatomic, strong) YZKKnowledgeBaseDataController *knowBaseDataController;
/** 网络硬盘 数据 抓取*/
@property (nonatomic, strong) YZKNetworkDiskDataController *networkDiskDataController;
/** 备忘录 数据 抓取*/
@property (nonatomic, strong) YZKNoteDataController *noteDataController;

@end

@implementation YZKSearchViewController


#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"搜索";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self turnToTitleList];
    [self setupUI];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    for (UISearchBar *searchBar in self.searchBar.subviews) {
        [searchBar becomeFirstResponder];
    }
}

#pragma mark - UITableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.resultList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if ([self cellStyleAccordModel:self.sourceDataList] == YZKCellCommon) {
//        YZKCommonCell *cell = (YZKCommonCell *)[YZKStyleManager initCellWithCellType:YZKCellCommon forTableView:tableView];
//        cell.model = self.resultList[indexPath.row];
//        return cell;
//    }else{
//        UITableViewCell *cell = [YZKStyleManager initCellWithCellType:YZKCellDefault forTableView:tableView];
//        return cell;
//    }
    if (self.searchType == importNews || self.searchType ==briefing || self.searchType ==annoucement | self.searchType ==notice) {
        YZKCommonCell *cell = (YZKCommonCell *)[YZKStyleManager initCellWithCellType:YZKCellCommon forTableView:tableView];
        cell.model = self.resultList[indexPath.row];
        return cell;
    }else if (self.searchType == receiveManage){
        YZKCommonCell *cell = (YZKCommonCell *)[YZKStyleManager initCellWithCellType:YZKCellCommon forTableView:tableView];
        cell.receiveModel = self.resultList[indexPath.row];
        return cell;
    }else if (self.searchType == receiveStationLetter){
        YZKReserveCell *cell = (YZKReserveCell *)[YZKStyleManager initCellWithCellType:YZKCellReserve forTableView:tableView];
        cell.receivedModel = self.resultList[indexPath.row];
        return cell;
    }else if (self.searchType == postStationLetter){
         YZKCommonCell *cell = (YZKCommonCell *)[YZKStyleManager initCellWithCellType:YZKCellCommon forTableView:tableView];
        cell.letterPostedModel = self.resultList[indexPath.row];
        return cell;
    }else if (self.searchType == knowledgeBase){
        UITableViewCell *cell = [YZKStyleManager initCellWithCellType:YZKCellSubtitle forTableView:tableView];
        YZKContentModel *model = self.resultList[indexPath.row];
        cell.textLabel.text = model.srcFileName;
        return cell;
    }else if (self.searchType == networkDisk){
        YZKReserveCell *cell = (YZKReserveCell *)[YZKStyleManager initCellWithCellType:YZKCellReserve forTableView:tableView];
        cell.networkDiskModel = self.resultList[indexPath.row];
        return cell;
    }else if (self.searchType == note){
        YZKNoteCell *cell = (YZKNoteCell *)[YZKStyleManager initCellWithCellType:YZKCellNote forTableView:tableView];
        cell.model = self.resultList[indexPath.row];
        return cell;
    }else{
        UITableViewCell *cell = (YZKCommonCell *)[YZKStyleManager initCellWithCellType:YZKCellCommon forTableView:tableView];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.searchType == receiveStationLetter) {
        return myheight(180);
    }else if(self.searchType == networkDisk) {
        return myheight(170);
    }else if (self.searchType == note){
        return myheight(186);
    }else{
        return myheight(126);
    }
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (self.searchType) {
        case importNews:
        {
            YZKImportNewsDetailViewController *importVc = [[YZKImportNewsDetailViewController alloc] init];
            importVc.url = IMPORTNEWSDETAIL;
            YZKAnnounceModel *model = self.resultList[indexPath.row];
            NSMutableDictionary *param = [NSMutableDictionary dictionaryWithCapacity:0];
            param[@"loginId"] = [[NSUserDefaults standardUserDefaults] objectForKey:LOGINID];
            param[@"id"] = model.id;
            importVc.param = param;
            [self.navigationController pushViewController:importVc animated:YES];
        }
            break;
        case briefing:
        {
            YZKImportNewsDetailViewController *importVc = [[YZKImportNewsDetailViewController alloc] init];
            importVc.url = IMPORTNEWSDETAIL;
            YZKAnnounceModel *model = self.resultList[indexPath.row];
            NSMutableDictionary *param = [NSMutableDictionary dictionaryWithCapacity:0];
            param[@"loginId"] = [[NSUserDefaults standardUserDefaults] objectForKey:LOGINID];
            param[@"id"] = model.id;
            importVc.param = param;
            [self.navigationController pushViewController:importVc animated:YES];
        }
            break;
        case annoucement:
        {
            YZKImportNewsDetailViewController *importVc = [[YZKImportNewsDetailViewController alloc] init];
            importVc.url = NOTICEDETAIL;
            YZKAnnounceModel *model = self.resultList[indexPath.row];
            NSMutableDictionary *param = [NSMutableDictionary dictionaryWithCapacity:0];
            param[@"loginId"] = [[NSUserDefaults standardUserDefaults] objectForKey:LOGINID];
            param[@"id"] = model.id;
            importVc.param = param;
            [self.navigationController pushViewController:importVc animated:YES];
        }
            break;
        case notice:
        {
            YZKImportNewsDetailViewController *importVc = [[YZKImportNewsDetailViewController alloc] init];
            importVc.url = NOTICEDETAIL;
            YZKAnnounceModel *model = self.resultList[indexPath.row];
            NSMutableDictionary *param = [NSMutableDictionary dictionaryWithCapacity:0];
            param[@"loginId"] = [[NSUserDefaults standardUserDefaults] objectForKey:LOGINID];
            param[@"id"] = model.id;
            importVc.param = param;
            [self.navigationController pushViewController:importVc animated:YES];
        }
            break;
        case receiveManage:
        {
            YZKReceiveManageDetailViewController *importVc = [[YZKReceiveManageDetailViewController alloc] init];
            importVc.url = RECEVIEMAGAGEDETAIL;
            YZKAnnounceModel *model = self.resultList[indexPath.row];
            NSMutableDictionary *param = [NSMutableDictionary dictionaryWithCapacity:0];
            param[@"loginId"] = [[NSUserDefaults standardUserDefaults] objectForKey:LOGINID];
            param[@"id"] = model.id;
            importVc.param = param;
            [self.navigationController pushViewController:importVc animated:YES];
        }
            break;
        case receiveStationLetter:
        {
            YZKStationLetterReceiveModel *model = self.resultList[indexPath.row];
            YZKStationLetterDetailViewController *letterVc = [[YZKStationLetterDetailViewController alloc] init];
            letterVc.receiveModel = model;
            [self.navigationController pushViewController:letterVc animated:YES];
        }
            break;
        case postStationLetter:
        {
            YZKStationLetterPostedModel *model = self.resultList[indexPath.row];
            YZKStationLetterDetailViewController *letterVc = [[YZKStationLetterDetailViewController alloc] init];
            letterVc.postedModel = model;
            [self.navigationController pushViewController:letterVc animated:YES];
        }
            break;
        case note:
        {
            YZKNoteModel *model = self.resultList[indexPath.row];
            YZKNoteDetailViewController *noteVc = [[YZKNoteDetailViewController alloc] init];
            noteVc.model = model;
            [self.navigationController pushViewController:noteVc animated:YES];
        }
            break;
        case networkDisk:
        {
            YZKNetworkDiskModel *model = self.resultList[indexPath.row];
            YZKNetDiskDetailViewController *detailVc = [[YZKNetDiskDetailViewController alloc] init];
            detailVc.model = model;
            [self.navigationController pushViewController:detailVc animated:YES];
        }
            break;
    }
}

#pragma mark - UISearchBar Delegate

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    NSLog(@"%s", __FUNCTION__);
}

#pragma mark - UISearchBarButtonView Delegate

- (void)searchBarView:(YZKSearchBarButtonView *)searchView withSearchTitle:(NSString *)title searchBtnDidClick:(UIButton *)searchBtn{
//    [self.dataController searchDataWithTitle:title requestType:self.requestType success:^{
//        self.resultList = self.dataController.dataList;
//        [self.tableView reloadData];
//    }];
    [self.resultList removeAllObjects];
    [self searchDataWithTitle:title];
}



#pragma mark - private methods
/**
importNews             = 0,
briefing                    =  1,
annoucement           = 2,
notice                      = 3,
receiveManage         = 4,
receiveStationLetter = 5,
postStationLetter     = 6,
knowledgeBase        = 7,
networkDisk             = 8,
note                         = 9
*/

- (void)searchDataWithTitle:(NSString *)title{
    switch (self.searchType) {
        case importNews:
        {
            NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
            params[@"title"] = title;
            [self.dataController requestDataWithType:importNewType params:params success:^{
                if (self.dataController.dataList.count > 0) {
                    self.resultList = [NSMutableArray arrayWithArray:self.dataController.dataList];
                    [self.tableView reloadData];
                }
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                NSLog(@"%@",error);
            }];
            [self.tableView reloadData];
        }
            break;
        case briefing:
        {
            NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
            params[@"title"] = title;
            [self.dataController requestDataWithType:briefingType params:params success:^{
                if (self.dataController.dataList.count > 0) {
                    self.resultList = [NSMutableArray arrayWithArray:self.dataController.dataList];
                    [self.tableView reloadData];
                }
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                NSLog(@"%@",error);
            }];
            [self.tableView reloadData];
        }
            break;
        case annoucement:
        {
            NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
            params[@"title"] = title;
            [self.dataController requestDataWithType:announcementType params:params success:^{
                if (self.dataController.dataList.count > 0) {
                    self.resultList = [NSMutableArray arrayWithArray:self.dataController.dataList];
                    [self.tableView reloadData];
                }
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                NSLog(@"%@",error);
            }];
            [self.tableView reloadData];
        }
            break;
        case notice:
        {
            NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
            params[@"title"] = title;
            [self.dataController requestDataWithType:noticeType params:params success:^{
                if (self.dataController.dataList.count > 0) {
                    self.resultList = [NSMutableArray arrayWithArray:self.dataController.dataList];
                    [self.tableView reloadData];
                }
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
            }];
            [self.tableView reloadData];
        }
            break;
        case receiveManage:
        {
            NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
            params[@"title"] = title;
            [self.receManaDataController requestDataWithParams:params success:^{
                if (self.receManaDataController.dataList.count > 0) {
                    self.resultList = [NSMutableArray arrayWithArray:self.receManaDataController.dataList];
                    [self.tableView reloadData];
                }
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                NSLog(@"%@",error);
            }];
            [self.tableView reloadData];
        }
            break;
        case receiveStationLetter:
        {
            NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
            params[LOGINID] = [[NSUserDefaults standardUserDefaults] objectForKey:LOGINID];
            params[@"title"] = title;
            [self.stationLetterDataController requestDataForLetterType:Received params:params success:^{
                if (self.stationLetterDataController.dataList.count > 0) {
                    self.resultList = [NSMutableArray arrayWithArray:self.stationLetterDataController.dataList];
                    [self.tableView reloadData];
                }
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
            }];
            [self.tableView reloadData];
        }
            break;
        case postStationLetter:
        {
            NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
            params[LOGINID] = [[NSUserDefaults standardUserDefaults] objectForKey:LOGINID];
            params[@"title"] = title;
            [self.stationLetterDataController requestDataForLetterType:Posted params:params success:^{
                if (self.stationLetterDataController.dataList.count > 0) {
                    self.resultList = [NSMutableArray arrayWithArray:self.stationLetterDataController.dataList];
                    [self.tableView reloadData];
                }
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
            }];
            [self.tableView reloadData];
        }
            break;
        case knowledgeBase:
        {
            NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
            params[@"title"] = title;
            params[LOGINID] = [[NSUserDefaults standardUserDefaults] objectForKey:LOGINID];
            [self.knowBaseDataController requestDataForAllBaseWithParams:params success:^{
                if (self.knowBaseDataController.dataList.count > 0) {
                    self.resultList = [NSMutableArray arrayWithArray:self.knowBaseDataController.dataList];
                    [self.tableView reloadData];
                }
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
            }];
            [self.tableView reloadData];
        }
            break;
        case networkDisk:
        {
            if (self.fileType == shareFileType) {
                NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
                params[@"title"] = title;
                params[LOGINID] = [[NSUserDefaults standardUserDefaults] objectForKey:LOGINID];
                [self.networkDiskDataController requestDataForFileType:shareFileType params:params success:^{
                    if (self.networkDiskDataController.dataList.count > 0) {
                        self.resultList = [NSMutableArray arrayWithArray:self.networkDiskDataController.dataList];
                        [self.tableView reloadData];
                    }
                } failure:^(NSURLSessionDataTask *task, NSError *error) {
                }];
                [self.tableView reloadData];
            }else if(self.fileType == mineFileType){
                NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
                params[@"title"] = title;
                params[LOGINID] = [[NSUserDefaults standardUserDefaults] objectForKey:LOGINID];
                [self.networkDiskDataController requestDataForFileType:mineFileType params:params success:^{
                    if (self.networkDiskDataController.dataList.count > 0) {
                        self.resultList = [NSMutableArray arrayWithArray:self.networkDiskDataController.dataList];
                        [self.tableView reloadData];
                    }
                } failure:^(NSURLSessionDataTask *task, NSError *error) {
                }];
                [self.tableView reloadData];
            }
        }
            break;
        case note:
        {
            NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
            params[LOGINID] = [[NSUserDefaults standardUserDefaults] objectForKey:LOGINID];
            params[@"title"] = title;
            [self.noteDataController requestForAllNoteWithParams:params success:^{
                if (self.noteDataController.dataList.count > 0) {
                    self.resultList = [NSMutableArray arrayWithArray:self.noteDataController.dataList];
                    [self.tableView reloadData];
                }
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
            }];
            [self.tableView reloadData];
        }
            break;
        default:
            break;
    }
}

- (void)turnToTitleList{
    for (id model in self.sourceDataList) {
        if ([model isKindOfClass:[YZKAnnounceModel class]]) {
            YZKAnnounceModel *contentModel = model;
            [self.titleList addObject:contentModel.title];
        }
    }
}

- (void)setupUI{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.searchBar];
    [self.view addSubview:self.tableView];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"navigationbar_left-arrow" highImage:@"navigationbar_left-arrow"];
}

#pragma mark - event response

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

/** 根据 外界传进来的模型数组 返回需要展示的 cell */
- (YZKCellStyle)cellStyleAccordModel:(NSArray *)modelArray{
    YZKCellStyle cellStyle = YZKCellDefault;
    for (id model in self.sourceDataList) {
        if ([model isKindOfClass:[YZKAnnounceModel class]]) {
            cellStyle = YZKCellCommon;
        }else if ([model isKindOfClass:[YZKContentModel class]]){
            cellStyle = YZKCellSingleLine;
        }else if ([model isKindOfClass:[YZKReserveModel class]]){
            cellStyle = YZKCellReserve;
        }else{
            cellStyle = YZKCellDefault;
        }
    }
    return cellStyle;
}


#pragma mark - getter and setter

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, myheight(88), SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        UIView *whiteView = [UIView new];
        whiteView.backgroundColor = [UIColor whiteColor];
//        _tableView.estimatedRowHeight = myheight(126);
//        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.tableFooterView = whiteView;
    }
    return _tableView;
}

//- (NSMutableArray *)resultList{
//    if (_resultList == nil) {
//        _resultList = [NSMutableArray arrayWithCapacity:0];
//    }
//    return _resultList;
//}

- (NSMutableArray *)titleList{
    if (_titleList == nil) {
        _titleList = [NSMutableArray arrayWithCapacity:0];
    }
    return _titleList;
}

- (YZKSearchBarButtonView *)searchBar{
    if (_searchBar == nil) {
        _searchBar = [[YZKSearchBarButtonView alloc] init];
        _searchBar.frame = CGRectMake(0, 0, SCREEN_WIDTH, myheight(88));
        _searchBar.delegate = self;
    }
    return _searchBar;
}

- (YZKCommonDataController *)dataController{
    if (_dataController == nil) {
        _dataController = [[YZKCommonDataController alloc] init];
    }
    return _dataController;
}

- (YZKReceManageDataController *)receManaDataController{
    if (_receManaDataController == nil) {
        _receManaDataController = [[YZKReceManageDataController alloc] init];
    }
    return _receManaDataController;
}

- (YZKStationLetterDataController *)stationLetterDataController{
    if (_stationLetterDataController == nil) {
        _stationLetterDataController = [[YZKStationLetterDataController alloc] init];
    }
    return _stationLetterDataController;
}

- (YZKKnowledgeBaseDataController *)knowBaseDataController{
    if (_knowBaseDataController == nil) {
        _knowBaseDataController = [[YZKKnowledgeBaseDataController alloc] init];
    }
    return _knowBaseDataController;
}

- (YZKNetworkDiskDataController *)networkDiskDataController{
    if (_networkDiskDataController == nil) {
        _networkDiskDataController = [[YZKNetworkDiskDataController alloc] init];
    }
    return _networkDiskDataController;
}

- (YZKNoteDataController *)noteDataController{
    if (_noteDataController == nil) {
        _noteDataController = [[YZKNoteDataController alloc] init];
    }
    return _noteDataController;
}
@end

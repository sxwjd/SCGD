//
//  ApplicationViewController.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/14.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "ApplicationViewController.h"
#import "YZKApplicationModel.h"
#import "YZKApplicationCollectionApplicationCell.h"
#import "YZKAnnouncementManageViewController.h"
#import "YZKImportNewsViewController.h"
#import "YZKBriefingViewController.h"
#import "YZKNoticeViewController.h"
#import "YZKReceiveManageViewController.h"
#import "YZKMeetReserveViewController.h"
#import "YZKStationLetterReceivedViewController.h"
#import "YZKNetworkDiskViewController.h"
#import "YZKKnowledgeBaseViewController.h"
#import "YZKIndividualScheduleViewController.h"
#import "YZKNoteViewController.h"
#import "YZKTaskScheduleViewController.h"

@interface ApplicationViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *models;

@end

static NSString *const collectionCellReuseId = @"collectionCellReuseId";
@implementation ApplicationViewController


#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"应用";
    [self setUpData];
    [self setUpUI];
    
}

#pragma mark - UICollectionView DataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.models.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YZKApplicationCollectionApplicationCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCellReuseId forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.model = self.models[indexPath.item];
    return cell;
}

#pragma mark - UICollectionView Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.item) {
        case 0:
        {
            YZKImportNewsViewController *importNewVc = [[YZKImportNewsViewController alloc] init];
            [self.navigationController pushViewController:importNewVc animated:YES];
        }
            break;
        case 1:
        {
            YZKBriefingViewController *briefingVc = [[YZKBriefingViewController alloc] init];
            [self.navigationController pushViewController:briefingVc animated:YES];
        }
            break;
        case 2:
        {
            YZKNoticeViewController *notiVc = [[YZKNoticeViewController alloc] init];
            [self.navigationController pushViewController:notiVc animated:YES];
        }
            break;
        case 3:{
            YZKAnnouncementManageViewController *announceVc = [[YZKAnnouncementManageViewController alloc] init];
            [self.navigationController pushViewController:announceVc animated:YES];
        }
            break;
        case 4:
        {
            
        }
            break;
        case 5:
        {
            YZKReceiveManageViewController *receiveVc = [[YZKReceiveManageViewController alloc] init];
            [self.navigationController pushViewController:receiveVc animated:YES];
        }
            break;
        case 6:
        {
            YZKMeetReserveViewController *meetReserveVc = [[YZKMeetReserveViewController alloc] init];
            [self.navigationController pushViewController:meetReserveVc animated:YES];
        }
            break;
        case 7:
        {
            YZKStationLetterReceivedViewController *letterVc = [[YZKStationLetterReceivedViewController alloc] init];
            [self.navigationController pushViewController:letterVc animated:YES];
        }
            break;
        case 8:
        {
            YZKKnowledgeBaseViewController *baseVc = [[YZKKnowledgeBaseViewController alloc] init];
            [self.navigationController pushViewController:baseVc animated:YES];
        }
            break;
        case 9:
        {
            YZKNetworkDiskViewController *diskVc = [[YZKNetworkDiskViewController alloc] init];
            [self.navigationController pushViewController:diskVc animated:YES];
        }
            break;
        case 10:
        {
            YZKIndividualScheduleViewController *scheduleVc = [[YZKIndividualScheduleViewController alloc] init];
            [self.navigationController pushViewController:scheduleVc animated:YES];
        }
            break;
        case 11:
        {
            YZKTaskScheduleViewController *taskVc = [[YZKTaskScheduleViewController alloc] init];
            [self.navigationController pushViewController:taskVc animated:YES];
        }
            break;
        case 12:
        {
            YZKNoteViewController *noteVc = [[YZKNoteViewController alloc] init];
            [self.navigationController pushViewController:noteVc animated:YES];
        }
            break;
        default:
            break;
    }
}

#pragma mark - private methods

- (void)setUpUI{
    [self.view addSubview:self.collectionView];
    
    self.collectionView.contentInset = UIEdgeInsetsMake(9, 10, 0, 10);
}

- (void)setUpData{
    NSArray *dataList = @[@{@"iconName":@"application_importantnew", @"text":@"要情"}, @{@"iconName":@"application_briefing", @"text":@"简报"}, @{@"iconName":@"application_information", @"text":@"通知"}, @{@"iconName":@"application_announcement", @"text":@"公告"}, @{@"iconName":@"application_postmanage", @"text":@"发文管理"},@{@"iconName":@"application_receivemanage", @"text":@"收文管理"}, @{@"iconName":@"application_reservemeeting", @"text":@"会议室预约"}, @{@"iconName":@"application_stationletter", @"text":@"站内信"} ,@{@"iconName":@"application_knowledgebase", @"text":@"知识库"}, @{@"iconName":@"application_networkdisk", @"text":@"网络硬盘"}, @{@"iconName":@"application_individualschedule", @"text":@"个人日程"},@{@"iconName":@"application_jobschedule", @"text":@"工作日程"}, @{@"iconName":@"Application_note", @"text":@"备忘录"},@{@"iconName":@"application_add", @"text":@""}];
    for (NSDictionary *dict in dataList) {
        YZKApplicationModel *model = [YZKApplicationModel modelWithDict:dict];
        [self.models addObject:model];
    }
}

#pragma mark - getter and setter
- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        flowLayout.itemSize = CGSizeMake((SCREEN_WIDTH - 5 * 10) / 4, (SCREEN_WIDTH - 5 * 10) / 4);
        flowLayout.minimumLineSpacing = 10;
        flowLayout.minimumInteritemSpacing = 10;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
        [_collectionView registerClass:[YZKApplicationCollectionApplicationCell class] forCellWithReuseIdentifier:collectionCellReuseId];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.scrollEnabled = NO;
        _collectionView.backgroundColor = UIColorRGB(0xf8f8f8);
    }
    return _collectionView;
}

- (NSMutableArray *)models{
    if (_models == nil) {
        _models = [NSMutableArray arrayWithCapacity:0];
    }
    return _models;
}


@end

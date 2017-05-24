//
//  MessageViewController.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/14.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "MessageViewController.h"
#import "WorkViewCell.h"
#import "YZKSearchBarView.h"

@interface MessageViewController ()<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>
/**
 *  collectionView
 */
@property (nonatomic, strong) UICollectionView *collectionView;
/**
 *  searchView
 */
@property (nonatomic, strong) YZKSearchBarView *searchView;
@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // Do any additional setup after loading the view.
    [self setUpSubView];
    [self layoutSubView];

}
- (void)setUpSubView
{
    //nav
    self.navigationItem.title = @"消息";
    
    //searchView
    _searchView = [[YZKSearchBarView alloc] init];
    [self.view addSubview:_searchView];
    
    //collectionview
    //确定是水平滚动，还是垂直滚动
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    _collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:flowLayout];
    _collectionView.backgroundColor = mainBackgroundColor;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [_collectionView setBackgroundColor:[UIColor clearColor]];
    //注册Cell，必须要有
    [_collectionView registerClass:[WorkViewCell class] forCellWithReuseIdentifier:@"work"];
    [self.view addSubview:_collectionView];
    
    
}
- (void)layoutSubView
{
    [_searchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.height.mas_equalTo(myheight(86));
    }];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(_searchView.mas_bottom);
        make.bottom.equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark --UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"work";
    WorkViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.titleStr = @"添加";
    cell.iconStr = @"message_add";
    return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = (SCREEN_WIDTH - 30) / 2.0;
    return CGSizeMake(width, width);
}
//定义每个UICollectionView 的 margin
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
   
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}




@end

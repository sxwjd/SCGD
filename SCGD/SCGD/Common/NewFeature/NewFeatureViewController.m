//
//  NewFeatureViewController.m
//  BianMinYiLiao
//
//  Created by 佳冬  on 15/12/3.
//  Copyright © 2015年 YZK. All rights reserved.
//

#import "NewFeatureViewController.h"
#import "YZKTabBarController.h"
@interface NewFeatureViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSArray *imageArr;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIButton *btn;

@end

@implementation NewFeatureViewController
#pragma mark --life cycyle
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.btn.frame = CGRectMake((SCREEN_WIDTH - 100) / 2.0, SCREEN_HEIGHT - 75, 100, 36);
    self.pageControl.frame = CGRectMake((SCREEN_WIDTH - 100) / 2.0, SCREEN_HEIGHT - 20, 100, 20);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    隐藏状态栏
     [[UIApplication sharedApplication]setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
    
//    [self.view addSubview:self.btn];
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.pageControl];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark --delegate
#pragma mark --UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 根据scrollView的滚动位置决定pageControl显示第几页
    CGFloat scrollW = scrollView.frame.size.width;
    int page = (scrollView.contentOffset.x + scrollW * 0.5) / scrollW;
    self.pageControl.currentPage = page;
}

//- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
//{
//    if (scrollView.contentOffset.x > SCREEN_WIDTH * (self.imageArr.count - 1)) {
//        
//        [self welcome];
//    }
//}





#pragma mark --event response
- (void)welcome
{
     [[UIApplication sharedApplication]setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    
    YZKTabBarController *tab = [[YZKTabBarController alloc] init];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = tab;

}

#pragma mark --getter && setter
- (UIButton *)btn
{
    if (_btn == nil) {
        
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.backgroundColor = mainColor;
        [_btn setTitle:@"立即体验" forState:UIControlStateNormal];
        _btn.titleLabel.font = [UIFont systemFontOfSize:16];
        _btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_btn setTitleColor:UIColorRGB(0xffffff) forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(welcome) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _btn;
}

- (UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        
        _scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * self.imageArr.count, SCREEN_HEIGHT);
        _scrollView.pagingEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
        
        for (int i = 0; i < self.imageArr.count; i++) {
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
            imageView.backgroundColor = [UIColor redColor];
            imageView.userInteractionEnabled = YES;
            
#pragma mark --测试
            
//            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//            label.text = self.imageArr[i];
//            
//            [imageView addSubview:label];
            
            imageView.image = [UIImage imageNamed:self.imageArr[i]];
            
            if (i == self.imageArr.count - 1) {
                
                [imageView addSubview:self.btn];
            }
            
            [_scrollView addSubview:imageView];
        }
    }
    return _scrollView;
}
- (NSArray *)imageArr
{
    if (_imageArr == nil) {
        
        _imageArr = [NSArray array];
        _imageArr = @[@"",@"", @"", @"", @""];
    }
    return _imageArr;
}

-(UIPageControl *)pageControl{
    if (_pageControl == nil) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.currentPageIndicatorTintColor = mainColor;
        _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.userInteractionEnabled = NO;
        [_pageControl setNumberOfPages:self.imageArr.count];
    }
    return _pageControl;
}
@end

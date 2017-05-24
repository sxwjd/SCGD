//
//  ADView.m
//  轮播
//
//  Created by 佳冬  on 16/5/5.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "ADView.h"
#import "Banner.h"

#define pageSize 16
#define CurrentPageColor mainColor
#define PageColor  [UIColor whiteColor]
#define ScrollWidth self.frame.size.width
#define ScrollHeight self.frame.size.height
@interface ADView()<UIScrollViewDelegate>
@property (nonatomic, copy) NSArray *imageArray;
@end
@implementation ADView
{
    __weak UIImageView *_leftImageView,*_centerImageView,*_rightImageView;
    __weak UIScrollView *_scrollView;
    __weak UIPageControl *_PageControl;

    
    NSTimer *_timer;
//    当前显示的是第几个
    NSInteger _currentIndex;
//    图片个数
    NSInteger _MaxImageCount;
//    是否是加载网络图片
    BOOL _isNetworkImage;
}
#pragma mark --加载本地图片
- (instancetype)initWithFrame:(CGRect)frame WithLoacalImages:(NSArray *)imageArray
{
    if (imageArray.count < 2) {
        if (imageArray.count == 1) {
            if (self = [super initWithFrame:frame]) {
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
                imageView.image = [UIImage imageNamed:imageArray[0]];
                _currentIndex = 0;
                imageView.userInteractionEnabled = YES;
                [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewDidTap)]];
                [self addSubview:imageView];
            }
            return self;
        }
        return nil;
    }
    if (self = [super initWithFrame:frame]) {
        _isNetworkImage = NO;
//        创建滚动视图
        [self createScrollView];
//        设置本地图片数据源
        [self setImageArray:imageArray];
//        设置图片数量
        [self setMaxImageCount:_imageArray.count];
    }
    return self;
}
#pragma mark --加载网络图片
-(instancetype)initWithFrame:(CGRect)frame WithNetImages:(NSArray *)imageArray
{
    if (imageArray.count < 2 ) {
        if (imageArray.count == 1) {
            if (self = [super initWithFrame:frame]) {
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
                Banner *banner = imageArray[0];
                [imageView sd_setImageWithURL:[NSURL URLWithString:banner.picDir] placeholderImage:_placeholderImage];
                _currentIndex = 0;
                imageView.userInteractionEnabled = YES;
                [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewDidTap)]];
                [self addSubview:imageView];
            }
            return self;
        }
        return nil;
    }
    if (self = [super initWithFrame:frame]) {
        _isNetworkImage = YES;
//        创建滚动视图
        [self createScrollView];
//        设置本地图片数据源
        [self setImageArray:imageArray];
//        设置图片数量
        [self setMaxImageCount:_imageArray.count];
        
    }
    
    return self;
}
#pragma mark --设置数量
- (void)setMaxImageCount:(NSInteger)MaxImageCount
{
    _MaxImageCount = MaxImageCount;
//    复用imageView的初始化
    [self initImageView];
//    创建pageControl
    [self createPageControl];
//    创建定时器
    [self setUpTimer];
//    初始化图片位置
    [self changeImageLeft:_MaxImageCount - 1 center:0 right:1];
}
#pragma mark -- 给复用的imageview设置图片
- (void)changeImageLeft:(NSInteger)LeftIndex center:(NSInteger)centerIndex right:(NSInteger)rightIndex
{
    if (_isNetworkImage) {
        Banner *left = _imageArray[LeftIndex];
        Banner *center = _imageArray[centerIndex];
        Banner *right = _imageArray[rightIndex];
        [_leftImageView sd_setImageWithURL:[NSURL URLWithString:left.picDir] placeholderImage:_placeholderImage];
        [_centerImageView sd_setImageWithURL:[NSURL URLWithString:center.picDir] placeholderImage:_placeholderImage];
        [_rightImageView sd_setImageWithURL:[NSURL URLWithString:right.picDir] placeholderImage:_placeholderImage];
    }else
    {
        _leftImageView.image = _imageArray[LeftIndex];
        _centerImageView.image = _imageArray[centerIndex];
        _rightImageView.image = _imageArray[rightIndex];
    }
    [_scrollView setContentOffset:CGPointMake(ScrollWidth, 0)];
}
#pragma mark --定时器
- (void)setUpTimer
{
    if (_AutoScrollDelay < 0.5) return;
    _timer = [NSTimer timerWithTimeInterval:_AutoScrollDelay target:self selector:@selector(scroll) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}
- (void)scroll
{
    [_scrollView setContentOffset:CGPointMake(_scrollView.contentOffset.x + ScrollWidth, 0) animated:YES];
}
#pragma mark --指示器
- (void)createPageControl
{
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, ScrollHeight - pageSize, ScrollWidth, 8)];
    
//    设置页面指示器颜色
    pageControl.pageIndicatorTintColor = PageColor;
//    设置当前页面指示器颜色
    pageControl.currentPageIndicatorTintColor = CurrentPageColor;
    pageControl.numberOfPages = _MaxImageCount;
    pageControl.currentPage = 0;
    [self addSubview:pageControl];
    _PageControl = pageControl;
}
#pragma mark --初始化复用的三张imageView
- (void)initImageView
{
    UIImageView *leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScrollWidth,ScrollHeight)];
    UIImageView *centerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(ScrollWidth, 0, ScrollWidth, ScrollHeight)];
    UIImageView *rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(ScrollWidth * 2, 0, ScrollWidth, ScrollHeight)];
    centerImageView.userInteractionEnabled = YES;
    [centerImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewDidTap)]];
    
    [_scrollView addSubview:leftImageView];
    [_scrollView addSubview:centerImageView];
    [_scrollView addSubview:rightImageView];
    
    _leftImageView = leftImageView;
    _centerImageView = centerImageView;
    _rightImageView = rightImageView;
}
#pragma mark --点击事件
- (void)imageViewDidTap
{
    NSLog(@"%ld", _currentIndex);
    if (self.delegate && [self.delegate respondsToSelector:@selector(adView:didSelectedWithIndex:)]) {
        [self.delegate adView:self didSelectedWithIndex:_currentIndex];
    }
}
#pragma mark --创建滚动视图
- (void)createScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    [self addSubview:scrollView];
    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
//    复用 创建三个imgeview
    scrollView.contentSize = CGSizeMake(ScrollWidth * 3, 0);
//    设置滚动延时时间
    _AutoScrollDelay = 0;
//    开始显示的是第一个  前一个是最后一个 后一个是第二个
    _currentIndex = 0;
    
    _scrollView = scrollView;
}

#pragma mark --设置图片数据源
- (void)setImageArray:(NSArray *)imageArray
{
    if (_isNetworkImage) {
        _imageArray = [imageArray copy];
    }else
    {
        NSMutableArray *localimageArray = [NSMutableArray arrayWithCapacity:imageArray.count];
        for (NSString *imageName in imageArray) {
            [localimageArray addObject:[UIImage imageNamed:imageName]];
        }
        _imageArray = [localimageArray copy];
    }
}

#pragma mark --UIScrollViewDelegate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self setUpTimer];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
}
- (void)removeTimer
{
    if (_timer == nil) return;
    [_timer invalidate];
    _timer = nil;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    开始滚动 判断位置 然后替换复用的三张图
    [self changeImageWithOffset:scrollView.contentOffset.x];
}
- (void)changeImageWithOffset:(CGFloat)offsetX
{
    if (offsetX >= ScrollWidth * 2) {
        _currentIndex ++;
        if (_currentIndex == _MaxImageCount - 1) {
            [self changeImageLeft:_currentIndex - 1 center:_currentIndex right:0];
        }else if (_currentIndex == _MaxImageCount)
        {
            _currentIndex = 0;
            [self changeImageLeft:_MaxImageCount - 1 center:0 right:1];
        }else
        {
            [self changeImageLeft:_currentIndex - 1 center:_currentIndex  right:_currentIndex + 1];
        }
        _PageControl.currentPage = _currentIndex;
    }
    
    if (offsetX <= 0) {
        _currentIndex--;
        if (_currentIndex == 0) {
            [self changeImageLeft:_MaxImageCount - 1 center:0 right:1];
        }else if (_currentIndex == -1)
        {
            _currentIndex = _MaxImageCount - 1;
            [self changeImageLeft:_currentIndex - 1 center:_currentIndex right:0];
        }else
        {
            [self changeImageLeft:_currentIndex - 1 center:_currentIndex right:_currentIndex + 1];
        }
        
        _PageControl.currentPage = _currentIndex;
    }
}
- (void)dealloc
{
    [self removeTimer];
}
#pragma mark --设置时间间隔
- (void)setAutoScrollDelay:(NSTimeInterval)AutoScrollDelay
{
    _AutoScrollDelay = AutoScrollDelay;
    
    [self removeTimer];
    [self setUpTimer];
}
@end

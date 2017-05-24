//
//  BannerHeadView.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/18.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "BannerHeadView.h"
#import "ADView.h"
@interface BannerHeadView()
{
    NSArray *_bannerData;
}
/**
 *  adView
 */
@property (nonatomic, strong) ADView *adView;
/**
 *  头条
 */
@property (nonatomic, strong) UIImageView *leftImage;
/**
 *  content
 */
@property (nonatomic, strong) UILabel *content;
/**
 *  分割线
 */
@property (nonatomic, strong) UIView *line;
/**
 *  title
 */
@property (nonatomic, strong) HomeHeadView *headView;
@end
@implementation BannerHeadView
-(instancetype)initWithBannerData:(NSArray *)bannerData
{
    if (self = [super init]) {
        self.backgroundColor  = [UIColor whiteColor];
        _bannerData = bannerData;
        [self loaSubView];
    }
    return self;
}
- (void)loaSubView
{
    if (_bannerData.count == 0) {
        _adView = [[ADView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300 / IPHONE6_HEIGHT * SCREEN_HEIGHT) WithLoacalImages:@[@"home_banaer"]];
        _adView.AutoScrollDelay = 2.0;
    }else
    {
        _adView = [[ADView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300 / IPHONE6_HEIGHT * SCREEN_HEIGHT) WithNetImages:_bannerData];
        _adView.AutoScrollDelay = 2.0;
    }
    [self addSubview:_adView];
    
    
    _leftImage = [[UIImageView alloc] init];
    _leftImage.image = [UIImage imageNamed:@"home_top"];
    [self addSubview:_leftImage];


    _content = [[UILabel alloc] init];
    _content.font = [UIFont systemFontOfSize:14];
    _content.textColor = mainColor;
    [self addSubview:_content];
    _content.text = @"四川省新闻出版广电局庆祝中国共产党...";
    [_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(300 / IPHONE6_HEIGHT * SCREEN_HEIGHT);
        make.right.equalTo(self).offset(-102 / IPHONE6_WIDTH * SCREEN_WIDTH);
        make.height.equalTo(@(80 / IPHONE6_HEIGHT * SCREEN_HEIGHT));
    }];
    
    [_leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_content.mas_left).offset(-22 / IPHONE6_WIDTH * SCREEN_WIDTH);
        make.centerY.equalTo(_content);
        make.left.equalTo(self).offset(46 / IPHONE6_WIDTH * SCREEN_WIDTH);
    }];

//    _line = [[UIView alloc] init];
//    _line.backgroundColor = lineColor;
//    [self addSubview:_line];
//    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(_content.mas_bottom);
//        make.left.equalTo(self);
//        make.right.equalTo(self);
//        make.height.equalTo(@1);
//    }];

    _headView = [[HomeHeadView alloc] init];
    [self addSubview:_headView];
    [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_content.mas_bottom);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
    }];
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    _headView.title = _title;;
}
- (void)setDelegate:(id<HomeHeadViewDelegate>)delegate
{
    _delegate = delegate;
    _headView.delegate = _delegate;
}
@end

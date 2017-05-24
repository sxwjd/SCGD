//
//  YZKPresentationViewController.m
//  SCGD
//
//  Created by Lizeyu on 16/10/17.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKPresentationViewController.h"

@interface YZKPresentationViewController () 
@property (nonatomic, strong) UIView *bgView;
@end

@implementation YZKPresentationViewController


- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController{
    return  [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController];
}

- (void)containerViewWillLayoutSubviews{
    [super containerViewWillLayoutSubviews];
    [self.containerView insertSubview:self.bgView atIndex:0];
    self.presentedView.frame = self.frame;

}

- (void)dismiss{
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - getter and setter

- (UIView *)bgView{
    if (_bgView == nil) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.0];
        _bgView.frame = [UIScreen mainScreen].bounds;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        [_bgView addGestureRecognizer:tap];
    }
    return _bgView;
}
@end

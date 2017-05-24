//
//  YZKPopOverModel.m
//  SCGD
//
//  Created by Lizeyu on 16/10/17.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKPopOverModel.h"
#import "YZKPresentationViewController.h"

@implementation YZKPopOverModel

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented  presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source{
    YZKPresentationViewController *presentationVc = [[YZKPresentationViewController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    presentationVc.frame = self.frame;
    return presentationVc;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return  0.5;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    _isPresent = YES;
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    _isPresent = NO;
    return self;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    if (_isPresent) {
        
        UIView *presentView = [transitionContext viewForKey:UITransitionContextToViewKey];
        presentView.transform = CGAffineTransformMakeScale(1.0, 0.0);
        
        presentView.layer.anchorPoint = CGPointMake(0, 0.5);
        [transitionContext.containerView addSubview:presentView];
        [UIView animateWithDuration:0.5 animations:^{
            presentView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }else if(!_isPresent) {
        UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        fromView.layer.anchorPoint = CGPointMake(0, 0.5);
        [UIView animateWithDuration:0.5 animations:^{
            fromView.transform = CGAffineTransformMakeScale(1.000000, 0.00001);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



@end

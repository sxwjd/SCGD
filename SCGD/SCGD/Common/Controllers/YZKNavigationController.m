//
//  YZKNavigationController.m
//  Dental_Fun
//
//  Created by 佳冬  on 15/9/22.
//  Copyright (c) 2015年 YZK. All rights reserved.
//

#import "YZKNavigationController.h"
@interface YZKNavigationController ()

@end

@implementation YZKNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationBarItem];

    self.navigationBar.barTintColor = mainColor;
    self.navigationBar.barStyle = UIStatusBarStyleLightContent;
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.translucent = NO;
  
}
-(void)setNavigationBarItem
{
    // 设置普通状态
    // key：NS****AttributeName
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    //此处设置的颜色、字体为暂时，等需求出来之后在定
    textAttrs[NSForegroundColorAttributeName] = UIColorRGB(0xffffff);
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    
    self.navigationBar.titleTextAttributes = textAttrs;
    
//    // 设置不可用状态
//    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
//    //此处设置的颜色、字体为暂时，等需求出来之后在定
//    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
//    
//    disableTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
//    
//    [self.navigationItem setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (self.viewControllers.count > 0) {
        //这时候push进来的控制器不是第一个
        viewController.hidesBottomBarWhenPushed = YES;
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"navigationbar_left-arrow" highImage:@"navigationbar_left-arrow"];
    }
    [super pushViewController:viewController animated:animated];

    
}
-(void)back
{
    [self popViewControllerAnimated:YES];
    
}
@end

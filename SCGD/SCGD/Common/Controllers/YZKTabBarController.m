//
//  YZKTabBarController.m
//  Dental_Fun
//
//  Created by 佳冬  on 15/9/22.
//  Copyright (c) 2015年 YZK. All rights reserved.
//

#import "YZKTabBarController.h"
#import "YZKNavigationController.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "ContactsViewController.h"
#import "ApplicationViewController.h"
#import "MineViewController.h"

@interface YZKTabBarController ()

@end

@implementation YZKTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
- (instancetype)init
{
    if (self = [super init]) {
        
        self.tabBar.barTintColor = UIColorRGB(0xffffff);
        [self setupViewControllers];
    }
    return self;
}
/**
 *  自定义初始化TabBar
 */
-(void)setupViewControllers
{
    
    ApplicationViewController *vc4 = [[ApplicationViewController alloc] init];
    [self setUpViewControllerWith:vc4 tabBartitle:@"应用" navigationTitle:nil image:@"tabbar_application_normal" selectedImage:@"tabbar_application_seleted"];
 
    ContactsViewController *vc3 = [[ContactsViewController alloc] init];
    [self setUpViewControllerWith:vc3 tabBartitle:@"联系人" navigationTitle:nil image:@"tabbar_contact_normal" selectedImage:@"tabbar_contact_seleted"];
    
    MessageViewController *vc2 = [[MessageViewController alloc] init];
    [self setUpViewControllerWith:vc2 tabBartitle:@"消息" navigationTitle:nil image:@"tabbar_message_normal" selectedImage:@"tabbar_message_seleted"];
    
    MineViewController *vc5 = [[MineViewController alloc] init];
    [self setUpViewControllerWith:vc5 tabBartitle:@"我的" navigationTitle:nil image:@"tabbar_profile_normal" selectedImage:@"tabbar_profile_seleted"];
}
/**
 *  设置子实体控制器的属性
 *
 *  @param childVc          子视图控制器
 *  @param tabBartitle      tabBar标题
 *  @param navigationTitle  navigationBar标题
 *  @param imageStr         普通状态下图片
 *  @param selectedImageStr 选中状态图片
 */
-(void)setUpViewControllerWith:(UIViewController *)childVc
                   tabBartitle:(NSString *)tabBartitle
               navigationTitle:(NSString *)navigationTitle
                         image:(NSString *)imageStr
                 selectedImage:(NSString *)selectedImageStr
{
    
    
    childVc.view.backgroundColor = mainBackgroundColor;
    YZKNavigationController *nav = [[YZKNavigationController alloc]initWithRootViewController:childVc];
    [nav.tabBarItem setTitle:tabBartitle];
    nav.navigationItem.title = navigationTitle;
    nav.tabBarItem.image = [[UIImage imageNamed:imageStr] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageStr] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //普通状态  后期修改颜色
    NSMutableDictionary *nolTextAttrs = [NSMutableDictionary dictionary];
    nolTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    nolTextAttrs[NSForegroundColorAttributeName] = subColor;
    
    //选中状态  后期修改颜色
    NSMutableDictionary *selTextAttrs = [NSMutableDictionary dictionary];
    selTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    selTextAttrs[NSForegroundColorAttributeName] = mainColor;
    
    
    [nav.tabBarItem setTitleTextAttributes:nolTextAttrs forState:UIControlStateNormal];
    
    [nav.tabBarItem setTitleTextAttributes:selTextAttrs forState:UIControlStateSelected];
    
    [self addChildViewController:nav];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

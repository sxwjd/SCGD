//
//  ChangePasswordViewController.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/20.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "ChangePasswordViewController.h"
#import "ChangePasswordView.h"
#import "ChangePasswordDataController.h"

@interface ChangePasswordViewController ()<ChangePasswordViewDelegate>
/**
 *  dataController
 */
@property (nonatomic, strong) ChangePasswordDataController *dataController;
/**
 *  changePasswordView
 */
@property (nonatomic, strong) ChangePasswordView *changePasswordView;
@end

@implementation ChangePasswordViewController
#pragma mark --life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpSubView];
    [self layOutSubView];
}
- (void)setUpSubView
{
    self.navigationItem.title = @"修改密码";
    self.view.backgroundColor = mainBackgroundColor;
    
    _dataController = [[ChangePasswordDataController alloc] init];
    
    _changePasswordView = [[ChangePasswordView alloc] init];
    _changePasswordView.delegate = self;
    [self.view addSubview:_changePasswordView];
}
- (void)layOutSubView
{
    [_changePasswordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --ChangePasswordViewDelegate
- (void)changePasswordInChangePasswordView:(ChangePasswordView *)changepwdView
{
    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithCapacity:0];
    NSString *loginId = [[NSUserDefaults standardUserDefaults] objectForKey:LOGINID];
    param[@"loginId"] = loginId;
    param[@"psw"] = changepwdView.oldPwd;
    param[@"npsw"] = changepwdView.firstNewPwd;
    [_dataController changePasswordWithParm:param Callback:^(void) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


@end

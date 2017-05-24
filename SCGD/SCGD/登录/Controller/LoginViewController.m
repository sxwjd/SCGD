//
//  LoginViewController.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/17.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"

@interface LoginViewController ()<LoginViewDelegate>
{
    CGFloat _keyboardHeight;
}
@property (nonatomic, strong) LoginView *loginView;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
    _keyboardHeight = 0;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];

}
- (void)keyboardWillShow:(NSNotification *)info
{
    _keyboardHeight = 44;
    [self updateView];
    
}
- (void)keyboardWillHide:(NSNotification *)info
{
    _keyboardHeight = 0;
    [self updateView];
}
- (void)updateView
{
    // 告诉self.view约束需要更新
    [self.view setNeedsUpdateConstraints];
    // 调用此方法告诉self.view检测是否需要更新约束，若需要则更新，下面添加动画效果才起作用
    [self.view updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}
- (void)updateViewConstraints
{
    [_loginView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(myheight(149)- _keyboardHeight);
        make.left.equalTo(self.view).offset(mywidth(32));
        make.right.equalTo(self.view).offset(-mywidth(32));
    }];
    [super updateViewConstraints];

}
- (void)setupView
{
    self.view.backgroundColor = mainBackgroundColor;
    self.title = @"登录";
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"navigationbar_left-arrow" highImage:@"navigationbar_left-arrow"];
    _loginView = [[LoginView alloc] init];
    _loginView.delegate = self;
    [self.view addSubview:_loginView];
}

- (void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark --LoginViewDelegate
- (void)doLiginInloginView:(LoginView *)loginView
{
    [SVProgressHUD setMinimumDismissTimeInterval:1.0];
    [SVProgressHUD showWithStatus:@"登录中.."];
    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithCapacity:0];
    param[@"loginId"] = loginView.loginId;
    param[@"psw"] = loginView.passWord;
    [[AFHTTPSessionManager manager] GET:LOGIN parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        if ([responseObject[@"code"] integerValue] == 0) {
            [SVProgressHUD showSuccessWithStatus:@"登录成功"];
            NSDictionary *data = responseObject[@"data"];
            if ([data isKindOfClass:[NSDictionary class]]) {
                NSString *userName = data[@"userName"];
                [[NSUserDefaults standardUserDefaults] setObject:userName forKey:USERNAME];
                [[NSUserDefaults standardUserDefaults] setObject:data[@"loginId"] forKey:LOGINID];
            }
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:ISLOGON];
            YZKTabBarController *tabvc = [[YZKTabBarController alloc] init];
            [UIApplication sharedApplication].keyWindow.rootViewController = tabvc;
        }else
        {
            [SVProgressHUD showErrorWithStatus:responseObject[@"message"]];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        [SVProgressHUD showErrorWithStatus:@"网络不给力"];
    }];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

//
//  BMLoginVC.m
//  StartAnimation
//
//  Created by ___liangdahong on 2016/11/18.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "BMLoginVC.h"
#import "Masonry.h"
#import "BMStartAnimationVC.h"
#import "BMHomeDrawerVC.h"
#import "BMLoginControllerView.h"
#import "BMResetPasswordVC.h"

@interface BMLoginVC ()

@property (nonatomic, strong) BMLoginControllerView *loginControllerView;

@end

@implementation BMLoginVC

#pragma mark -

#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
}

#pragma mark - getters setters

- (BMLoginControllerView *)loginControllerView {
    if (!_loginControllerView) {
        _loginControllerView = [BMLoginControllerView loginControllerViewWithLoginActionBlock:^(NSString *userName, NSString *password) {
            [self presentViewController:[BMHomeDrawerVC  homeDrawerControllerWithAnimations:NO] animated:YES completion:nil];
        } forgetpasswordActionBlock:^{
            [self presentViewController: [BMResetPasswordVC  new] animated:YES completion:nil];
        }];
    }
    return _loginControllerView;
}

#pragma mark - 系统delegate

#pragma mark - UITableViewDelegate UITableViewDataSource

#pragma mark - 自定义delegate

#pragma mark - 公有方法

#pragma mark - 私有方法

- (void)setUI {
    [self.view addSubview:self.loginControllerView];
    [self.loginControllerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}
#pragma mark - 事件响应
@end

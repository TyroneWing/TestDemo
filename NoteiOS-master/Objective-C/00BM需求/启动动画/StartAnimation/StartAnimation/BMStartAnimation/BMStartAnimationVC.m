//
//  BMStartAnimationVC.m
//  StartAnimation
//
//  Created by ___liangdahong on 2016/11/18.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "BMStartAnimationVC.h"
#import "BMStartAnimationView.h"
#import "Masonry.h"
#import "BMLoginVC.h"
#import "BMLoginControllerView.h"

@interface BMStartAnimationVC ()
@property (nonatomic, strong) BMStartAnimationView *startAnimationView;
@property (nonatomic, strong) BMLoginControllerView *loginControllerView;

@end

@implementation BMStartAnimationVC

#pragma mark -

#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
}

#pragma mark - getters setters
- (BMStartAnimationView *)startAnimationView {
    if (!_startAnimationView) {
        _startAnimationView = [BMStartAnimationView startAnimationView];
    }
    return _startAnimationView;
}

- (BMLoginControllerView *)loginControllerView {
    if (!_loginControllerView) {
        _loginControllerView = [BMLoginControllerView loginControllerViewWithLoginActionBlock:nil forgetpasswordActionBlock:nil];
    }
    return _loginControllerView;
}

#pragma mark - 系统delegate

#pragma mark - UITableViewDelegate UITableViewDataSource

#pragma mark - 自定义delegate

#pragma mark - 公有方法

#pragma mark - 私有方法

- (void)setUI {

    // 添加启动动画
    [self.view addSubview:self.startAnimationView];
    [self.startAnimationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    // 添加登录界面view
    [self.view addSubview:self.loginControllerView];
    self.loginControllerView.alpha = 0.0;
    [self.loginControllerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];

    // 渐变动画
    [UIView animateWithDuration:1.9 animations:^{
        /*蓝色比较,正方体和月亮变透明*/
        self.startAnimationView.blueImageView.alpha = 0.0;
        self.startAnimationView.moonImageView.alpha = 0.0;
    } completion:^(BOOL finished) {
        /*线变透明 登录view就绝渐渐的显示*/
        [UIView animateWithDuration:1.3 animations:^{
            self.startAnimationView.lineImageView.alpha = 0.0;
            self.loginControllerView.alpha = 1.0;
        } completion:^(BOOL finished) {
            // 更换root vc
            [[UIApplication sharedApplication] keyWindow].rootViewController = [BMLoginVC new];
        }];
    }];

    // 蓝月亮 loge 颜色渐变
    self.startAnimationView.whiteLogeImageView.alpha = 0.8;
    [UIView animateWithDuration:1.5 animations:^{
        self.startAnimationView.whiteLogeImageView.alpha = 0.0;
    }];

    // 为 蓝月亮 loge 添加上移动画
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    basicAnimation.duration    = 1.9;
    basicAnimation.repeatCount = 1;
    basicAnimation.timingFunction =  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
//    basicAnimation.fromValue = @(CGRectGetHeight([[UIScreen mainScreen] bounds])-14-[[UIScreen mainScreen] bounds].size.height*0.07);
    basicAnimation.toValue =   @(24+[[UIScreen mainScreen] bounds].size.height*0.07);
    basicAnimation.removedOnCompletion = NO;
    basicAnimation.fillMode = kCAFillModeForwards;
    [self.startAnimationView.blueLogeImageView.layer addAnimation:basicAnimation forKey:@"position.y"];
    [self.startAnimationView.whiteLogeImageView.layer addAnimation:basicAnimation forKey:@"position.y"];
}

#pragma mark - 事件响应

@end





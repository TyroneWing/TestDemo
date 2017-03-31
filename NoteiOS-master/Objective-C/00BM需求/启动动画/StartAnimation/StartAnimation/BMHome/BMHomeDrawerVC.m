//
//  BMHomeDrawerVC.m
//  StartAnimation
//
//  Created by ___liangdahong on 2016/11/21.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "BMHomeDrawerVC.h"
#import "BMHomeVC.h"
#import "BMLeftVC.h"

@interface BMHomeDrawerVC ()

@end

@implementation BMHomeDrawerVC

#pragma mark -

#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

#pragma mark - getters setters

#pragma mark - 系统delegate

#pragma mark - UITableViewDelegate UITableViewDataSource

#pragma mark - 自定义delegate

#pragma mark - 公有方法
+ (instancetype)homeDrawerControllerWithAnimations:(BOOL)animations {
    BMHomeVC *c1 = [BMHomeVC new];
    c1.animations = animations;
    BMLeftVC *c2 = [BMLeftVC new];
    BMHomeDrawerVC *homeDrawerVC = [[self alloc] initWithCenterViewController:[[UINavigationController alloc] initWithRootViewController:c1] leftDrawerViewController:c2];
    c1.homeDrawerVC = homeDrawerVC;
    c2.homeDrawerVC = homeDrawerVC;
    [c1.navigationController.navigationBar setBarTintColor:[UIColor blueColor]];
    [homeDrawerVC setShowsShadow:YES];
    [homeDrawerVC setMaximumLeftDrawerWidth:0.6*[[UIScreen mainScreen] bounds].size.width];
    [homeDrawerVC setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [homeDrawerVC setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    [homeDrawerVC setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
        NSLog(@"%@", @(percentVisible));
    }];
    return homeDrawerVC;
}

#pragma mark - 私有方法

- (void)setUI {
}

#pragma mark - 事件响应
@end

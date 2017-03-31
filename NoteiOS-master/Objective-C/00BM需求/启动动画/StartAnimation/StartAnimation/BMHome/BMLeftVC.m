//
//  BMLeftVC.m
//  StartAnimation
//
//  Created by ___liangdahong on 2016/11/21.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "BMLeftVC.h"
#import "BMHomeDrawerVC.h"

@interface BMLeftVC ()

@end

@implementation BMLeftVC

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

#pragma mark - 私有方法

- (void)setUI {
    
}

#pragma mark - 事件响应
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.homeDrawerVC closeDrawerAnimated:YES completion:nil];
}
@end

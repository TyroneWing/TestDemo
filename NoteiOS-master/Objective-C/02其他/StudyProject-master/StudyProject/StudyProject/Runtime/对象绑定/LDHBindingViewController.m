//
//  LDHBindingViewController.m
//  LDHRuntimeDemo
//
//  Created by Daredos on 16/4/12.
//  Copyright © 2016年 LiangDaHong. All rights reserved.
//

#import "LDHBindingViewController.h"
#import <objc/runtime.h>

#define kRuntimeKey    @"kRuntimeKey"


@interface LDHBindingViewController ()

@end

@implementation LDHBindingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 把@YES 通过 key为:kRuntimeKey  与 self 绑定起来
    objc_setAssociatedObject(self, kRuntimeKey, @YES, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    // 说明: 取出以 kRuntimeKey 为key 与 self 绑定起来的对象。
    id obj = objc_getAssociatedObject(self, kRuntimeKey);
    if (obj) {
        NSLog(@"取出为: %@",obj);
    }
    
}


@end

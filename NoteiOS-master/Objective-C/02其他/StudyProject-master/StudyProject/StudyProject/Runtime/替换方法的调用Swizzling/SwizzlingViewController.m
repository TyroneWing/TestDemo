//
//  SwizzlingViewController.m
//  LDHRuntimeDemo
//
//  Created by Daredos on 16/4/23.
//  Copyright © 2016年 LiangDaHong. All rights reserved.
//

#import "SwizzlingViewController.h"
#import <objc/runtime.h>

@interface SwizzlingViewController ()

@end

@implementation SwizzlingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

+ (void)load {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // 创建一个 实例方法对象1 ()
        Method orignViewDidLoad = class_getInstanceMethod([SwizzlingViewController class], @selector(test1));
        // 创建一个 实例方法对象2 ()
        Method replacingMethod = class_getInstanceMethod([SwizzlingViewController class], @selector(test2));
        // 交换2个方法对象的调用
        method_exchangeImplementations(orignViewDidLoad, replacingMethod);

        /* 同上 交换2个类方法的调用*/
        Method classOrignViewDidLoad = class_getClassMethod([SwizzlingViewController class], @selector(class_test1));
        Method classReplacingMethod = class_getClassMethod([SwizzlingViewController class], @selector(class_test2));
        method_exchangeImplementations(classOrignViewDidLoad, classReplacingMethod);
        
    });
}

- (void)test1 {
    
    NSLog(@"test - 1");
}

- (void)test2 {

    NSLog(@"test - 2");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 调test1 方法  ( [self test1] )
    NSLog(@" ( [self test1] ) ");
    [self test1];
    
    NSLog(@" ( [SwizzlingViewController class_test1] ) ");
    [SwizzlingViewController class_test1];
    
}

+ (void)class_test1 {
    
    NSLog(@"class_test - 1");
}

+ (void)class_test2 {
    
    NSLog(@"class_test - 2");
}

@end

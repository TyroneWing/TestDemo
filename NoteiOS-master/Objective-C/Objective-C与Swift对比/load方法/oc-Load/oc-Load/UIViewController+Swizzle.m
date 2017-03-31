//
//  UIViewController+Swizzle.m
//  oc-Load
//
//  Created by ___liangdahong on 16/9/9.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

#import "UIViewController+Swizzle.h"
#import <objc/runtime.h>

@implementation UIViewController (Swizzle)

// http://nshipster.cn/swift-objc-runtime/

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // 获取系统的方法的 方法对象
        Method orignViewDidLoad = class_getInstanceMethod([UIViewController class], @selector(viewDidLoad));
        
        // 获取准备用来替换的 方法对象
        Method replacingMethod = class_getInstanceMethod([UIViewController class], @selector(_viewDidLoad_Swizzling));

        // 为系统添加方法 (为self 添加方法SEL为：@selector(viewDidLoad) 方法地址为：method_getImplementation(replacingMethod))
        // 如果添加成功 说明系统没有实现此方法 那么帮系统实现了
        // 如果失败    说明系统已经实现
        BOOL didAddMethod =  class_addMethod([self class], @selector(viewDidLoad), method_getImplementation(replacingMethod), method_getTypeEncoding(replacingMethod));
        
        if (didAddMethod) {
            // 替换一下方法地址
            class_replaceMethod([self class], @selector(_viewDidLoad_Swizzling), method_getImplementation(orignViewDidLoad), method_getTypeEncoding(orignViewDidLoad));
        }else{
            // 直接交换的调用
            method_exchangeImplementations(orignViewDidLoad, replacingMethod);
        }
    });
}

+ (void)_viewDidLoad_Swizzling {
    [self _viewDidLoad_Swizzling];
}
@end



//
//  UIViewController+Swizzling.m
//  StudyProject
//
//  Created by Daredos on 16/4/25.
//  Copyright © 2016年 LiangDaHong. All rights reserved.
//

#import "UIViewController+Swizzling.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation UIViewController (Swizzling)

+ (void)load {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 创建一个 实例方法对象1 ()
        Method orignViewDidLoad = class_getInstanceMethod([UIViewController class], @selector(viewDidLoad));
        // 创建一个 实例方法对象2 ()
        Method replacingMethod = class_getInstanceMethod([UIViewController class], @selector(viewDidLoad_swizzling));
        // 交换2个方法对象的调用
        method_exchangeImplementations(orignViewDidLoad, replacingMethod);
    });
}

- (void)viewDidLoad_swizzling {

//    NSLog(@">>>> %@",NSStringFromClass([self class]));
//    self.view.backgroundColor = [UIColor clearColor];
    [self viewDidLoad_swizzling];
}
@end

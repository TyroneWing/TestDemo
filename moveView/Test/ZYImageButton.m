//
//  ZYImageButton.m
//  FuShanDemo
//
//  Created by __liangdahong on 2017/3/11.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "ZYImageButton.h"
#import <objc/runtime.h>

void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector)
{
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        NSLog(@"class_replaceMethod  没有方法:%@  add",NSStringFromSelector(originalSelector));
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }
    else {
        NSLog(@"exchangeImplementations ==== ");
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}


@implementation ZYImageButton

+ (void)load
{
    //防止用户手动调用load方法，避免多次交换方法
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        swizzleMethod([self class], @selector(imageRectForContentRect:), @selector(zy_imageRectForContentRect:));
        swizzleMethod([self class], @selector(titleRectForContentRect:), @selector(zy_titleRectForContentRect:));
    });
}



//// 交换2个方法的实现
//+ (void)swizzleInstanceMethodOriginalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector
//{
//    这样写有bug：如果这个类没有实现 originalSelector ，但其父类实现了，那 class_getInstanceMethod 会返回父类的方法。这样 method_exchangeImplementations 替换的是父类的那个方法，若在父类中访问originalSelector方法，被覆盖的swizzledSelector中访问子类的对象，程序会崩溃。
//    Method swizzledMehtod = class_getInstanceMethod(self, swizzledSelector);
//    Method originalMehtod = class_getInstanceMethod(self, originalSelector);
//    method_exchangeImplementations(swizzledMehtod, originalMehtod);
//}
//
//+ (void)load
//{
//    NSLog(@"ZYImageButton load");
//    [self swizzleInstanceMethodOriginalSelector:@selector(imageRectForContentRect:) swizzledSelector:@selector(zy_imageRectForContentRect:)];
//    [self swizzleInstanceMethodOriginalSelector:@selector(titleRectForContentRect:) swizzledSelector:@selector(zy_titleRectForContentRect:)];
//}



- ( CGRect )zy_imageRectForContentRect:( CGRect )contentRect
{
    //设置了值就返回设置的值,否则用系统的
    if (!CGRectEqualToRect(_imageRect,CGRectZero)) {
        return _imageRect;
    }
    return [self zy_imageRectForContentRect:contentRect];
    
}

- ( CGRect )zy_titleRectForContentRect:( CGRect )contentRect
{
    //设置了值就返回设置的值,否则用系统的
    if (!CGRectEqualToRect(_titleRect,CGRectZero)) {
        return _titleRect;
    }
    return [self zy_titleRectForContentRect:contentRect];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

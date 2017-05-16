//
//  UIButton+Rect.m
//  0328
//
//  Created by yi on 17/3/31.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "UIButton+Rect.h"
#import <objc/runtime.h>

@implementation UIButton (Rect)

- (void)setImageRect:(CGRect)imageRect
{
    objc_setAssociatedObject(self, @selector(imageRect), [NSValue valueWithCGRect:imageRect] , OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGRect)imageRect
{
    return [objc_getAssociatedObject(self, _cmd) CGRectValue];
}


-(void)setTitleRect:(CGRect)titleRect
{
    objc_setAssociatedObject(self, @selector(titleRect), [NSValue valueWithCGRect:titleRect] , OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGRect)titleRect
{
    return [objc_getAssociatedObject(self, _cmd) CGRectValue];
}


void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector)
{
    // the method might not exist in the class, but in its superclass
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    // class_addMethod will fail if original method already exists
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    // the method doesn’t exist and we just added one
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }
    else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

+ (void)load
{
    //load 时 已经交换了方法imageRectForContentRect 以及 zy_imageRectForContentRect
    //这时系统调用 imageRectForContentRect 方法，其实是调用了 zy_imageRectForContentRect 方法
    //相反，调用 zy_imageRectForContentRect 方法，其实是调用了 imageRectForContentRect 方法
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        swizzleMethod([self class], @selector(imageRectForContentRect:), @selector(zy_imageRectForContentRect:));
        swizzleMethod([self class], @selector(titleRectForContentRect:), @selector(zy_titleRectForContentRect:));
    });
}

- ( CGRect )zy_imageRectForContentRect:( CGRect )contentRect
{
    //系统会自动调用imageRectForContentRect方法，这时候方法已经被交换，其实调用的是重写后的 zy_imageRectForContentRect 方法。
    // 如果用户设置了 self.imageRect ，即self.imageRect 不等于 CGRectZero，这时直接返回用户设置的 imageRect
    // 如果self.imageRect 等于 CGRectZero，用户没有设置 imageRect 属性值，这时调用 zy_imageRectForContentRect 方法，因为 imageRectForContentRect 与 zy_imageRectForContentRect 做了交换，这时调用的是 imageRectForContentRect，保证用户没设置imageRect时，是原先button的样式
    if (!CGRectEqualToRect(self.imageRect,CGRectZero)) {
        return self.imageRect;
    }
    return [self zy_imageRectForContentRect:contentRect];
}

- ( CGRect )zy_titleRectForContentRect:( CGRect )contentRect
{
    //设置了值就返回设置的值,否则用系统的
    
    if (!CGRectEqualToRect(self.titleRect,CGRectZero)) {
        return self.titleRect;
    }
    return [self zy_titleRectForContentRect:contentRect];
}

@end

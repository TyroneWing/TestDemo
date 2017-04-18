//
//  ZYRectButton.m
//  FuShanDemo
//
//  Created by __liangdahong on 2017/3/12.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "ZYRectButton.h"
#import <objc/runtime.h>


@implementation ZYRectButton

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
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        swizzleMethod([self class], @selector(imageRectForContentRect:), @selector(zy_imageRectForContentRect:));
        swizzleMethod([self class], @selector(titleRectForContentRect:), @selector(zy_titleRectForContentRect:));
    });
}
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


- (void)setImageRect:(CGRect)imageRect {
    _imageRect = imageRect;
    [self setNeedsDisplay];
}

- (void)setTitleRect:(CGRect)titleRect
{
    _titleRect = titleRect;
    [self setNeedsDisplay];
}


- (void)setHighlighted:(BOOL)highlighted
{
    
}

@end

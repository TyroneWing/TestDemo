//
//  UILabel+Ext.m
//  Bar
//
//  Created by yi on 17/4/7.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "UILabel+Ext.h"
#import <objc/runtime.h>


@implementation UILabel (Ext)


- (void)setZy_marginRect:(CGSize)zy_marginRect
{
    objc_setAssociatedObject(self, @selector(zy_marginRect), [NSValue valueWithCGSize:zy_marginRect] , OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGSize)zy_marginRect
{
    return [objc_getAssociatedObject(self, _cmd) CGSizeValue];
}


void swizzleMethod2(Class class, SEL originalSelector, SEL swizzledSelector)
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
        swizzleMethod2([self class], @selector(intrinsicContentSize), @selector(zy_intrinsicContentSize));
        swizzleMethod2([self class], @selector(sizeToFit), @selector(zy_sizeToFit));
    });
}


//intrinsicContentSize xib才会调用
- (CGSize)zy_intrinsicContentSize
{
    if (!CGSizeEqualToSize(self.zy_marginRect,CGSizeZero)) {
        CGSize originalSize = [super intrinsicContentSize];
        CGSize size = CGSizeMake(originalSize.width+self.zy_marginRect.width, originalSize.height+self.zy_marginRect.height);
        return size;
    }
    return [self zy_intrinsicContentSize];
}


- (void)zy_sizeToFit
{
    
//    if (!CGSizeEqualToSize(self.zy_marginRect,CGSizeZero)) {
//        CGSize sizeThatFits = [self sizeThatFits:self.frame.size];
//        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, sizeThatFits.width+self.zy_marginRect.width, sizeThatFits.height+self.zy_marginRect.height);
//    } else {
//        [self zy_sizeToFit];
//    }
    
    NSLog(@"sizeToFit");
    [self zy_sizeToFit];

}


@end

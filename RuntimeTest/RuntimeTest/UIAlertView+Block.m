//
//  UIAlertView+Block.m
//  RuntimeTest
//
//  Created by yi on 2017/4/14.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "UIAlertView+Block.h"
#import <objc/runtime.h>

@implementation UIAlertView (Block)


- (void)setBlock:(void (^)(UIAlertView *, NSInteger))block
{
    objc_setAssociatedObject(self, @selector(block), block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(UIAlertView *, NSInteger))block
{
    return objc_getAssociatedObject(self, @selector(block));
}
//当点击alertview 的按钮时
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.block) {
        self.block(alertView, buttonIndex);
    }
}

- (void)showUsingBlock:(void (^)(UIAlertView *, NSInteger))block
{
    self.delegate = self;
    self.block = block;
    
    [self show];
}

@end

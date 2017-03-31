//
//  UIControl+Block.m
//  ocBlock
//
//  Created by ___liangdahong on 16/9/9.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

#import "UIControl+Block.h"
#import <objc/runtime.h>

const char kTouchUpInside = '\0';

@implementation UIControl (Block)

- (void)ih_addTouchUpInsideWithBlock:(dispatch_block_t)block {
    objc_setAssociatedObject(self, @selector(_touchControlEvents), block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(_touchControlEvents) forControlEvents:UIControlEventTouchUpInside];
}

- (void)_touchControlEvents {
    dispatch_block_t block = objc_getAssociatedObject(self, _cmd);
    if (block) block();
}
@end

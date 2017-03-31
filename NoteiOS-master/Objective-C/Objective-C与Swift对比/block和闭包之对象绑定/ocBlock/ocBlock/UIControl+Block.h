//
//  UIControl+Block.h
//  ocBlock
//
//  Created by ___liangdahong on 16/9/9.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (Block)

- (void)ih_addTouchUpInsideWithBlock:(dispatch_block_t)block;

@end

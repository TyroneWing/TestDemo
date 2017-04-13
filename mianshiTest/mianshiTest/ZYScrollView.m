//
//  ZYScrollView.m
//  mianshiTest
//
//  Created by __liangdahong on 2017/4/13.
//  Copyright © 2017年 http://idhong.com/. All rights reserved.
//

#import "ZYScrollView.h"

@implementation ZYScrollView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
        [self addGestureRecognizer:pan];
    }
    return self;
}

- (void)panAction:(UIPanGestureRecognizer *)pan {
    
    // 获取手指的偏移量
    CGPoint transP = [pan translationInView:pan.view];
    NSLog(@"%@", NSStringFromCGPoint(transP));
    
    // 修改bounds
    CGRect bounds = self.bounds;
    
    
    bounds.origin.y -= transP.y;
    

    if (bounds.size.width > self.contentSize.width) {
        bounds.size.width = self.contentSize.width;
    }
    if (bounds.size.height > self.contentSize.height) {
        bounds.size.height = self.contentSize.height;
    }
    
    self.bounds = bounds;
    
    // 复位
    [pan setTranslation:CGPointZero inView:pan.view];
    
}



@end

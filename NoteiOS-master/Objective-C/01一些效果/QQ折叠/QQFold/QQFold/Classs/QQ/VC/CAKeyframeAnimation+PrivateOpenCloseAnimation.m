//
//  CAKeyframeAnimation+PrivateOpenCloseAnimation.m
//  QQFold
//
//  Created by ___liangdahong on 16/9/2.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

#import "CAKeyframeAnimation+PrivateOpenCloseAnimation.h"
#define kKEY_ANIMA_PATH @"transform.rotation"

@implementation CAKeyframeAnimation (PrivateOpenCloseAnimation)

+ (instancetype)bm_openAnimationWithDuration:(CFTimeInterval)duration{
    return [self animationWithDurationWithValues:@[@(0), @(-M_PI)] duration:duration];
}

+ (instancetype)bm_closeAnimationWithDuration:(CFTimeInterval)duration {
    return [self animationWithDurationWithValues:@[@(-M_PI), @(0)] duration:duration];
}

+ (instancetype)animationWithDurationWithValues:(NSArray<NSNumber *> *)values duration:(CFTimeInterval)duration {
    // 1.创建核心动画
    CAKeyframeAnimation  *keyAnima = [CAKeyframeAnimation animation];
    keyAnima.keyPath = kKEY_ANIMA_PATH;
    keyAnima.values = values;
    // 是否返回起点
    keyAnima.removedOnCompletion = NO;
    keyAnima.fillMode = kCAFillModeBoth;
    keyAnima.duration = duration;
    // 设置动画重复的次数
    keyAnima.repeatCount = 1;
    // 2.添加核心动画
    return keyAnima;
}
@end

@implementation UIView (PrivateOpenCloseAnimation)

- (void)bm_addOpenAnimationWithDuration:(CFTimeInterval)duration {
    [self.layer addAnimation:[CAKeyframeAnimation bm_openAnimationWithDuration:duration] forKey:nil];
}

- (void)bm_addCloseAnimationWithDuration:(CFTimeInterval)duration {
    [self.layer addAnimation:[CAKeyframeAnimation bm_closeAnimationWithDuration:duration] forKey:nil];
}
@end
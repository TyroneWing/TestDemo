//
//  UIView+BMAnimation.m
//  IOS常见效果
//
//  Created by Daredos on 16/2/15.
//  Copyright © 2016年 Daredos. All rights reserved.
//

#import "UIView+BMAnimation.h"

#define kKEY_ANIMA_PATH @"transform.rotation"

@implementation UIView (BMAnimation)

#pragma mark -UIView 旋转动画

/// 一次旋转动画
///-----------

/**
 *  顺时针旋转 90°
 *
 *  @param duration 时间
 *
 *  @return 动画对象
 */
- (void)bm_addKeyAnimaClockwise_90_WithDuration:(CGFloat)duration
{
    CAKeyframeAnimation *keyframeAnimation = [self keyAnimaWithDegrees:@(M_PI/2.0) duration:duration];
    [self.layer addAnimation:keyframeAnimation forKey:nil];
}
/**
 *  逆时针旋转 90°
 *
 *  @param duration 时间
 *
 *  @return 动画对象
 */
- (void)bm_addkeyAnimaAntiClockwise_90_WithDuration:(CGFloat)duration
{
    CAKeyframeAnimation *keyframeAnimation = [self keyAnimaWithDegrees:@(-M_PI/2.0) duration:duration];
    [self.layer addAnimation:keyframeAnimation forKey:nil];
}

/**
 *  顺时针旋转 xx° 时间xx
 *
 *  @param degrees  角度 @(m_pi = 180°)
 *  @param duration 时间
 *
 *  @return 动画对象
 */
- (void)bm_addkeyAnimaClockwiseWithDegrees:(NSNumber *)degrees duration:(CGFloat)duration
{
    CAKeyframeAnimation *keyframeAnimation = [self keyAnimaWithDegrees:degrees duration:duration];
    [self.layer addAnimation:keyframeAnimation forKey:nil];
}

/**
 *   逆时针旋转 xx° 时间xx
 *
 *  @param degrees  角度 @(m_pi = 180°)
 *  @param duration 时间
 *
 *  @return 动画对象
 */
- (void)bm_addkeyAnimaAntiClockwiseWithDegrees:(NSNumber *)degrees duration:(CGFloat)duration
{
    CGFloat f = degrees.doubleValue;
    f = -1*f;
    CAKeyframeAnimation *keyframeAnimation = [self keyAnimaWithDegrees:[NSNumber numberWithDouble:f] duration:duration];
    [self.layer addAnimation:keyframeAnimation forKey:nil];
}

///-----------
/// 多次旋转动画
///-----------

/**
 *  顺时针旋转
 *
 *  @param duration    旋转一圈的时间
 *  @param repeatCount 旋转次数
 *
 *  @return 动画对象
 */
- (void)bm_addkeyAnimaClockwiseWithDuration:(CGFloat)duration RepeatCount:(CGFloat)repeatCount
{
    CAKeyframeAnimation *keyframeAnimation = [self keyAnimaWithDegrees:@(2*M_PI) duration:duration];
    keyframeAnimation.repeatCount = repeatCount;
    [self.layer addAnimation:keyframeAnimation forKey:nil];
}

/**
 *  逆时针旋转
 *
 *  @param duration    旋转一圈的时间
 *  @param repeatCount 旋转次数
 *
 *  @return 动画对象
 */
- (void)bm_addkeyAnimaAntiClockwiseWithDuration:(CGFloat)duration RepeatCount:(CGFloat)repeatCount
{
    CAKeyframeAnimation *keyframeAnimation = [self keyAnimaWithDegrees:@(-2*M_PI) duration:duration];
    keyframeAnimation.repeatCount = repeatCount;
    [self.layer addAnimation:keyframeAnimation forKey:nil];
}

///-----------
///  私有方法
///-----------

/**
 *  私有方法
 *
 *  @param degrees  0 - 角度
 *  @param duration 时间
 *
 *  @return 动画对象
 */
- (CAKeyframeAnimation *)keyAnimaWithDegrees:(NSNumber *)degrees duration:(CGFloat)duration{
    
    // 1.创建核心动画
    CAKeyframeAnimation  *keyAnima = [CAKeyframeAnimation animation];
    keyAnima.keyPath = kKEY_ANIMA_PATH;

    keyAnima.values = @[@(0), degrees];
    
    // 是否返回起点
    keyAnima.removedOnCompletion = NO;
    keyAnima.fillMode = kCAFillModeBoth;
    
    keyAnima.duration = duration;
    
    // 设置动画重复的次数
    keyAnima.repeatCount = 1;
    
    // 2.添加核心动画
    return keyAnima;
}

#pragma mark -UIView 其他动画

@end

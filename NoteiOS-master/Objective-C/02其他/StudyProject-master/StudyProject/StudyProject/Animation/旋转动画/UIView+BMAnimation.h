//
//  UIView+BMAnimation.h
//  IOS常见效果
//
//  Created by Daredos on 16/2/15.
//  Copyright © 2016年 Daredos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (BMAnimation)

#pragma mark -UIView 旋转动画

///-----------
/// 一次旋转动画
///-----------

/**
 *  顺时针旋转 90°
 *
 *  @param duration 时间
 *
 *  @return 动画对象
 */
- (void)bm_addKeyAnimaClockwise_90_WithDuration:(CGFloat)duration;

/**
 *  逆时针旋转 90°
 *
 *  @param duration 时间
 *
 *  @return 动画对象
 */
- (void)bm_addkeyAnimaAntiClockwise_90_WithDuration:(CGFloat)duration;

/**
 *  顺时针旋转 xx° 时间xx
 *
 *  @param degrees  角度 @(m_pi = 180°)
 *  @param duration 时间
 *
 *  @return 动画对象
 */
- (void)bm_addkeyAnimaClockwiseWithDegrees:(NSNumber *)degrees duration:(CGFloat)duration;

/**
 *   逆时针旋转 xx° 时间xx
 *
 *  @param degrees  角度 @(m_pi = 180°)
 *  @param duration 时间
 *
 *  @return 动画对象
 */
- (void)bm_addkeyAnimaAntiClockwiseWithDegrees:(NSNumber *)degrees duration:(CGFloat)duration;

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
- (void)bm_addkeyAnimaClockwiseWithDuration:(CGFloat)duration RepeatCount:(CGFloat)repeatCount;

/**
 *  逆时针旋转
 *
 *  @param duration    旋转一圈的时间
 *  @param repeatCount 旋转次数
 *
 *  @return 动画对象
 */
- (void)bm_addkeyAnimaAntiClockwiseWithDuration:(CGFloat)duration RepeatCount:(CGFloat)repeatCount;

#pragma mark -UIView 其他动画

@end

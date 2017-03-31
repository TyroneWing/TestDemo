//
//  CAKeyframeAnimation+PrivateOpenCloseAnimation.h
//  QQFold
//
//  Created by ___liangdahong on 16/9/2.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CAKeyframeAnimation (PrivateOpenCloseAnimation)

+ (instancetype)bm_openAnimationWithDuration:(CFTimeInterval)duration;
+ (instancetype)bm_closeAnimationWithDuration:(CFTimeInterval)duration;

@end

@interface UIView (PrivateOpenCloseAnimation)

- (void)bm_addOpenAnimationWithDuration:(CFTimeInterval)duration;

- (void)bm_addCloseAnimationWithDuration:(CFTimeInterval)duration;

@end
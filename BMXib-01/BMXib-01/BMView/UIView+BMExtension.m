//
//  UIView+BMExtension.m
//  IB_DESIGNABLE
//
//  Created by ___liangdahong on 2017/3/15.
//  Copyright © 2017年 ___liangdahong. All rights reserved.
//

#import "UIView+BMExtension.h"

@implementation UIView (BMExtension)

- (CGFloat)bm_cornerRadius {
    return  self.layer.cornerRadius;
}

- (void)setBm_cornerRadius:(CGFloat)bm_cornerRadius {
    self.layer.cornerRadius = bm_cornerRadius;
}

- (UIColor *)bm_borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setBm_borderColor:(UIColor *)bm_borderColor {
    self.layer.borderColor = bm_borderColor.CGColor;
}

- (CGFloat)bm_borderWidth {
    return self.layer.borderWidth;
}

- (void)setBm_borderWidth:(CGFloat)bm_borderWidth {
    self.layer.borderWidth = bm_borderWidth;
}

- (void)setBm_shadowColor:(UIColor *)bm_shadowColor {
    self.layer.shadowColor = bm_shadowColor.CGColor;
}

- (UIColor *)bm_shadowColor {
    return [UIColor colorWithCGColor:self.layer.shadowColor];
}

- (void)setBm_shadowOpacity:(float)bm_shadowOpacity {
    self.layer.shadowOpacity = bm_shadowOpacity;
}

- (float)bm_shadowOpacity {
    return self.layer.shadowOpacity;
}

- (void)setBm_shadowOffset:(CGSize)bm_shadowOffset {
    self.layer.shadowOffset = bm_shadowOffset;
}

- (CGSize)bm_shadowOffset {
    return self.layer.shadowOffset;
}

- (void)setBm_shadowRadius:(CGFloat)bm_shadowRadius {
    self.layer.shadowRadius = bm_shadowRadius;
}

- (CGFloat)bm_shadowRadius {
    return self.layer.shadowRadius;
}

@end

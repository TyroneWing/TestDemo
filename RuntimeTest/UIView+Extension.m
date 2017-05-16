//
//  UIView+Extension.m
//  RuntimeTest
//
//  Created by yi on 17/4/12.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "UIView+Extension.h"


@implementation UIView (Extension)

- (CGFloat)zy_cornerRadius {
    return  self.layer.cornerRadius;
}

- (void)setZy_cornerRadius:(CGFloat)zy_cornerRadius {
    self.layer.cornerRadius = zy_cornerRadius;
}

- (UIColor *)zy_borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setZy_borderColor:(UIColor *)zy_borderColor {
    self.layer.borderColor = zy_borderColor.CGColor;
}

- (CGFloat)zy_borderWidth {
    return self.layer.borderWidth;
}

- (void)setZy_borderWidth:(CGFloat)zy_borderWidth {
    self.layer.borderWidth = zy_borderWidth;
}

- (void)setZy_shadowColor:(UIColor *)zy_shadowColor {
    self.layer.shadowColor = zy_shadowColor.CGColor;
}

- (UIColor *)zy_shadowColor {
    return [UIColor colorWithCGColor:self.layer.shadowColor];
}

- (void)setZy_shadowOpacity:(float)zy_shadowOpacity {
    self.layer.shadowOpacity = zy_shadowOpacity;
}

- (float)zy_shadowOpacity {
    return self.layer.shadowOpacity;
}

- (void)setZy_shadowOffset:(CGSize)zy_shadowOffset {
    self.layer.shadowOffset = zy_shadowOffset;
}

- (CGSize)zy_shadowOffset {
    return self.layer.shadowOffset;
}

- (void)setZy_shadowRadius:(CGFloat)zy_shadowRadius {
    self.layer.shadowRadius = zy_shadowRadius;
}

- (CGFloat)zy_shadowRadius {
    return self.layer.shadowRadius;
}


@end

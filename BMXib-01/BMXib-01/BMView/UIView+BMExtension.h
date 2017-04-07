//
//  UIView+BMExtension.h
//  IB_DESIGNABLE
//
//  Created by ___liangdahong on 2017/3/15.
//  Copyright © 2017年 ___liangdahong. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface UIView (BMExtension)

@property (assign, nonatomic) IBInspectable CGFloat bm_cornerRadius; ///< 圆角
@property (strong, nonatomic) IBInspectable UIColor *bm_borderColor; ///< 边境颜色
@property (assign, nonatomic) IBInspectable CGFloat bm_borderWidth;  ///< 边境宽度

@property(strong, nonatomic) IBInspectable UIColor *bm_shadowColor;  ///< shadowColor
@property (assign, nonatomic) IBInspectable float  bm_shadowOpacity; ///< shadowOpacity
@property (assign, nonatomic) IBInspectable CGSize bm_shadowOffset;  ///< shadowOffset
@property (assign, nonatomic) IBInspectable CGFloat bm_shadowRadius; ///< shadowRadius

@end

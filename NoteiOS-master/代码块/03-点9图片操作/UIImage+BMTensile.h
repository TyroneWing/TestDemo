//
//
//
//
//  Created by ___liangdahong on 2016/11/24.
//  Copyright © 2016年 蓝月亮. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 .9 拉伸
 */
@interface UIImage (BMTensile)

/**
 获取 .9拉伸图片 (以图片中心点开始拉伸)

 @param name 图片名称
 */
+ (instancetype)bm_imageWithName:(NSString *)name;

/**
 获取 .9拉伸图片

 @param name 图片名称
 @param point 拉伸位置
 */
+ (instancetype)bm_imageWithName:(NSString *)name point:(CGPoint)point;

/**
 获取 .9拉伸图片 (以图片中心点开始拉伸)

 @param image 原生图片
 */
+ (instancetype)bm_imageWithImage:(UIImage *)image;

/**
 获取 .9拉伸图片

 @param image 原生图片
 @param point 拉伸位置
 */
+ (instancetype)bm_imageWithImage:(UIImage *)image point:(CGPoint)point;

@end



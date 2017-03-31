//
//  BMSignatureView.h
//  Signature
//
//  Created by ___liangdahong on 16/8/31.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMSignatureView : UIView

/*!
 *  @brief 提示View
 */
@property (nonatomic, strong) UIView *promptView;

/*!
 *  @brief 线的颜色
 */
@property (nonatomic, strong) UIColor *lineColor;

/*!
 *  @brief 线的宽度
 */
@property (nonatomic, assign) CGFloat lineWidth;

/*!
 *  @brief 获取画线完成生成的图片
 */
@property (nonatomic, strong, readonly) UIImage *signatureImage;

/*!
 *  @brief 创建画板
 *
 *  @param frame frame
 *  @param title 提示文字
 */
+ (instancetype)signatureViewWithFrame:(CGRect)frame title:(NSString *)title;

/*!
 *  @brief 创建画板
 *
 *  @param frame      frame
 *  @param promptView 提示View
 */
+ (instancetype)signatureViewWithFrame:(CGRect)frame promptView:(UIView *)promptView;

/*!
 *  @brief 清空画板
 */
- (void)clear;

+ (instancetype)new  UNAVAILABLE_ATTRIBUTE;
+ (instancetype)init UNAVAILABLE_ATTRIBUTE;
@end


//
//  PJRSignatureView.h
//  SignExample
//
//  Created by paritosh.raval on 21/11/14.
//  Copyright (c) 2014 paritosh.raval. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PJRSignatureView : UIView

/*!
 *  @brief 提醒view
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
 *  @brief 类方法创建画板
 *
 *  @param frame      frame
 *  @param promptView 提醒view
 */
+ (instancetype)signatureViewWithFrame:(CGRect)frame promptView:(UIView *)promptView;

- (void)clear;

@end


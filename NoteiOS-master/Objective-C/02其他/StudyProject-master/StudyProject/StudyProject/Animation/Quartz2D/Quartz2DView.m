//
//  Quartz2DView.m
//  StudyProject
//
//  Created by Daredos on 16/4/26.
//  Copyright © 2016年 LiangDaHong. All rights reserved.
//

#import "Quartz2DView.h"

@implementation Quartz2DView

/*!
 *  @brief 当你的view 第一次显示时调用
 *  绘图的作用
 *  @param rect rect：self.bounds
 */
- (void)drawRect:(CGRect)rect {

    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    // 2.创建一个路径
    UIBezierPath *path = [UIBezierPath bezierPath];

    // 设置起点
    [path moveToPoint:CGPointMake(0, 0)];
    // 添加一个点
    [path addLineToPoint:CGPointMake(30, 30)];
    // 在添加一个点
    [path addLineToPoint:CGPointMake(30, 100)];

    // 又设置起点
    [path moveToPoint:CGPointMake(50, 10)];
    // 在添加一个点
    [path addLineToPoint:CGPointMake(50, 100)];

    // 3.把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);

    // 设置绘图状态
    // 设置线宽
    CGContextSetLineWidth(ctx, 1);

    CGContextSetLineCap(ctx, kCGLineCapRound);

    [[UIColor blueColor] set];

    // 4.渲染上下文到视图
    CGContextStrokePath(ctx);
}

+ (instancetype)quartz2DView {
    
    return  [[self alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];

    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
}

@end

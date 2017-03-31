//
//  PJRSignatureView.m
//  SignExample
//
//  Created by paritosh.raval on 21/11/14.
//  Copyright (c) 2014 paritosh.raval. All rights reserved.
//


#import "PJRSignatureView.h"


@implementation PJRSignatureView
{
    UIBezierPath *beizerPath;
    UIImage *incrImage;
    CGPoint points[5];
    uint control;
    CAShapeLayer *shapeLayer;
}

+ (instancetype)signatureViewWithFrame:(CGRect)frame promptView:(UIView *)promptView {
    PJRSignatureView *signatureView = [[PJRSignatureView alloc] initWithFrame:frame];
    signatureView.promptView = promptView;
    return signatureView;
}

- (UIImage *)signatureImage {
    
    if(self.promptView.superview){
        return nil;
    }
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    UIImage *signatureImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return signatureImage;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor whiteColor];
    // 关闭多点触摸
    [self setMultipleTouchEnabled:NO];
    // 创建路径 UIBezierPath
    beizerPath = [UIBezierPath bezierPath];
    // 设置路径的宽度
    [beizerPath setLineWidth:self.lineWidth];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = self.backgroundColor;
        // 关闭多点触摸
        [self setMultipleTouchEnabled:NO];
        // 创建路径 UIBezierPath
        beizerPath = [UIBezierPath bezierPath];
        // 设置路径的宽度
        [beizerPath setLineWidth:self.lineWidth];
    }
    return self;
}

// 渲染时调用
- (void)drawRect:(CGRect)rect {

    [incrImage drawInRect:rect];
    
    [beizerPath stroke];
    
    // Set initial color for drawing
    
    UIColor *fillColor = self.lineColor;
    [fillColor setFill];
    UIColor *strokeColor = self.lineColor;;
    [strokeColor setStroke];
    [beizerPath stroke];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.promptView.superview){
        [self.promptView removeFromSuperview];
    }
    control = 0;
    UITouch *touch = [touches anyObject];
    points[0] = [touch locationInView:self];
    
    CGPoint startPoint = points[0];
    CGPoint endPoint = CGPointMake(startPoint.x + 1.5, startPoint.y + 2);

    [beizerPath moveToPoint:startPoint];
    [beizerPath addLineToPoint:endPoint];
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    control++;
    points[control] = touchPoint;
    
    if (control == 4)
    {
        points[3] = CGPointMake((points[2].x + points[4].x)/2.0, (points[2].y + points[4].y)/2.0);
        
        [beizerPath moveToPoint:points[0]];
        [beizerPath addCurveToPoint:points[3] controlPoint1:points[1] controlPoint2:points[2]];
        
        [self setNeedsDisplay];
        
        points[0] = points[3];
        points[1] = points[4];
        control = 1;
    }
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self drawBitmapImage];
    [self setNeedsDisplay];
    [beizerPath removeAllPoints];
    control = 0;
}

- (void)drawBitmapImage
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0.0);
    
    if (!incrImage)
    {
        UIBezierPath *rectpath = [UIBezierPath bezierPathWithRect:self.bounds];
        [self.backgroundColor setFill];
        [rectpath fill];
    }
    [incrImage drawAtPoint:CGPointZero];

    UIColor *strokeColor = self.lineColor;;
    [strokeColor setStroke];
    [beizerPath stroke];
    incrImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}

- (void)clear {
    incrImage = nil;
    [self setNeedsDisplay];
    [self addSubview:self.promptView];
}

- (void)setPromptView:(UIView *)promptView {
    _promptView = promptView;
    [self addSubview:_promptView];
}

- (UIColor *)lineColor {
    
    if (!_lineColor) {
        return [UIColor blackColor];
    }
    return _lineColor;
}
- (CGFloat)lineWidth {
    return beizerPath.lineWidth;
}
- (void)setLineWidth:(CGFloat)lineWidth {
    [beizerPath setLineWidth:lineWidth];
}
@end

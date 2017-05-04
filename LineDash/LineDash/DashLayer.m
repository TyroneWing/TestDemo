
//
//  DashLayer.m
//  LineDash
//
//  Created by yi on 17/4/25.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "DashLayer.h"
#import <UIKit/UIKit.h>

@implementation DashLayer

- (void)setPhase:(CGFloat)phase
{
    _phase = phase;
    [self setNeedsDisplay];
}


- (void)drawInContext:(CGContextRef)context{
    
//    NSLog(@"drawInContext ");
    CGPoint pointA = CGPointMake(10, 10);
    CGPoint pointB = CGPointMake(100, 10);
    
    CGPoint pointC = CGPointMake(100, 100);
    CGPoint pointD = CGPointMake(190, 100);

    CGPoint pointE = CGPointMake(190, 190);
    CGPoint pointF = CGPointMake(10, 190);
    
    
    
//    CGContextRef context = UIGraphicsGetCurrentContext();
    //    CGContextClearRect(context, rect);
    
    CGContextSetFillColorWithColor(context, [UIColor yellowColor].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor orangeColor].CGColor);
    UIBezierPath *helperline = [UIBezierPath bezierPath];
    [helperline moveToPoint:pointA];
    [helperline addLineToPoint:pointB];
    [helperline addLineToPoint:pointC];
    [helperline addLineToPoint:pointD];
    [helperline addLineToPoint:pointE];
    [helperline addLineToPoint:pointF];
    [helperline closePath];
    CGContextAddPath(context, helperline.CGPath);

    
//    UIBezierPath *testline = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 180, 180)];
//    CGContextAddPath(context, testline.CGPath);
    
    CGContextSetLineWidth(context, 5.0);
    CGFloat dash2[] = {20.0, 10.0};
    //CGContextSetLineDash(context, 0.0, dash2, 2);
    CGContextSetLineDash(context, self.phase, dash2, 2);
    CGContextStrokePath(context);
    
}

@end

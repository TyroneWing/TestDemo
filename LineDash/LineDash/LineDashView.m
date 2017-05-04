//
//  LineDashView.m
//  LineDash
//
//  Created by yi on 17/4/22.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "LineDashView.h"

@interface LineDashView ()

@property (nonatomic,strong) CADisplayLink *displayLink;
@property (nonatomic,assign) NSInteger count;
@end

@implementation LineDashView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.dashLayer = [DashLayer layer];
        self.dashLayer.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        self.dashLayer.contentsScale = [UIScreen mainScreen].scale;
        [self.layer addSublayer:self.dashLayer];
        self.dashLayer.phase = 0;
        self.count = 0;
        
        self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
//        self.displayLink.paused = YES;
        [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }
    return self;
}


- (void)update
{
    if (self.count == 30) {
        self.count = 0;
    } else {
        self.count ++;
    }
    self.dashLayer.phase = - self.count;

    
}


//- (void)drawRect:(CGRect)rect
//{
//    
//}

//- (void)setPhase:(CGFloat)phase
//{
//    _phase = phase;
//    [self setNeedsDisplay];
//}
//
//
//- (void)drawRect:(CGRect)rect {
//    
//
//    CGPoint pointA = CGPointMake(10, 10);
//    CGPoint pointB = CGPointMake(190, 10);
//    CGPoint pointC = CGPointMake(190, 190);
//    CGPoint pointD = CGPointMake(10, 190);
//    CGContextRef context = UIGraphicsGetCurrentContext();
////    CGContextClearRect(context, rect);
//
//    CGContextSetFillColorWithColor(context, [UIColor yellowColor].CGColor);
//    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
//    UIBezierPath *helperline = [UIBezierPath bezierPath];
//    [helperline moveToPoint:pointA];
//    [helperline addLineToPoint:pointB];
//    [helperline addLineToPoint:pointC];
//    [helperline addLineToPoint:pointD];
//    [helperline closePath];
//    
//    CGContextAddPath(context, helperline.CGPath);
//    CGContextSetLineWidth(context, 5.0);
//    CGFloat dash2[] = {25.0, 10.0};
//    //CGContextSetLineDash(context, 0.0, dash2, 2);
//    CGContextSetLineDash(context, self.phase, dash2, 2);
//    CGContextStrokePath(context);
//
//}


@end

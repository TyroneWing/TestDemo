//
//  WaugeView.m
//  WaugeTest
//
//  Created by __liangdahong on 2017/4/21.
//  Copyright © 2017年 http://tyronewing.top/. All rights reserved.
//

#import "WaugeView.h"


#define DEGREES_TO_RADIANS(degrees) (degrees) / 180.0 * M_PI

#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a/255.0]
#define CGRGB(r,g,b) RGB(r,g,b).CGColor
#define iCGRGB(r,g,b) (id)CGRGB(r,g,b)
#define CGRGBA(r,g,b,a) RGBA(r,g,b,a).CGColor
#define iCGRGBA(r,g,b,a) (id)CGRGBA(r,g,b,a)


#define FULLSCALE(x,y)    (x)*self.bounds.size.width, (y)*self.bounds.size.height

/* Position macros */
#define FULL_RECT           CGRectMake(0.0, 0.0, 1.0, 1.0)
#define kCenterX            0.5
#define kCenterY            0.5
#define kCenterPoint        CGPointMake(kCenterX, kCenterY)
#define kNeedleScrewRadius  0.04

@implementation WaugeView

{
    CGRect fullRect;
    CGRect innerRimRect;
    CGRect innerRimBorderRect;
    CGRect faceRect;
    CGRect rangeLabelsRect;
    CGRect scaleRect;
    CGPoint center;
    CGFloat scaleRotation;
    
    
    //每大格的间隔值
    CGFloat divisionValue;
    
    //每小格间隔值
    CGFloat subdivisionValue;
    //小格刻度角度
    CGFloat subdivisionAngle;
    
    
    //动画时间
    NSTimeInterval needleLastMoved;
    //指针
    CALayer *rootNeedleLayer;
    
    void (^animationCompletion)(BOOL);
    
    
    CAKeyframeAnimation *animation;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initialize];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self initialize];
}

- (void)initialize;
{
    _showInnerRim = NO;
    _innerRimWidth = 0.05;
    _innerRimBorderWidth = 0.005;
    
    _needleWidth = 0.035;
    _needleHeight = 0.34;
    _needleScrewRadius = 0.04;
    
    _scalePosition = 0.025;
    _scaleStartAngle = 30.0;
    _scaleEndAngle = 330.0;
    _scaleDivisions = 10.0;
    _scaleSubdivisions = 10.0;
    _showScaleShadow = YES;
    
    _scaleDivisionsLength = 0.045;
    _scaleDivisionsWidth = 0.01;
    _scaleSubdivisionsLength = 0.015;
    _scaleSubdivisionsWidth = 0.01;
    
    
    
    
    _value = 0.0;
    _minValue = 0.0;
    _maxValue = 100.0;
    
    
    
    needleLastMoved = 0.0;
    
    _showRangeLabels = NO;
    _rangeLabelsWidth = 0.05;
    _rangeLabelsFontKerning = 1.0;
    _rangeValues = nil;
    _rangeColors = nil;
    _rangeLabels = nil;
    
    _scaleDivisionColor = RGB(68, 84, 105);
    _scaleSubDivisionColor = RGB(217, 217, 217);
    
    _scaleFont = nil;
    
    _unitOfMeasurement = @"";
    _showUnitOfMeasurement = NO;
    
    [self initDrawingRects];
    [self initScale];
    
    [self setuplayer];
    
    [self anima];
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(context, rect.size.width , rect.size.height);
    [self drawNeedle:context];
    [self drawGauge:context];
}



- (void)anima
{
    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
}

- (void)setuplayer
{
    
    if (rootNeedleLayer == nil)
    {
        rootNeedleLayer = [CALayer new];
        rootNeedleLayer.frame = self.bounds;
        [self.layer addSublayer:rootNeedleLayer];
        
        
        // Left Needle
        CAShapeLayer *leftNeedleLayer = [CAShapeLayer layer];
        UIBezierPath *leftNeedlePath = [UIBezierPath bezierPath];
        [leftNeedlePath moveToPoint:CGPointMake(FULLSCALE(kCenterX, kCenterY))];
        [leftNeedlePath addLineToPoint:CGPointMake(FULLSCALE(kCenterX - _needleWidth, kCenterY))];
        [leftNeedlePath addLineToPoint:CGPointMake(FULLSCALE(kCenterX, kCenterY - _needleHeight))];
        [leftNeedlePath closePath];
        
        leftNeedleLayer.path = leftNeedlePath.CGPath;
        leftNeedleLayer.backgroundColor = [[UIColor clearColor] CGColor];
        leftNeedleLayer.fillColor = CGRGB(176, 10, 19);
        [rootNeedleLayer addSublayer:leftNeedleLayer];
        
        
        // Right Needle
        CAShapeLayer *rightNeedleLayer = [CAShapeLayer layer];
        UIBezierPath *rightNeedlePath = [UIBezierPath bezierPath];
        [rightNeedlePath moveToPoint:CGPointMake(FULLSCALE(kCenterX, kCenterY))];
        [rightNeedlePath addLineToPoint:CGPointMake(FULLSCALE(kCenterX + _needleWidth, kCenterY))];
        [rightNeedlePath addLineToPoint:CGPointMake(FULLSCALE(kCenterX, kCenterY - _needleHeight))];
        [rightNeedlePath closePath];
        
        rightNeedleLayer.path = rightNeedlePath.CGPath;
        rightNeedleLayer.backgroundColor = [[UIColor clearColor] CGColor];
        rightNeedleLayer.fillColor = CGRGB(252, 18, 30);
        [rootNeedleLayer addSublayer:rightNeedleLayer];
        
        
        // Needle shadow
        [rootNeedleLayer setShadowColor:[[UIColor blackColor] CGColor]];
        [rootNeedleLayer setShadowOffset:CGSizeMake(0, 0)];
        [rootNeedleLayer setShadowOpacity:0.5];
        [rootNeedleLayer setShadowRadius:2.0];
        
        // Screw drawing
        CAShapeLayer *screwLayer = [CAShapeLayer layer];
        screwLayer.bounds = CGRectMake(FULLSCALE(kCenterX - kNeedleScrewRadius, kCenterY - kNeedleScrewRadius), FULLSCALE(kNeedleScrewRadius * 2.0, kNeedleScrewRadius * 2.0));
        screwLayer.position = CGPointMake(FULLSCALE(kCenterX, kCenterY));
        screwLayer.path = [UIBezierPath bezierPathWithOvalInRect:screwLayer.bounds].CGPath;
        screwLayer.fillColor = CGRGB(171, 171, 171);
        screwLayer.strokeColor = CGRGBA(81, 84, 89, 100);
        screwLayer.lineWidth = 1.5;
        // Screw shadow
        screwLayer.shadowColor = [[UIColor blackColor] CGColor];
        screwLayer.shadowOffset = CGSizeMake(0.0, 0.0);
        screwLayer.shadowOpacity = 0.1;
        screwLayer.shadowRadius = 2.0;
        
        [rootNeedleLayer addSublayer:screwLayer];
    }
    
}


- (void)setValue:(double)value animated:(BOOL)animated duration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion
{
    double lastValue = self.value;
    
    
    self.value = value;

    if (animated) {
        needleLastMoved = duration;
    } else {
        needleLastMoved = 0.0;

    }
    
    // 中间值
    double middleValue = lastValue + (((lastValue + (_value - lastValue) / 2.0) >= 0) ? (_value - lastValue) / 2.0 : (lastValue - _value) / 2.0);
    

    
    animation.duration = needleLastMoved;
    animation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeRotation([self needleAngleForValue:lastValue]  , 0, 0, 1.0)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeRotation([self needleAngleForValue:middleValue], 0, 0, 1.0)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeRotation([self needleAngleForValue:_value], 0, 0, 1.0)]];
    
    [rootNeedleLayer addAnimation:animation forKey:kCATransition];
    
    
    animationCompletion = completion;

    
}


- (CGFloat)needleAngleForValue:(double)value
{
    return DEGREES_TO_RADIANS(_scaleStartAngle + (value - _minValue) / (_maxValue - _minValue) * (_scaleEndAngle - _scaleStartAngle)) + M_PI;
}


- (void)rotateContext:(CGContextRef)context fromCenter:(CGPoint)center_ withAngle:(CGFloat)angle
{
    CGContextTranslateCTM(context, center_.x, center_.y);
    CGContextRotateCTM(context, angle);
    CGContextTranslateCTM(context, -center_.x, -center_.y);
}


- (void)drawText:(CGContextRef)context
{
    CGContextSetShadow(context, CGSizeMake(0.05, 0.05), 2.0);
    UIFont* font = [UIFont fontWithName:@"Helvetica" size:0.07];
    NSDictionary* stringAttrs = @{ NSFontAttributeName : font, NSForegroundColorAttributeName : [UIColor blackColor] };
    NSAttributedString* attrStr = [[NSAttributedString alloc] initWithString:_unitOfMeasurement attributes:stringAttrs];
    CGSize fontWidth = [_unitOfMeasurement sizeWithAttributes:stringAttrs];
    [attrStr drawAtPoint:CGPointMake(0.5 - fontWidth.width / 2.0, 0.3)];
}


- (void)drawScale:(CGContextRef)context
{
    
    CGContextSaveGState(context);
    [self rotateContext:context fromCenter:center withAngle:DEGREES_TO_RADIANS(180 + _scaleStartAngle)];
    
    int totalTicks = _scaleDivisions * _scaleSubdivisions + 1;
    for (int i = 0; i < totalTicks; i++)
    {
        CGFloat offset = 0.0;
        
        CGFloat y1 = scaleRect.origin.y;
        CGFloat y2 = y1 + _scaleSubdivisionsLength;
        CGFloat y3 = y1 + _scaleDivisionsLength;
        
        float value = [self valueForTick:i];
        if (i%(int)_scaleDivisions == 0)
        {
            UIColor *color = (_rangeValues && _rangeColors)?[self rangeColorForValue:value]:_scaleDivisionColor;
            CGContextSetStrokeColorWithColor(context, color.CGColor);
            CGContextSetLineWidth(context, _scaleDivisionsWidth);
            CGContextSetShadow(context, CGSizeMake(0.05, 0.05), _showScaleShadow?2.0:0.0);
            
            CGContextMoveToPoint(context, 0.5, y1);
            CGContextAddLineToPoint(context, 0.5, y3);
            CGContextStrokePath(context);
            NSString *valueString = [NSString stringWithFormat:@"%0.0f",value];
            
            UIFont* font = _scaleFont?_scaleFont:[UIFont fontWithName:@"Helvetica-Bold" size:0.05];
            NSDictionary* stringAttrs = @{ NSFontAttributeName : font, NSForegroundColorAttributeName : color };
            NSAttributedString* attrStr = [[NSAttributedString alloc] initWithString:valueString attributes:stringAttrs];
            CGSize fontWidth = [valueString sizeWithAttributes:stringAttrs];
            [attrStr drawAtPoint:CGPointMake(0.5 - fontWidth.width / 2.0, y3 + 0.005)];
        }
        else
        {
            UIColor *color = (_rangeValues && _rangeColors)?[self rangeColorForValue:value]:_scaleSubDivisionColor;
            CGContextSetStrokeColorWithColor(context, color.CGColor);
            CGContextSetLineWidth(context, _scaleSubdivisionsWidth);
            CGContextMoveToPoint(context, 0.5, y1);
            if (_showScaleShadow) CGContextSetShadow(context, CGSizeMake(0.05, 0.05), 2.0);
            
            CGContextMoveToPoint(context, 0.5, y1 + offset);
            CGContextAddLineToPoint(context, 0.5, y2 + offset);
            CGContextStrokePath(context);
        }
        
        [self rotateContext:context fromCenter:center withAngle:DEGREES_TO_RADIANS(subdivisionAngle)];
    }
    CGContextRestoreGState(context);
    
}

- (void) drawStringAtContext:(CGContextRef) context string:(NSString*)text withCenter:(CGPoint)center_ radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle
{
    CGContextSaveGState(context);
    NSLog(@"drawStringAtContext 圆弧 刻度");
    UIFont* font = _scaleFont?_scaleFont:[UIFont fontWithName:@"Helvetica" size:0.05];
    NSDictionary* stringAttrs = @{ NSFontAttributeName : font, NSForegroundColorAttributeName : [UIColor whiteColor] };
    CGSize textSize = [text sizeWithAttributes:stringAttrs];
    
    float perimeter = 2 * M_PI * radius;
    float textAngle = textSize.width / perimeter * 2 * M_PI * _rangeLabelsFontKerning;
    float offset = ((endAngle - startAngle) - textAngle) / 2.0;
    
    float letterPosition = 0;
    NSString *lastLetter = @"";
    
    [self rotateContext:context fromCenter:center withAngle:startAngle + offset];
    for (int index = 0; index < [text length]; index++)
    {
        NSRange range = {index, 1};
        NSString* letter = [text substringWithRange:range];
        NSAttributedString* attrStr = [[NSAttributedString alloc] initWithString:letter attributes:stringAttrs];
        CGSize charSize = [letter sizeWithAttributes:stringAttrs];
        
        float totalWidth = [[NSString stringWithFormat:@"%@%@", lastLetter, letter] sizeWithAttributes:stringAttrs].width;
        float currentLetterWidth = [letter sizeWithAttributes:stringAttrs].width;
        float lastLetterWidth = [lastLetter sizeWithAttributes:stringAttrs].width;
        float kerning = (lastLetterWidth) ? 0 : ((currentLetterWidth + lastLetterWidth) - totalWidth);
        
        letterPosition += (charSize.width / 2) - kerning;
        float angle = (letterPosition / perimeter * 2 * M_PI) * _rangeLabelsFontKerning;
        CGPoint letterPoint = CGPointMake((radius - charSize.height / 2.0) * cos(angle) + center_.x, (radius - charSize.height / 2.0) * sin(angle) + center_.y);
        
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, letterPoint.x, letterPoint.y);
        CGAffineTransform rotationTransform = CGAffineTransformMakeRotation(angle + M_PI_2);
        CGContextConcatCTM(context, rotationTransform);
        CGContextTranslateCTM(context, -letterPoint.x, -letterPoint.y);
        
        [attrStr drawAtPoint:CGPointMake(letterPoint.x - charSize.width/2 , letterPoint.y - charSize.height)];
        
        CGContextRestoreGState(context);
        
        letterPosition += charSize.width / 2;
        lastLetter = letter;
    }
    CGContextRestoreGState(context);
}

- (void)drawRangeLabels:(CGContextRef)context
{
    
    CGContextSaveGState(context);
    [self rotateContext:context fromCenter:center withAngle:DEGREES_TO_RADIANS(90 + _scaleStartAngle)];
    CGContextSetShadow(context, CGSizeMake(0.0, 0.0), 0.0);
    
    CGFloat maxAngle = _scaleEndAngle - _scaleStartAngle;
    CGFloat lastStartAngle = 0.0f;
    
    for (int i = 0; i < _rangeValues.count; i ++)
    {
        float value = ((NSNumber*)[_rangeValues objectAtIndex:i]).floatValue;
        float valueAngle = (value - _minValue) / (_maxValue - _minValue) * maxAngle;
        NSLog(@"drawRangeLabels");
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path addArcWithCenter:center radius:rangeLabelsRect.size.width / 2.0 + 0.01 startAngle:DEGREES_TO_RADIANS(lastStartAngle) endAngle:DEGREES_TO_RADIANS(valueAngle) clockwise:YES];
        
        UIColor *color = _rangeColors[i];
        [color setStroke];
        path.lineWidth = _rangeLabelsWidth;
        
        [path stroke];
        
        [self drawStringAtContext:context string:(NSString*)_rangeLabels[i] withCenter:center radius:rangeLabelsRect.size.width / 2.0 + 0.008 startAngle:DEGREES_TO_RADIANS(lastStartAngle) endAngle:DEGREES_TO_RADIANS(valueAngle)];
        
        lastStartAngle = valueAngle;
    }
    
    CGContextRestoreGState(context);
}

- (void)drawNeedle:(CGContextRef)context
{
    CGContextSetShadow(context, CGSizeMake(0.05, 0.05), 2.0);
    UIFont* font = [UIFont fontWithName:@"Helvetica" size:0.08];
    NSDictionary* stringAttrs = @{ NSFontAttributeName : font, NSForegroundColorAttributeName : [UIColor blackColor]};
    NSAttributedString* attrStr = [[NSAttributedString alloc] initWithString:_valueString attributes:stringAttrs];
    CGSize fontWidth = [_valueString sizeWithAttributes:stringAttrs];
    [attrStr drawAtPoint:CGPointMake(0.5 - fontWidth.width / 2.0, 0.65)];
}

- (void)initScale
{
    scaleRotation = (int)(_scaleStartAngle + 180) % 360;
    divisionValue = (_maxValue - _minValue) / _scaleDivisions;
    subdivisionValue = divisionValue / _scaleSubdivisions;
    subdivisionAngle = (_scaleEndAngle - _scaleStartAngle) / (_scaleDivisions * _scaleSubdivisions);
}

- (UIColor*)rangeColorForValue:(float)value
{
    NSInteger length = _rangeValues.count;
    for (int i = 0; i < length - 1; i++)
    {
        if (value < [_rangeValues[i] floatValue])
            return _rangeColors[i];
    }
    if (value <= [_rangeValues[length - 1] floatValue])
        return _rangeColors[length - 1];
    return nil;
}










- (void)initDrawingRects
{
    center = CGPointMake(0.5, 0.5);
    fullRect = CGRectMake(0.0, 0.0, 1.0, 1.0);
    
    _innerRimBorderWidth = _showInnerRim?_innerRimBorderWidth:0.0;
    
    _innerRimWidth = _showInnerRim?_innerRimWidth:0.0;
    
    innerRimRect = fullRect;
    innerRimBorderRect = CGRectMake(innerRimRect.origin.x + _innerRimBorderWidth,
                                    innerRimRect.origin.y + _innerRimBorderWidth,
                                    innerRimRect.size.width - 2 * _innerRimBorderWidth,
                                    innerRimRect.size.height - 2 * _innerRimBorderWidth);
    faceRect = CGRectMake(innerRimRect.origin.x + _innerRimWidth,
                          innerRimRect.origin.y + _innerRimWidth,
                          innerRimRect.size.width - 2 * _innerRimWidth,
                          innerRimRect.size.height - 2 * _innerRimWidth);
    
    
    rangeLabelsRect = CGRectMake(faceRect.origin.x + (_showRangeLabels ? _rangeLabelsWidth : 0.0),
                                 faceRect.origin.y + (_showRangeLabels ? _rangeLabelsWidth : 0.0),
                                 faceRect.size.width - 2 * (_showRangeLabels ? _rangeLabelsWidth : 0.0),
                                 faceRect.size.height - 2 * (_showRangeLabels ? _rangeLabelsWidth : 0.0));
    scaleRect = CGRectMake(rangeLabelsRect.origin.x + _scalePosition,
                           rangeLabelsRect.origin.y + _scalePosition,
                           rangeLabelsRect.size.width - 2 * _scalePosition,
                           rangeLabelsRect.size.height - 2 * _scalePosition);
}

- (void)drawGauge:(CGContextRef)context
{
    if (_showUnitOfMeasurement)
            [self drawText:context];
    [self drawScale:context];
    [self drawRangeLabels:context];
}

- (float)valueForTick:(int)tick
{
    return tick * (divisionValue / _scaleSubdivisions) + _minValue;
}


- (void)invalidateBackground
{
    [self initDrawingRects];
    [self initScale];
//    [self setNeedsDisplay];
}











#pragma mark - Properties

- (void)setValue:(float)value
{
    if (value > _maxValue)
        _value = _maxValue;
    else if (value < _minValue)
        _value = _minValue;
    else
        _value = value;
    
    _valueString = [NSString stringWithFormat:@"%.2f",value];
    needleLastMoved = 0.0;
}

- (void)setNeedleWidth:(CGFloat)needleWidth
{
    _needleWidth = needleWidth;
    [self setNeedsDisplay];
}

- (void)setNeedleHeight:(CGFloat)needleHeight
{
    _needleHeight = needleHeight;
    [self setNeedsDisplay];
}

- (void)setNeedleScrewRadius:(CGFloat)needleScrewRadius
{
    _needleScrewRadius = needleScrewRadius;
    [self setNeedsDisplay];
}


- (void)setScalePosition:(CGFloat)scalePosition
{
    _scalePosition = scalePosition;
    [self invalidateBackground];
}

- (void)setScaleStartAngle:(CGFloat)scaleStartAngle
{
    _scaleStartAngle = scaleStartAngle;
    [self invalidateBackground];
}

- (void)setScaleEndAngle:(CGFloat)scaleEndAngle
{
    _scaleEndAngle = scaleEndAngle;
    [self invalidateBackground];
}

- (void)setScaleDivisions:(CGFloat)scaleDivisions
{
    _scaleDivisions = scaleDivisions;
    [self invalidateBackground];
}

- (void)setScaleSubdivisions:(CGFloat)scaleSubdivisions
{
    _scaleSubdivisions = scaleSubdivisions;
    [self invalidateBackground];
}

- (void)setShowScaleShadow:(bool)showScaleShadow
{
    _showScaleShadow = showScaleShadow;
    [self invalidateBackground];
}


- (void)setScaleDivisionsLength:(CGFloat)scaleDivisionsLength
{
    _scaleDivisionsLength = scaleDivisionsLength;
    [self invalidateBackground];
}

- (void)setScaleDivisionsWidth:(CGFloat)scaleDivisionsWidth
{
    _scaleDivisionsWidth = scaleDivisionsWidth;
    [self invalidateBackground];
}

- (void)setScaleSubdivisionsLength:(CGFloat)scaleSubdivisionsLength
{
    _scaleSubdivisionsLength = scaleSubdivisionsLength;
    [self invalidateBackground];
}

- (void)setScaleSubdivisionsWidth:(CGFloat)scaleSubdivisionsWidth
{
    _scaleSubdivisionsWidth = scaleSubdivisionsWidth;
    [self invalidateBackground];
}

- (void)setScaleDivisionColor:(UIColor *)scaleDivisionColor
{
    _scaleDivisionColor = scaleDivisionColor;
    [self invalidateBackground];
}

- (void)setScaleSubDivisionColor:(UIColor *)scaleSubDivisionColor
{
    _scaleSubDivisionColor = scaleSubDivisionColor;
    [self invalidateBackground];
}

- (void)setScaleFont:(UIFont *)scaleFont
{
    _scaleFont = scaleFont;
    [self invalidateBackground];
}

- (void)setRangeLabelsWidth:(CGFloat)rangeLabelsWidth
{
    _rangeLabelsWidth = rangeLabelsWidth;
    [self invalidateBackground];
}

- (void)setMinValue:(float)minValue
{
    _minValue = minValue;
    _value = minValue;
    [self invalidateBackground];
}

- (void)setMaxValue:(float)maxValue
{
    _maxValue = maxValue;
    [self invalidateBackground];
}

- (void)setRangeValues:(NSArray *)rangeValues
{
    _rangeValues = rangeValues;
    [self invalidateBackground];
}

- (void)setRangeColors:(NSArray *)rangeColors
{
    _rangeColors = rangeColors;
    [self invalidateBackground];
}

- (void)setRangeLabels:(NSArray *)rangeLabels
{
    _rangeLabels = rangeLabels;
    [self invalidateBackground];
}

- (void)setUnitOfMeasurement:(NSString *)unitOfMeasurement
{
    _unitOfMeasurement = unitOfMeasurement;
    [self invalidateBackground];
}

- (void)setShowUnitOfMeasurement:(bool)showUnitOfMeasurement
{
    _showUnitOfMeasurement = showUnitOfMeasurement;
    [self invalidateBackground];
}

- (void)setShowRangeLabels:(bool)showRangeLabels
{
    _showRangeLabels = showRangeLabels;
    [self invalidateBackground];
}

- (void)setRangeLabelsFontKerning:(CGFloat)rangeLabelsFontKerning
{
    _rangeLabelsFontKerning = rangeLabelsFontKerning;
    [self invalidateBackground];
}


@end

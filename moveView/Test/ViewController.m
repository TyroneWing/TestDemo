//
//  ViewController.m
//  Test
//
//  Created by __liangdahong on 2017/3/10.
//  Copyright © 2017年 http://idhong.com/. All rights reserved.
//

#import "ViewController.h"
#import "ZYImageButton.h"
#import "TestButton.h"

#define   kWIN_WIDTH  [[UIScreen mainScreen] bounds].size.width
#define   kWIN_HEIGHT [[UIScreen mainScreen] bounds].size.height

@interface ViewController ()
{
    UIView *temView;
    UIView *aview;
}

@property (nonatomic,strong) CADisplayLink *displayLink;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self moveView];
    
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(100, 100, 200, 100) byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(10, 10)];
//    
////    UIColor *color4 = [UIColor redColor];
////    [color4 setStroke];
////    path.lineWidth = 5;
////    [path stroke];
//    
//    CAShapeLayer *layer = [CAShapeLayer layer];
//    layer.path = path.CGPath;
//    layer.lineWidth = 2;
////    layer.borderColor = [UIColor redColor].CGColor;
//    layer.strokeColor = [UIColor yellowColor].CGColor;
//    layer.fillColor = [UIColor clearColor].CGColor;
//    [self.view.layer addSublayer:layer];
    
    
    [self moveTest];
}

- (void)moveTest
{
    aview = [[UIView alloc] initWithFrame:CGRectMake(100, 50, 100, 100)];
    aview.backgroundColor = [UIColor redColor];
    [self.view addSubview:aview];
    
    [self beforeAnimation];
    [UIView animateWithDuration:5 delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        aview.frame = CGRectMake(100, 400, 100, 100);
    } completion:^(BOOL finished) {
        [self finishAnimation];

    }];
    
    
//    [UIView animateWithDuration:5 delay:0 options:(UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction) animations:^{
//        aview.frame = CGRectMake(100, 400, 100, 100);
//    } completion:^(BOOL finished) {
//        NSLog(@"aview finish");
//    }];
    
//    UIView *bview = [[UIView alloc] initWithFrame:CGRectMake(250, 50, 100, 100)];
//    bview.backgroundColor = [UIColor orangeColor];
//    [self.view addSubview:bview];
//    
//    
//    [UIView animateWithDuration:5 delay:0 usingSpringWithDamping:0 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//        bview.frame = CGRectMake(250, 400, 100, 100);
//    } completion:^(BOOL finished) {
//        
//    }];
    
    
//    [UIView animateWithDuration:5 delay:0 options:(UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction) animations:^{
//        bview.frame = CGRectMake(250, 400, 100, 100);
//    } completion:^(BOOL finished) {
//        NSLog(@"bview finish");
//
//    }];
    
}


//动画之前调用
-(void)beforeAnimation{

    
        self.displayLink = [CADisplayLink displayLinkWithTarget:self
                                                       selector:@selector(displayLinkAction:)];
    
        [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];

}

//画完成之后调用
-(void)finishAnimation{

        
        [self.displayLink invalidate];
        self.displayLink = nil;
}


//CADisplayLink 绑定的方法
-(void)displayLinkAction:(CADisplayLink *)dis{
    
    CALayer *presentationLayer   =  (CALayer *)[aview.layer presentationLayer];
    CGRect centerRect = [[presentationLayer valueForKeyPath:@"frame"]CGRectValue];
    NSLog(@"aview frame = %@",NSStringFromCGRect(centerRect));
    
}


- (void)taphandle:(UITapGestureRecognizer*)tap
{
    CGPoint touchPoint = [tap locationInView:self.view];
    if ([temView.layer.presentationLayer hitTest:touchPoint]) {
        temView.backgroundColor = [UIColor blueColor];
    }
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    CGPoint point = [[touches anyObject] locationInView:self.view];
//    CGPoint templayerPoint = temView.layer.presentationLayer.position;
//    NSLog(@"%@  %@",NSStringFromCGPoint(point),NSStringFromCGPoint(templayerPoint));
////    if (point.x >templayerPoint.x-100 && point.x <templayerPoint.x+100 && point.y >templayerPoint.x-100 && point.y <templayerPoint.x+100){
////        [temView touchesBegan:touches withEvent:event];
////    }
//    
////    [temView touchesBegan:touches withEvent:event];
//
//    NSLog(@"%@",NSStringFromCGRect(temView.frame));
    
}

- (void)moveView
{
    temView = [[UIView alloc] initWithFrame:CGRectMake(100, 0, 100, 100)];
    temView.backgroundColor = [UIColor redColor];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(taphandle:)];
    temView.userInteractionEnabled = YES;
    [temView addGestureRecognizer:tap];
    
    [self.view addSubview:temView];

    /* 移动 */
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
//    
//    // 动画选项的设定
//    animation.duration = 2.5; // 持续时间
//    animation.repeatCount = 0; // 重复次数
//    
//    // 起始帧和终了帧的设定
//    animation.fromValue = [NSValue valueWithCGPoint:temView.layer.position]; // 起始帧
//    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(320, 480)]; // 终了帧
//    
//    // 添加动画
//    [temView.layer addAnimation:animation forKey:@"move-layer"];
    
    
    
    [UIView animateWithDuration:5 delay:2 options:(UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction) animations:^{
        temView.frame = CGRectMake(0, 300, 200, 200);
    } completion:^(BOOL finished) {
        
    }];
    
    
//    CGPoint poi = CGPointMake(200, 200);
//    CAKeyframeAnimation *moveLayerAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    moveLayerAnimation.values = @[[NSValue valueWithCGPoint:temView.center],
//                                  [NSValue valueWithCGPoint:poi]];
//    temView.center = poi;
//    
//    moveLayerAnimation.duration = 20;
//    moveLayerAnimation.autoreverses = YES;
//    moveLayerAnimation.repeatCount = INFINITY;
//    moveLayerAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
//    [temView.layer addAnimation:moveLayerAnimation forKey:@"move"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  ViewController.m
//  0328
//
//  Created by yi on 17/3/28.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+Rect.h"


@interface ViewController ()<CAAnimationDelegate>
{
    UIView *view;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
    btn.backgroundColor = [UIColor orangeColor];
    [btn setImage:[UIImage imageNamed:@"test.png"] forState:UIControlStateNormal];
    [btn setTitle:@"没有使用Rect" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
   
    
    
//    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 200, 100)];
//    btn2.backgroundColor = [UIColor redColor];
//    btn2.imageRect = CGRectMake(0, 0, 50, 50);
//    btn2.titleRect = CGRectMake(0, 50, 100, 30);
//    [btn2 setImage:[UIImage imageNamed:@"test.png"] forState:UIControlStateNormal];
//    [btn2 setTitle:@"使用Rect" forState:UIControlStateNormal];
//    [self.view addSubview:btn2];
    
    
    
//    [self synchronized];
    
    
//    [self conditionLock];

//    UIView *v=[[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
//    v.backgroundColor=[UIColor yellowColor];
//    v.layer.masksToBounds=YES;//这行去掉
//    //v.clipsToBounds = YES;
//    
//    v.layer.cornerRadius=20;
//    v.layer.shadowColor=[UIColor redColor].CGColor;
//    v.layer.shadowOffset=CGSizeMake(10, 10);
//    v.layer.shadowOpacity=0.5;
//    v.layer.shadowRadius=5;
//    [self.view addSubview:v];
}


- (void)test
{
    view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handletap:)];
    [view addGestureRecognizer:tap];
    
    
    
    [UIView animateWithDuration:10 delay:0 options:UIViewAnimationOptionCurveLinear |UIViewAnimationOptionAllowUserInteraction animations:^{
        view.frame = CGRectMake(100, 400, 200, 200);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)handletap:(UITapGestureRecognizer *)tap
{

    NSLog(@"tap view.bounds = %@",NSStringFromCGRect(view.bounds));
    NSLog(@"tap view.frame = %@",NSStringFromCGRect(view.frame));
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
   // [self groupAnimation1];
}

- (IBAction)btnClick:(UIButton *)sender {
    
    
    
    [self groupAnimation1];
}

-(void)groupAnimation1{
    
    CGFloat SCREEN_HEIGHT = [UIScreen mainScreen].bounds.size.height;
    CGFloat SCREEN_WIDTH = [UIScreen mainScreen].bounds.size.width;

    // 位移动画
    CAKeyframeAnimation *anima1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(0, SCREEN_HEIGHT/2-50)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2-50)];
    anima1.values = [NSArray arrayWithObjects:value0,value1, nil];
    anima1.beginTime = 0;
    anima1.duration = 2;
    anima1.removedOnCompletion = NO;
    anima1.fillMode = kCAFillModeForwards;
    
    //缩放动画
    CABasicAnimation *anima2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anima2.fromValue = [NSNumber numberWithFloat:1];
    anima2.toValue = [NSNumber numberWithFloat:2.0f];
    anima2.beginTime = 2;
    anima2.duration = 2;
    anima2.removedOnCompletion = NO;
    anima2.fillMode = kCAFillModeForwards;
    
    //组动画
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = [NSArray arrayWithObjects:anima1,anima2, nil];
    groupAnimation.duration = 4.0f;
    groupAnimation.removedOnCompletion = NO;
    groupAnimation.fillMode = kCAFillModeForwards;
    groupAnimation.delegate = self;
    [view.layer addAnimation:groupAnimation forKey:@"groupAnimation"];
    NSLog(@"view.bounds = %@",NSStringFromCGRect(view.bounds));
    NSLog(@"view.frame = %@",NSStringFromCGRect(view.frame));
    NSLog(@"view.layer.frame = %@",NSStringFromCGRect(view.layer.frame));

    //[view.layer addAnimation:anima1 forKey:@"groupAnimation"];
    
}


- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"animationDidStop view.bounds = %@",NSStringFromCGRect(view.bounds));
    NSLog(@"animationDidStop view.frame = %@",NSStringFromCGRect(view.frame));
    NSLog(@"animationDidStop view.layer.frame = %@",NSStringFromCGRect(view.layer.frame));

    view.backgroundColor = [UIColor blueColor];
}

- (void)conditionLock
{
    //主线程中
    NSConditionLock *theLock = [[NSConditionLock alloc] init];
    
    
    
    //线程1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        for (int i=0;i<=3;i++)
//        {
//            [theLock lock];
//            NSLog(@"thread1:%d",i);
//            sleep(1);
//            [theLock unlockWithCondition:i];
//        }
        
        
        [theLock lock];
        NSLog(@"thread1:1");
        sleep(1);
        [theLock unlockWithCondition:1];
        
        [theLock lock];
        NSLog(@"thread1:3");
        sleep(1);
        [theLock unlockWithCondition:3];
        
        [theLock lock];
        NSLog(@"thread1:2");
        sleep(1);
        [theLock unlockWithCondition:10];
        
    });
    
    //线程2
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"线程2");
        [theLock lockWhenCondition:10];
        NSLog(@"thread2");
        [theLock unlock];
    });
}

- (void)synchronized
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        static void (^RecursiveMethod)(int);
        
        RecursiveMethod = ^(int value) {
            NSLog(@"RecursiveMethod %d",value);
            
            @synchronized(self) {
                if (value > 0) {
                    
                    NSLog(@"value = %d", value);
                    sleep(2);
                    RecursiveMethod(value - 1);
                }
            }
        };
        
        RecursiveMethod(5);
    });
}



- (void)recursiveLock
{
    //递归锁
    NSRecursiveLock *lock = [[NSRecursiveLock alloc] init];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        static void (^RecursiveMethod)(int);
        
        RecursiveMethod = ^(int value) {
            NSLog(@"RecursiveMethod %d",value);
            
            [lock lock];
            if (value > 0) {
                
                NSLog(@"value = %d", value);
                sleep(2);
                RecursiveMethod(value - 1);
            }
            [lock unlock];
        };
        
        RecursiveMethod(5);
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

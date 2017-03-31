//
//  ViewController.m
//  Runloop
//
//  Created by ___liangdahong on 16/9/7.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (nonatomic, strong) dispatch_source_t timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // main 线程开启一个定时器1
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(autoTime0) userInfo:nil repeats:YES];
    
    
    // main 线程开启一个定时器2
    NSTimer *timer1 = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(autoTime1) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer1 forMode:NSRunLoopCommonModes];
    
    
    // 子线程开启一个定时器
    dispatch_async(dispatch_get_global_queue(0, DISPATCH_QUEUE_PRIORITY_DEFAULT), ^{
        NSTimer *timer2 = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(autoTime2) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:timer2 forMode:NSRunLoopCommonModes];
        [[NSRunLoop currentRunLoop] run];
    });
    
    // 使用 GCD 开启一共定时器
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        NSLog(@"autoTime3 当前NSRunLoop= %p 模式：%@ 线程：%@", [NSRunLoop currentRunLoop], [[NSRunLoop currentRunLoop] currentMode], [NSThread currentThread]);
    });
    dispatch_resume(timer);
    self.timer = timer;
    
}

- (void)autoTime0 {
    NSLog(@"autoTime0 当前NSRunLoop= %p 模式：%@ 线程：%@", [NSRunLoop currentRunLoop], [[NSRunLoop currentRunLoop] currentMode], [NSThread currentThread]);
}

- (void)autoTime1 {
    NSLog(@"autoTime1 当前NSRunLoop= %p 模式：%@ 线程：%@", [NSRunLoop currentRunLoop], [[NSRunLoop currentRunLoop] currentMode], [NSThread currentThread]);
}

- (void)autoTime2 {
    NSLog(@"autoTime2 当前NSRunLoop= %p 模式：%@ 线程：%@", [NSRunLoop currentRunLoop], [[NSRunLoop currentRunLoop] currentMode], [NSThread currentThread]);
}
@end

//
//  ViewController.m
//  RunLoop
//
//  Created by yi on 17/3/29.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) NSThread *thread;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    

    [self runloopObserver];
    
}






- (void)runloopObserver
{
    //创建监听者
    /*
     第一个参数 CFAllocatorRef allocator：分配存储空间 CFAllocatorGetDefault()默认分配
     第二个参数 CFOptionFlags activities：要监听的状态 kCFRunLoopAllActivities 监听所有状态
     第三个参数 Boolean repeats：YES:持续监听 NO:不持续
     第四个参数 CFIndex order：优先级，一般填0即可
     第五个参数 ：回调 两个参数observer:监听者 activity:监听的事件
     */
    /*
     所有事件
     typedef CF_OPTIONS(CFOptionFlags, CFRunLoopActivity) {
     kCFRunLoopEntry = (1UL << 0),   //   即将进入RunLoop
     kCFRunLoopBeforeTimers = (1UL << 1), // 即将处理Timer
     kCFRunLoopBeforeSources = (1UL << 2), // 即将处理Source
     kCFRunLoopBeforeWaiting = (1UL << 5), //即将进入休眠
     kCFRunLoopAfterWaiting = (1UL << 6),// 刚从休眠中唤醒
     kCFRunLoopExit = (1UL << 7),// 即将退出RunLoop
     kCFRunLoopAllActivities = 0x0FFFFFFFU
     };
     */
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        switch (activity) {
            case kCFRunLoopEntry:
                NSLog(@"RunLoop进入");
                break;
            case kCFRunLoopBeforeTimers:
                NSLog(@"RunLoop要处理Timers了");
                break;
            case kCFRunLoopBeforeSources:
                NSLog(@"RunLoop要处理Sources了");
                break;
            case kCFRunLoopBeforeWaiting:
                NSLog(@"RunLoop要休息了");
                break;
            case kCFRunLoopAfterWaiting:
                NSLog(@"RunLoop醒来了");
                break;
            case kCFRunLoopExit:
                NSLog(@"RunLoop退出了");
                break;
                
            default:
                break;
        }
    });
    
    // 给RunLoop添加监听者
    /*
     第一个参数 CFRunLoopRef rl：要监听哪个RunLoop,这里监听的是主线程的RunLoop
     第二个参数 CFRunLoopObserverRef observer 监听者
     第三个参数 CFStringRef mode 要监听RunLoop在哪种运行模式下的状态
     */
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);
    /*
     CF的内存管理（Core Foundation）
     凡是带有Create、Copy、Retain等字眼的函数，创建出来的对象，都需要在最后做一次release
     GCD本来在iOS6.0之前也是需要我们释放的，6.0之后GCD已经纳入到了ARC中，所以我们不需要管了
     */
    CFRelease(observer);

}


- (void)notificationTest
{
    NSString *NOTIFICATION_NAME = @"NOTIFICATION_NAME";
    NSLog(@"Current thread = %@", [NSThread currentThread]);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:NOTIFICATION_NAME object:nil];

//    NSString *NOTIFICATION_NAME = @"NOTIFICATION_NAME";
//    
////    NSLog(@"Current thread = %@", [NSThread currentThread]);
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:NOTIFICATION_NAME object:nil];
    
    
    
    //创建一个线程
    self.thread = [[NSThread alloc] initWithTarget:self selector:@selector(createRunloopByNormal) object:nil] ;
    //
    //    self.thread = [[NSThread alloc] initWithTarget:self selector:@selector(createRunloopByCFObserver) object:nil] ;
    //
    //    self.thread = [[NSThread alloc] initWithTarget:self selector:@selector(createRunloopByCFTimer) object:nil] ;
    //
    //    self.thread = [[NSThread alloc] initWithTarget:self selector:@selector(createRunloopByCFSource) object:nil] ;
    
    
    [self.thread start];

    
    
    
    // 创建
    //NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(taskB:) object:nil];
    
    // 启动
    //[thread start];

}

-(void)taskB:(NSThread *)thread
{
    for (int i=0; i<20; i++) {
        NSLog(@"B = %d",i);
        
        if(i == 10)
        {
            //停止线程, 发送cancle消息
            [thread cancel];
        }
        
        
        [NSThread sleepForTimeInterval:0.25];
    }
}


//- (void)handleNotification:(NSNotification *)notification {
//    NSLog(@"Receive notification，Current thread = %@", [NSThread currentThread]);
//}

/**
 *  一般创建runloop的方法。结果：成功
 */
- (void)createRunloopByNormal{
    NSLog(@"@createRunloopByNormal");

    @autoreleasepool {
        
        //添加port源，保证runloop正常轮询，不会创建后直接退出。
        [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
        
        //开启runloop
        [[NSRunLoop currentRunLoop] run];
        NSLog(@"@autoreleasepool");
    }
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"-----btnClick--------");
    [self performSelector:@selector(test) onThread:self.thread withObject:nil waitUntilDone:NO];

}


- (void)test{
    NSLog(@"----->Test currentThread = %@",[NSThread currentThread]);
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

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

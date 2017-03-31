//
//  ViewController.m
//  Thread
//
//  Created by __liangdahong on 16/9/7.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)thread {
    
    // 创建一个队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    /*!
     这段代码会发生死锁，因为：
     1.主线程通过dispatch_sync把block交给主队列后，会等待block里的任务结束再往下走自身的任务，
     2.而队列是先进先出的，block里的任务也在等待主队列当中排在它之前的任务都执行完了再走自己。
     这种循环等待就形成了死锁。所以在主线程当中使用dispatch_sync将任务加到主队列是不可取的。
     */
    dispatch_async(dispatch_get_main_queue(), ^{
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"死锁");
        });
    });


    // 1. 启动一个 async 异步任务
    dispatch_async(queue, ^{
        NSLog(@"1. 启动一个 async 异步任务");
    });
    
    
    // 2. 在当前线程上在启动一个任务 (没有启动新的线程)
    dispatch_sync(queue, ^{
        NSLog(@"-dispatch_sync -%@",[NSThread currentThread]);
    });
    
    
    // 3. 多任务处理
    dispatch_group_t group = dispatch_group_create();
    // 添加任务 - 1
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        int i = 1000;
        while (i--) {
            NSLog(@"-任务1 - %d %@",i,[NSThread currentThread]);
        }
    });
    
    
    // 添加任务  - 2
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        int i = 1000;
        while (i--) {
            NSLog(@"-任务2 - %d %@",i,[NSThread currentThread]);
        }
    });
    
    
    // 这些任务全部是异步执行的   此方法检测当任务组 group 没有正在执行的任务的时执行 .... 任务
    dispatch_group_notify(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // 到主线程执行...
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"所有任务执行完成");
            NSLog(@"%@",[NSThread currentThread]);
        });
        
    });
    
    // 4. 延时函数
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    });
    

    // 5. 线程按钮只执行一次代码段
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    });
}

@end

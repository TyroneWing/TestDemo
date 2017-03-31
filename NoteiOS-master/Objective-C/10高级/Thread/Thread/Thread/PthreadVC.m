//
//  PthreadVC.m
//  Thread
//
//  Created by __liangdahong on 16/9/8.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

#import "PthreadVC.h"
#import <pthread.h>

@interface PthreadVC ()

@end
476  hexo generate
477  hexo deploy
// https://avatars1.githubusercontent.com/u/11350373?v=3&s=460
// http://jinyanhuan.github.io/
//avatar: http://tva4.sinaimg.cn/crop.0.0.1242.1242.180/005UCBvSjw8f70mxhjlpij30yi0yidm3.jpg

@implementation PthreadVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    pthread_t pthread;
    pthread_create(&pthread, NULL, ppp, NULL);
    
}

void *ppp(void *pp) {
    NSLog(@"%@", [NSThread currentThread]);
    return NULL;
}

@end

//
//  man.m
//  DemoTest
//
//  Created by __liangdahong on 2017/3/24.
//  Copyright © 2017年 http://idhong.com/. All rights reserved.
//

#import "man.h"

@implementation man
-(instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"man init");
    }
    return self;
}

- (void)run
{
    [super run];
    NSLog(@"man run");
}

@end

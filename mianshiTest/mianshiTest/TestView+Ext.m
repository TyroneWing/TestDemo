//
//  TestView+Ext.m
//  mianshiTest
//
//  Created by __liangdahong on 2017/4/13.
//  Copyright © 2017年 http://idhong.com/. All rights reserved.
//

#import "TestView+Ext.h"

@implementation TestView (Ext)

+(void)load
{
    NSLog(@"%@ (Ext)",NSStringFromClass([self class]));
}


- (void)test
{
    NSLog(@"TestView+Ext test");
}


@end

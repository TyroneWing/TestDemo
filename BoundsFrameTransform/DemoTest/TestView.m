//
//  TestView.m
//  DemoTest
//
//  Created by __liangdahong on 2017/3/24.
//  Copyright © 2017年 http://idhong.com/. All rights reserved.
//

#import "TestView.h"

@implementation TestView


-(instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"TestView init");
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

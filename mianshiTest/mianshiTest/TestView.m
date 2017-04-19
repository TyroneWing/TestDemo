//
//  TestView.m
//  mianshiTest
//
//  Created by __liangdahong on 2017/4/13.
//  Copyright © 2017年 http://idhong.com/. All rights reserved.
//

#import "TestView.h"

@interface TestView ()

@property (nonatomic,assign) int count;

@end


@implementation TestView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _count = 10;
    }
    return self;
}


+(void)load
{
    NSLog(@"%@",NSStringFromClass([self class]));
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adverNsely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

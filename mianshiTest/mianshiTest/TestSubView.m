//
//  TestSubView.m
//  mianshiTest
//
//  Created by __liangdahong on 2017/4/13.
//  Copyright © 2017年 http://idhong.com/. All rights reserved.
//

#import "TestSubView.h"

@implementation TestSubView

- (void)test
{
    NSLog(@"TestSubView test");

}

+(void)load
{
    NSLog(@"%@",NSStringFromClass([self class]));
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

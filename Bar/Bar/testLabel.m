//
//  testLabel.m
//  RuntimeTest
//
//  Created by yi on 17/4/7.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "testLabel.h"

@implementation testLabel

//重写，留白
- (CGSize)intrinsicContentSize
{
    CGSize originalSize = [super intrinsicContentSize];
    CGSize size = CGSizeMake(originalSize.width+10, originalSize.height+10);
    return size;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

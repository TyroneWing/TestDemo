//
//  Man.m
//  self_super
//
//  Created by yi on 17/4/5.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "Man.h"

@implementation Man

- (id)init
{
    self = [super init];
    if (self)
    {
        NSLog(@"%@", NSStringFromClass([self class]));
        NSLog(@"%@", NSStringFromClass([super class]));
        
        [self run];
        
    }
    return self;
}

@end

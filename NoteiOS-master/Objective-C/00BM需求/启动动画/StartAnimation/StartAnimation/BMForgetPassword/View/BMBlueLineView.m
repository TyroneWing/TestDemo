//
//  BMBlueLineView.m
//  StartAnimation
//
//  Created by ___liangdahong on 2016/11/21.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "BMBlueLineView.h"

@implementation BMBlueLineView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor blueColor];
    NSArray* constrains = self.constraints;
    for (NSLayoutConstraint* constraint in constrains) {
        if (constraint.firstAttribute == NSLayoutAttributeHeight) {
            constraint.constant = 0.6;
        }
    }
}

@end

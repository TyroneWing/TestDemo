
//
//  BMShareManager.m
//  BMShareView
//
//  Created by ___liangdahong on 2017/3/9.
//  Copyright © 2017年 http://idhong.com/. All rights reserved.
//

#import "BMShareManager.h"
#import "BMShareView.h"

@implementation BMShareManager

+ (void)showShareManager {

    BMShareView *shareView = [BMShareView shareView];
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [window addSubview:shareView];
    shareView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraintTop = [NSLayoutConstraint constraintWithItem:shareView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:window attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    NSLayoutConstraint *constraintLeft = [NSLayoutConstraint constraintWithItem:shareView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:window attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    NSLayoutConstraint *constraintBottom = [NSLayoutConstraint constraintWithItem:shareView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:window attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    NSLayoutConstraint *constraintRight = [NSLayoutConstraint constraintWithItem:shareView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:window attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    [window addConstraints:@[constraintTop, constraintLeft, constraintBottom, constraintRight]];
}

@end

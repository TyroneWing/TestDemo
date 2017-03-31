//
//  BMStartAnimationView.m
//  StartAnimation
//
//  Created by ___liangdahong on 2016/11/18.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "BMStartAnimationView.h"

@implementation BMStartAnimationView

+ (instancetype)startAnimationView {
    BMStartAnimationView *startAnimationView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    startAnimationView.autoresizingMask = UIViewAutoresizingNone;
    return startAnimationView;
}
@end

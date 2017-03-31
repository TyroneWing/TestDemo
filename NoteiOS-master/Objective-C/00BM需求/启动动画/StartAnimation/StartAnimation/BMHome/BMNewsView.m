//
//  BMNewsView.m
//  StartAnimation
//
//  Created by ___liangdahong on 2016/11/22.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "BMNewsView.h"

@interface BMNewsView ()
@property (nonatomic, copy) dispatch_block_t tapNewsBlock;
@end

@implementation BMNewsView

+ (instancetype)newsViewWithTapActionBlock:(dispatch_block_t)block {
    BMNewsView *view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    view.autoresizingMask = UIViewAutoresizingNone;
    view.tapNewsBlock = block;
    return view;
}
- (IBAction)tapNewsClick {
    if (self.tapNewsBlock) {
        self.tapNewsBlock();
    }
}

@end

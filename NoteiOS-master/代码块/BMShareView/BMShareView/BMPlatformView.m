//
//  BMPlatformView.m
//  BMShareView
//
//  Created by ___liangdahong on 2017/3/9.
//  Copyright © 2017年 http://idhong.com/. All rights reserved.
//

#import "BMPlatformView.h"
#import "Masonry.h"

@interface BMPlatformView ()

@end

@implementation BMPlatformView

- (instancetype)initWithCoder:(NSCoder *)coder {

    if (self = [super initWithCoder:coder]) {
        BMPlatformView *view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return self;
}


@end

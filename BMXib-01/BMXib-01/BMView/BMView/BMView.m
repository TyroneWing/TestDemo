//
//  BMView.m
//  BMXib-01
//
//  Created by ___liangdahong on 2017/3/17.
//  Copyright © 2017年 ___liangdahong. All rights reserved.
//

#import "BMView.h"
#import "Masonry.h"

@interface BMView ()

@property (nonatomic, readwrite, strong) UIView *contentView;

@end

@implementation BMView

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
//        [self addUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addUI];
    }
    return self;
}

- (instancetype)init {
    if (self = [super init]) {
        [self addUI];
        
    }
    return self;
}

- (void)addUI {
    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[[NSBundle bundleForClass:[self class]] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
        _contentView.backgroundColor = [UIColor orangeColor];
    }
    return _contentView;
}

@end

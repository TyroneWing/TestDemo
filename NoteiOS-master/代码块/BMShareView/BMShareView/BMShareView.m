//
//  BMShareView.m
//  BMShareView
//
//  Created by ___liangdahong on 2017/3/9.
//  Copyright © 2017年 http://idhong.com/. All rights reserved.
//

#import "BMShareView.h"
#import "BMPlatformView.h"

@interface BMShareView ()

@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@property (strong, nonatomic) NSMutableArray <BMPlatformView *> *platformViewArray; ///< <#Description#>
@property (weak, nonatomic) IBOutlet UIView *whiteBackgroundView;

@end

@implementation BMShareView

- (void)awakeFromNib {

    [super awakeFromNib];
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBackgroundViewClick)]];
    self.cancelButton.layer.borderWidth = 0.5;
    self.cancelButton.layer.borderColor = [UIColor lightGrayColor].CGColor;

    [self.whiteBackgroundView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[BMPlatformView class]]) {
            [self.platformViewArray addObject:obj];
        }
    }];

    [self.platformViewArray enumerateObjectsUsingBlock:^(BMPlatformView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [UIView animateWithDuration:0.9+idx*0.09 delay:0 usingSpringWithDamping:0.50 initialSpringVelocity:1.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            CGRect buttonFrame = [obj frame];
            buttonFrame.origin.y -= ([[UIScreen mainScreen] bounds].size.width) * 0.09;
            obj.frame = buttonFrame;
        } completion:^(BOOL finished) {
        }];
    }];
    
    [self.platformViewArray enumerateObjectsUsingBlock:^(BMPlatformView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [UIView animateWithDuration:0.9+idx*0.09 delay:0 usingSpringWithDamping:0.50 initialSpringVelocity:1.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            CGRect buttonFrame = [obj frame];
            buttonFrame.origin.y -= ([[UIScreen mainScreen] bounds].size.width) * 0.09;
            obj.frame = buttonFrame;
        } completion:^(BOOL finished) {
        }];
    }];
}

- (NSMutableArray<BMPlatformView *> *)platformViewArray {
    
    if (!_platformViewArray) {
        _platformViewArray = [@[] mutableCopy];
    }
    return _platformViewArray;
}


+ (instancetype)shareView {
    BMShareView *view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    view.autoresizingMask = UIViewAutoresizingNone;
    return view;
}

- (void)tapBackgroundViewClick {
    [self removeFromSuperview];
}

- (IBAction)whiteBackgroundViewTopClick {
    
}
- (IBAction)cancelButtonClick {
    [self removeFromSuperview];
}

@end

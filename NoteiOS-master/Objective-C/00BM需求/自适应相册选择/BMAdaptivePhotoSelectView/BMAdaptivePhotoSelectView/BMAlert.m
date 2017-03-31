//
//  BMAlert.m
//  BMAdaptivePhotoSelectView
//
//  Created by ___liangdahong on 16/9/26.
//  Copyright © 2016年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "BMAlert.h"

@implementation BMAlert

+ (void)alertWithImage:(UIImage *)image {

    BMAlert *alert = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    alert.autoresizingMask = 0;
    alert.frame = [UIScreen mainScreen].bounds;
    alert.aa.image = image;
    [alert addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:alert action:@selector(tap)]];
    [[[UIApplication sharedApplication] keyWindow] addSubview:alert];
}

- (void)tap {
    [self removeFromSuperview];
}
@end

//
//  BMAlertSignView.m
//  Signature
//
//  Created by ___liangdahong on 16/8/31.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

#import "BMAlertSignView.h"

@interface BMAlertSignView ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation BMAlertSignView

+ (void)showWithImage:(UIImage *)image {
    BMAlertSignView *alert = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    alert.autoresizingMask = 0;
    alert.frame = [UIScreen mainScreen].bounds;
    [[[UIApplication sharedApplication] keyWindow] addSubview:alert];
    alert.imageView.image = image;
    
    
}

- (IBAction)topClick:(id)sender {
    [self removeFromSuperview];
}

@end

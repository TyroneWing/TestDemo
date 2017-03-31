//
//  BMScanSettingView.m
//  BMQRBarCode
//
//  Created by ___liangdahong on 16/8/31.
//  Copyright © 2016年 elvin. All rights reserved.
//

#import "BMScanSettingView.h"

@interface BMScanSettingView ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scanViewTopLayout;
@property (nonatomic, copy) dispatch_block_t block;

@end

@implementation BMScanSettingView

+ (instancetype)scanSettingViewWithInputButtonClickBlock:(dispatch_block_t)block {
    BMScanSettingView *scanSettingView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    scanSettingView.autoresizingMask = UIViewAutoresizingNone;
    scanSettingView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64);
    scanSettingView.scanViewTopLayout.constant = kSCANSCANVIEWTOP;
    scanSettingView.block = block;
    return scanSettingView;
}
- (IBAction)inputButtonClick:(id)sender {
    if (_block) {
        _block();
    }
}
@end

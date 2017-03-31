//
//  BMSignatureView.m
//  Signature
//
//  Created by ___liangdahong on 16/8/31.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

#import "BMSignatureView.h"
#define kINITIAL_LABEL_TEXT @"在此签名";

@interface BMSignatureView ()
{
    CGPoint points[5];
}

@property (nonatomic, strong) UIBezierPath *beizerPath;
@property (nonatomic, strong) UIImage *incrImage;
@property (nonatomic, assign) uint control;
@property (nonatomic, strong) UILabel *lblSignature;
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, strong, readwrite) UIImage *signatureImage;
@end

@implementation BMSignatureView

+ (instancetype)signatureViewWithFrame:(CGRect)frame title:(NSString *)title {
    return nil;
}
+ (instancetype)signatureViewWithFrame:(CGRect)frame promptView:(UIView *)promptView {
    return nil;
}
- (void)clear {
}

@end

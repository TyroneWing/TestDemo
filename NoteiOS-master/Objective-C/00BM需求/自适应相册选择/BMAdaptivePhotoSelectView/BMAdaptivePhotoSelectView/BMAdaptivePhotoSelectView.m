//
//  BMAdaptivePhotoSelectView.m
//  BMAdaptivePhotoSelectView
//
//  Created by ___liangdahong on 16/9/26.
//  Copyright © 2016年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "BMAdaptivePhotoSelectView.h"
#import "BMAdaptivePhotoSelectImageView.h"
#import "BMAlert.h"

#define kBMAdaptivePhotoSelectViewWidth [[UIScreen mainScreen] bounds].size.width

@implementation BMAdaptivePhotoSelectView

- (CGFloat)autolayoutWidth {
    return kBMAdaptivePhotoSelectViewWidth;
}

/*初始化UI*/
- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    __block CGFloat x = 0;
    __block CGFloat y = 0;

    CGFloat w = ([self autolayoutWidth]-(([self autolayoutCount]-1)*[self autolayoutSpacing]))/[self autolayoutCount];

    BMAdaptivePhotoSelectImageView *adaptivePhotoSelectImageView = [BMAdaptivePhotoSelectImageView adaptivePhotoSelectImageViewWithFrame:CGRectMake(x, y, w, w)
                                                               boothImage:[UIImage imageNamed:self.boothString]
                                                              selectImage:nil addImageViewEndBlock:^(UIImage *image) {
                                                                  [self addImageViewEndWithImage:image];
                                                              } removeImageEndBlock:^(UIImage *image) {
                                                                  [self removeImageEndWithImage:image];
                                                              } tapImageBlock:^(UIImage *image) {
                                                                  [self tapImageWithImage:image];
                                                              }];
    [self addSubview:adaptivePhotoSelectImageView];
    // 计算高度
    CGFloat fittingHeight = y+w;
    NSArray* constrains = self.constraints;
    for (NSLayoutConstraint* constraint in constrains) {
        if (constraint.firstAttribute == NSLayoutAttributeHeight) {
            constraint.constant = fittingHeight;
        }
    }
}

- (void)addImageViewEndWithImage:(UIImage *)image {
    // ADD
    NSMutableArray *images = [self.imageArray mutableCopy];
    [images addObject:image];
    [self aaWithArr:images];
}

- (void)removeImageEndWithImage:(UIImage *)image {
    NSMutableArray *images = [self.imageArray mutableCopy];
    [images enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj == image) {
            [images removeObjectAtIndex:idx];
            *stop = YES;
        }
    }];
    [self aaWithArr:images];
}

- (void)tapImageWithImage:(UIImage *)image {
    [BMAlert alertWithImage:image];
}

- (void)aaWithArr:(NSArray <UIImage *>*)arr {
    
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    __block CGFloat x = 0;
    __block CGFloat y = 0;
    CGFloat w = ([self autolayoutWidth]-(([self autolayoutCount]-1)*[self autolayoutSpacing]))/[self autolayoutCount];

    [arr enumerateObjectsUsingBlock:^(UIImage * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        BMAdaptivePhotoSelectImageView *adaptivePhotoSelectImageView =
        [BMAdaptivePhotoSelectImageView
         adaptivePhotoSelectImageViewWithFrame:CGRectMake(x, y, w, w)
         boothImage:nil
         selectImage:obj addImageViewEndBlock:^(UIImage *image) {
             [self addImageViewEndWithImage:image];
         } removeImageEndBlock:^(UIImage *image) {
             [self removeImageEndWithImage:image];
         } tapImageBlock:^(UIImage *image) {
             [self tapImageWithImage:image];
         }];
        [self addSubview:adaptivePhotoSelectImageView];
        x += (w+[self autolayoutSpacing]);
        
        if (idx > 0 && (idx+1) % [self autolayoutCount] == 0) {
            x = 0;
            y = y+[self autolayoutSpacing]+w;
        }
    }];
    if (arr.count < self.maximumCount) {
        BMAdaptivePhotoSelectImageView *adaptivePhotoSelectImageView =
        [BMAdaptivePhotoSelectImageView
         adaptivePhotoSelectImageViewWithFrame:CGRectMake(x, y, w, w)
         boothImage:[UIImage imageNamed:self.boothString]
         selectImage:nil addImageViewEndBlock:^(UIImage *image) {
             [self addImageViewEndWithImage:image];
         } removeImageEndBlock:^(UIImage *image) {
             [self removeImageEndWithImage:image];
         } tapImageBlock:^(UIImage *image) {
             [self tapImageWithImage:image];
         }];
        [self addSubview:adaptivePhotoSelectImageView];
        x += (w+[self autolayoutSpacing]);
    }
    // 计算高度
    CGFloat fittingHeight = y+w;
    NSArray* constrains = self.constraints;
    for (NSLayoutConstraint* constraint in constrains) {
        if (constraint.firstAttribute == NSLayoutAttributeHeight) {
            constraint.constant = fittingHeight;
        }
    }
}

- (NSArray<UIImage *> *)imageArray {
    NSMutableArray *muarray = [@[] mutableCopy];
    for (BMAdaptivePhotoSelectImageView *image in self.subviews) {
        if ([image isKindOfClass:[BMAdaptivePhotoSelectImageView class]]) {
            if (image.selectImage) {
                [muarray addObject:image.selectImage];
            }
        }
    }
    return muarray;
}
@end

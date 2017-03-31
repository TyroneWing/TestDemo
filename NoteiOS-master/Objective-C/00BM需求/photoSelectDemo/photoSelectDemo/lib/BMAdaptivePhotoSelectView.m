//
//  BMAdaptivePhotoSelectView.m
//  BMAdaptivePhotoSelectView
//
//  Created by ___liangdahong on 16/9/26.
//  Copyright © 2016年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "BMAdaptivePhotoSelectView.h"
#import "BMAdaptivePhotoSelectImageView.h"
#import "BMAdaptiveTopsPhotoSelectImageView.h"
#import "ZLPhoto.h"
#import "BMImageViewBrowseView.h"

#define kBMAdaptivePhotoSelectViewWidth [[UIScreen mainScreen] bounds].size.width

@interface BMAdaptivePhotoSelectView ()
@property (nonatomic, strong) BMAdaptiveTopsPhotoSelectImageView *adaptiveTopsPhotoSelectImageView;
@property (nonatomic, strong) NSMutableArray <ZLPhotoAssets *> *photoAssetsArray;
@property (nonatomic, strong) NSMutableArray <UIImage *>*zxjphotoAssets;

@end

@implementation BMAdaptivePhotoSelectView

- (CGFloat)autolayoutWidth {
    return kBMAdaptivePhotoSelectViewWidth;
}

- (NSMutableArray *)zxjphotoAssets {
    if (!_zxjphotoAssets) {
        _zxjphotoAssets = [@[] mutableCopy];
    }
    return _zxjphotoAssets;
}

- (void)setVc:(UIViewController *)vc {
    _vc = vc;
    self.adaptiveTopsPhotoSelectImageView.vc = vc;
}
/*初始化UI*/
- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    __block CGFloat x = 0;
    __block CGFloat y = 0;
    CGFloat w = ([self autolayoutWidth]-(([self autolayoutCount]-1)*[self autolayoutSpacing]))/[self autolayoutCount];
    self.adaptiveTopsPhotoSelectImageView = [BMAdaptiveTopsPhotoSelectImageView adaptiveTopsPhotoSelectImageViewWithFrame:CGRectMake(x, y, w, w) photoAssets:self.photoAssetsArray block:^(NSArray<UIImage *> *imags, NSArray<ZLPhotoAssets *> *photoAssets,NSArray<UIImage *> *zxjimags) {
        
        // 相册图片
        self.photoAssetsArray = [photoAssets ? photoAssets : @[] mutableCopy];
        
        // 照相机图片
        self.zxjphotoAssets = [zxjimags ? zxjimags : @[] mutableCopy];
        
        // 更新UI
        NSMutableArray *muarray = [@[] mutableCopy];
        
        [muarray addObjectsFromArray:self.zxjphotoAssets];
        
        for (ZLPhotoAssets *ass in self.photoAssetsArray) {
            [muarray addObject:ass.thumbImage];
        }
        [self aaWithArr:muarray];
    }];
    self.adaptiveTopsPhotoSelectImageView.vc = self.vc;
    self.adaptiveTopsPhotoSelectImageView.newMaxCount = 5;
    [self addSubview:self.adaptiveTopsPhotoSelectImageView];
    
    // 计算高度
    CGFloat fittingHeight = y+w;
    NSArray* constrains = self.constraints;
    for (NSLayoutConstraint* constraint in constrains) {
        if (constraint.firstAttribute == NSLayoutAttributeHeight) {
            constraint.constant = fittingHeight;
        }
    }
}

- (void)removeImageEndWithImage:(UIImage *)image {

    __block BOOL sel = NO;
    [self.photoAssetsArray enumerateObjectsUsingBlock:^(ZLPhotoAssets * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.thumbImage isEqual:image]) {
            [self.photoAssetsArray removeObjectAtIndex:idx];
            sel = YES;
            *stop = YES;
        }
    }];
    
    if (!sel) {
        [self.zxjphotoAssets enumerateObjectsUsingBlock:^(UIImage * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isEqual:image]) {
                [self.zxjphotoAssets removeObjectAtIndex:idx];
                sel = YES;
            }
        }];
    }
    // 更新UI
    NSMutableArray *muarray = [@[] mutableCopy];
    
    [muarray addObjectsFromArray:self.zxjphotoAssets];
    
    for (ZLPhotoAssets *ass in self.photoAssetsArray) {
        [muarray addObject:ass.thumbImage];
    }
    [self aaWithArr:muarray];
}

- (void)tapImageWithImage:(UIImage *)image {
    [BMImageViewBrowseView showImageViewBrowseViewWithImage:image];
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
        
        NSUInteger maxCount = 0;
        maxCount = 5-(self.zxjphotoAssets.count);
        
        CGFloat w = ([self autolayoutWidth]-(([self autolayoutCount]-1)*[self autolayoutSpacing]))/[self autolayoutCount];
        BMAdaptiveTopsPhotoSelectImageView *adaptiveTopsPhotoSelectImageView = [BMAdaptiveTopsPhotoSelectImageView adaptiveTopsPhotoSelectImageViewWithFrame:CGRectMake(x, y, w, w) photoAssets:self.photoAssetsArray block:^(NSArray<UIImage *> *imags, NSArray<ZLPhotoAssets *> *photoAssets, NSArray<UIImage *> *zxjimags) {
     
            // 相册图片
            self.photoAssetsArray = [photoAssets ? photoAssets : @[] mutableCopy];
            
            // 照相机图片
            [self.zxjphotoAssets addObjectsFromArray:zxjimags ? zxjimags : @[]];

            // 更新UI
            NSMutableArray *muarray = [@[] mutableCopy];
            [muarray addObjectsFromArray:self.zxjphotoAssets];
            for (ZLPhotoAssets *ass in self.photoAssetsArray) {
                [muarray addObject:ass.thumbImage];
            }
            [self aaWithArr:muarray];
        }];
        adaptiveTopsPhotoSelectImageView.vc = self.vc;
        adaptiveTopsPhotoSelectImageView.newMaxCount = maxCount;
        [self addSubview:adaptiveTopsPhotoSelectImageView];
        x += (w+[self autolayoutSpacing]);
    }else {
        if (arr.count > 0 && arr.count % [self autolayoutCount] == 0) {
            y = y-([self autolayoutSpacing]+w);
        }
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
    [muarray addObjectsFromArray:self.zxjphotoAssets];
    for (ZLPhotoAssets *ass in self.photoAssetsArray) {
        [muarray addObject:ass.thumbImage];
    }
    return muarray;
}
@end

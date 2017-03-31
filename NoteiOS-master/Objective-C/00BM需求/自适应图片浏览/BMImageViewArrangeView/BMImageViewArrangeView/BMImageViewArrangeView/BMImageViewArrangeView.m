
//
//  BMImageViewArrangeView.m
//  BMTestImageViewArrangeView
//
//  Created by __liangdahong on 16/9/26.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "BMImageViewArrangeView.h"
#import "UIImageView+WebCache.h"
#import <objc/runtime.h>

@implementation BMImageViewArrangeView

- (void)setImageUrlArray:(NSArray<NSString *> *)imageUrlArray {
    _imageUrlArray = imageUrlArray;
    [self _setViewWithImageUrlArray:imageUrlArray ImageArray:nil];
}

- (void)setImageArray:(NSArray<UIImage *> *)imageArray {
    _imageArray = imageArray;
    [self _setViewWithImageUrlArray:nil ImageArray:imageArray];
}

- (void)_setViewWithImageUrlArray:(NSArray<NSString *> *)imageUrlArray ImageArray:(NSArray<UIImage *> *)imageArray {

    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    __block CGFloat x = 0;
    __block CGFloat y = 0;
    
    [self layoutIfNeeded];
    
    NSArray *objs = imageUrlArray ;
    if (!objs) {
        objs = imageArray;
    }
    BOOL isImage  = imageUrlArray ? NO : YES;;
    
    CGFloat w = (self.frame.size.width-(([self autolayoutCount]-1)*[self autolayoutSpacing]))/[self autolayoutCount];
    
    [objs enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx > 0 && (idx) % [self autolayoutCount] == 0) {
            x = 0;
            y = y+[self autolayoutSpacing]+w;
        }
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, w, w)];
        
        if (isImage) {
            image.image = obj;
        }else{
            [image sd_setImageWithURL:[NSURL URLWithString:obj] placeholderImage:nil options:SDWebImageRetryFailed | SDWebImageLowPriority];
        }

        [self addSubview:image];
        image.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_selectImageViewClick:)];
        [image addGestureRecognizer:tap];
        objc_setAssociatedObject(tap, @selector(_selectImageViewClick:), obj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        x += (w+[self autolayoutSpacing]);
    }];

    // 计算高度
    CGFloat fittingHeight = y+w;
    if (objs.count == 0) fittingHeight = 0;
    
    NSArray* constrains = self.constraints;
    for (NSLayoutConstraint* constraint in constrains) {
        if (constraint.firstAttribute == NSLayoutAttributeHeight) {
            constraint.constant = fittingHeight;
        }
    }
}

- (void)_selectImageViewClick:(UITapGestureRecognizer *)tap {
    id image = objc_getAssociatedObject(tap, _cmd);
    if (self.imageViewArrangeViewTapImageBlock) {
        self.imageViewArrangeViewTapImageBlock(image);
    }
}
@end

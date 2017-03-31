//
//  BMAdaptiveTopsPhotoSelectImageView.h
//  BMBlueMoonAngel
//
//  Created by ___liangdahong on 16/9/29.
//  Copyright © 2016年 elvin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLPhoto.h"

typedef void(^BMAdaptiveTopsPhotoSelectImageViewBlock)(NSArray<UIImage *> *imags, NSArray <ZLPhotoAssets *> *photoAssets, NSArray<UIImage *> *zxjimags);

@interface BMAdaptiveTopsPhotoSelectImageView : UIView

@property (nonatomic, strong) UIViewController *vc;

@property (nonatomic, assign) NSUInteger newMaxCount;

+ (instancetype)adaptiveTopsPhotoSelectImageViewWithFrame:(CGRect)frame
                                              photoAssets:(NSArray <ZLPhotoAssets *> *)photoAssets
                                                    block:(BMAdaptiveTopsPhotoSelectImageViewBlock)block;

@end

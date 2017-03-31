//
//  BMAdaptivePhotoSelectImageView.h
//  BMAdaptivePhotoSelectView
//
//  Created by ___liangdahong on 16/9/26.
//  Copyright © 2016年 月亮小屋（中国）有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BMAdaptiveAddImageViewBlock)(UIImage *image);

@interface BMAdaptivePhotoSelectImageView : UIView

@property (nonatomic, strong) UIImage *selectImage;

+ (instancetype)adaptivePhotoSelectImageViewWithFrame:(CGRect)frame
                                           boothImage:(UIImage *)boothImage
                                          selectImage:(UIImage *)selectImage
                                 addImageViewEndBlock:(BMAdaptiveAddImageViewBlock)addImageViewEndBlock
                                  removeImageEndBlock:(BMAdaptiveAddImageViewBlock)removeImageEndBlock
                                        tapImageBlock:(BMAdaptiveAddImageViewBlock)tapImageBlock;

@end

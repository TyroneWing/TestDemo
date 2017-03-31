//
//  BMAdaptivePhotoSelectView.h
//  BMAdaptivePhotoSelectView
//
//  Created by ___liangdahong on 16/9/26.
//  Copyright © 2016年 月亮小屋（中国）有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMAdaptivePhotoSelectImageView.h"

typedef void(^BMAdaptivePhotoSelectViewBlock)(NSArray<BMAdaptivePhotoSelectImageView *> *imageArray);

@interface BMAdaptivePhotoSelectView : UIView

@property (nonatomic, assign) NSUInteger autolayoutCount;
@property (nonatomic, assign) CGFloat autolayoutSpacing;
@property (nonatomic, assign) NSUInteger maximumCount;

/*icon_washClothes_noOrder_Plus*/
@property (nonatomic, strong) NSString *boothString;

@property (nonatomic, strong, readonly) NSArray <UIImage *>* imageArray;

@property (nonatomic, strong) UIViewController *vc;

- (CGFloat)autolayoutWidth;

@end

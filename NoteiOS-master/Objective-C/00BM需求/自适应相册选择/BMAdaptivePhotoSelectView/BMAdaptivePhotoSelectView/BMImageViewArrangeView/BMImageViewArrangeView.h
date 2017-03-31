//
//  BMImageViewArrangeView.h
//  BMTestImageViewArrangeView
//
//  Created by __liangdahong on 16/9/26.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BMImageViewArrangeViewTapImageBlock)(id image);

@interface BMImageViewArrangeView : UIView

@property (nonatomic, assign) NSUInteger autolayoutCount;

@property (nonatomic, assign) CGFloat autolayoutSpacing;

@property (nonatomic, strong) NSArray <NSString *>* imageUrlArray;

@property (nonatomic, strong) NSArray <UIImage *>* imageArray;

/*@brief 回调block*/
@property (nonatomic, copy) BMImageViewArrangeViewTapImageBlock imageViewArrangeViewTapImageBlock;
@end

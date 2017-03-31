//
//  BMViewController.m
//  BMBlueMoonAngel
//
//  Created by ___liangdahong on 2016/12/23.
//  Copyright © 2016年 Bluemoon. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 BMSlideSelectChildView
 */
@class BMSlideSelectChildView;

/**
 view 点击

 @param slideSelectChildView 当前的view
 */
typedef void(^BMSlideSelectChildViewSelectBlock)(BMSlideSelectChildView *slideSelectChildView);

/**
 滑动选择器的子view  内部使用
 */
@interface BMSlideSelectChildView : UIView

/**
 标题label
 */
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

/**
 选中和取消
 */
@property (nonatomic, assign, getter=isSelect) BOOL select;

/**
 创建 滑动选择器的子view

 @param frame frame
 @param imageUrl 图片
 @param title title
 @param block 点击block
 @return 创建的view
 */
+ (instancetype)slideSelectChildViewWithFrame:(CGRect)frame
                                     imageUrl:(NSString *)imageUrl
                                        title:(NSString *)title
                               tapSelectBlock:(BMSlideSelectChildViewSelectBlock)block;
@end

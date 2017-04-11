//
//  UITextView+BMPlaceholder.h
//  BMWash
//
//  Created by ___liangdahong on 2017/3/2.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 为 UITextView 添加 placeholder 功能
 */
@interface UITextView (BMPlaceholder)

@property (strong, nonatomic, setter=bm_setPlaceholder:) NSString *bm_placeholder; ///< 占位符 UITextFiled 一样使用

@property (strong, nonatomic, readonly) UILabel *bm_placeholderLabel;              ///< 占位符Label 可以取出进行自定义

@end

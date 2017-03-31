//
//  UITextView+BMInputLengthLimit.h
//  UITextViewStringLength
//
//  Created by ___liangdahong on 2017/3/7.
//  Copyright © 2017年 http://idhong.com/. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^BMContentSuperLimitBlock)(UITextView *textView, NSRange range, NSString *string);

/**
 UITextView 长度限制工具类
 */
@interface UITextView (BMInputLengthLimit)

/**
 设置 UITextView最大输入字符串限制 为 0 或者 负 为不限制
 */
@property (assign, nonatomic, setter=bm_setMaxLimitNumber:) NSInteger bm_maxLimitNumber;

/**
 设置当超出限制时的block
 */
@property (copy, nonatomic, setter=bm_setContentSuperLimitBlocK:) BMContentSuperLimitBlock bm_contentSuperLimitBlock;

/**
 设置数量限制和回调超过时block

 @param limitNumber 限制
 @param contentSuperLimitBlock block
 */
- (void)bm_setInputLimitWithMaxLimitNumber:(NSInteger)limitNumber contentSuperLimitBlock:(BMContentSuperLimitBlock)contentSuperLimitBlock;

@end

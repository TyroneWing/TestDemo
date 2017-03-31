//
//  UITextView+BMInputLengthLimit.m
//  UITextViewStringLength
//
//  Created by ___liangdahong on 2017/3/7.
//  Copyright © 2017年 http://idhong.com/. All rights reserved.
//

#import "UITextView+BMInputLengthLimit.h"
#import <objc/runtime.h>

#pragma mark - BMAddTextViewDelegate

@interface BMAddTextViewDelegate : NSObject

@end

@implementation BMAddTextViewDelegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if (text.length == 0) {
        return YES;
    }
    if ((range.location + text.length > textView.bm_maxLimitNumber)) {
        if (textView.bm_contentSuperLimitBlock) {
            textView.bm_contentSuperLimitBlock(textView, range, text);
        }
        return NO;
    }
    return YES;
}

@end

#pragma mark - NSObject (BMTextViewDelegate)

@interface NSObject (BMTextViewDelegate)
@end

@implementation NSObject (BMTextViewDelegate)

- (BOOL)_textViewDelegateTextView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    BOOL b = [self _textViewDelegateTextView:textView shouldChangeTextInRange:range replacementText:text];
    if (!b) {
        return NO;
    }

    if (text.length == 0) {
        return YES;
    }
    if ((range.location + text.length > textView.bm_maxLimitNumber)) {
        if (textView.bm_contentSuperLimitBlock) {
            textView.bm_contentSuperLimitBlock(textView, range, text);
        }
        return NO;
    }
    return YES;
}

@end

#pragma mark - UITextView()

@interface  UITextView() <UITextViewDelegate>

@property (assign, nonatomic) BOOL isSetMaxNumber; ///< 是否设置过

@end

@implementation UITextView (BMInputLengthLimit)

#pragma mark -

#pragma mark - getters setters

- (NSInteger)bm_maxLimitNumber {

    NSInteger max = [objc_getAssociatedObject(self, _cmd) integerValue];
    
    if (max <= 0) {
        return NSIntegerMax;
    }
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

- (void)bm_setMaxLimitNumber:(NSInteger)bm_maxLimitNumber {
    
    objc_setAssociatedObject(self, @selector(bm_maxLimitNumber), @(bm_maxLimitNumber), OBJC_ASSOCIATION_ASSIGN);

    // 已设置过
    if (self.isSetMaxNumber) {
        return;
    }
    
    // 取textView 的代理
    id delegate = self.delegate;
    
    if (!delegate) {
        // 没有设置直接设置为他自己即可处理限制
        self.delegate = self;
    } else {
        // 如果外面有设置代理而且实现了方法
        if ([self.delegate respondsToSelector:@selector(textView:shouldChangeTextInRange:replacementText:)]) {
            // 获取imageName:方法的地址
            Method oldMethod = class_getInstanceMethod([delegate class], @selector(textView:shouldChangeTextInRange:replacementText:));
            // 获取wg_imageWithName:方法的地址
            Method newMethod = class_getInstanceMethod([delegate class], @selector(_textViewDelegateTextView:shouldChangeTextInRange:replacementText:));
            // 交换方法地址，相当于交换实现方式
            method_exchangeImplementations(oldMethod, newMethod);
        } else {
            // 如果外面有设置代理 没有实现方法
            SEL sel = @selector(textView:shouldChangeTextInRange:replacementText:);
            Method method = class_getInstanceMethod([BMAddTextViewDelegate class], sel);
            IMP imp = method_getImplementation(method);
            const char *methodTypeEncoding = method_getTypeEncoding(method);
            class_addMethod([delegate class], sel, imp, methodTypeEncoding);
        }
    }
    self.isSetMaxNumber = YES;
}

- (void)bm_setContentSuperLimitBlocK:(BMContentSuperLimitBlock)bm_contentSuperLimitBlock {

    objc_setAssociatedObject(self, @selector(bm_contentSuperLimitBlock), bm_contentSuperLimitBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}

- (BMContentSuperLimitBlock)bm_contentSuperLimitBlock {

    return objc_getAssociatedObject(self, _cmd);
}

#pragma mark - 系统delegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if (text.length == 0) {
        return YES;
    }
    if ((range.location + text.length > textView.bm_maxLimitNumber)) {
        if (textView.bm_contentSuperLimitBlock) {
            textView.bm_contentSuperLimitBlock(textView, range, text);
        }
        return NO;
    }
    return YES;
}

#pragma mark - 自定义delegate

#pragma mark - 公有方法

- (void)bm_setInputLimitWithMaxLimitNumber:(NSInteger)limitNumber contentSuperLimitBlock:(BMContentSuperLimitBlock)contentSuperLimitBlock {
    
    self.bm_contentSuperLimitBlock = contentSuperLimitBlock;
    self.bm_maxLimitNumber = limitNumber;
}

#pragma mark - 私有方法

- (BOOL)isSetMaxNumber {
    
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setIsSetMaxNumber:(BOOL)isSetMaxNumber {
    
    objc_setAssociatedObject(self, @selector(isSetMaxNumber), @(isSetMaxNumber), OBJC_ASSOCIATION_ASSIGN);
}

@end

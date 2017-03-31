//
//  UITextView+BMPlaceholder.m
//  BMWash
//
//  Created by ___liangdahong on 2017/3/2.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "UITextView+BMPlaceholder.h"
#import <objc/runtime.h>

@implementation UITextView (BMPlaceholder)

- (NSString *)bm_placeholder {
    
    return objc_getAssociatedObject(self, _cmd);
}

- (void)bm_setPlaceholder:(NSString *)bm_placeholder {
    
    self.bm_placeholderLabel.text = bm_placeholder;
}

- (UILabel *)bm_placeholderLabel {
    
    UILabel *placeHolderLabel = objc_getAssociatedObject(self, _cmd);
    
    if (!placeHolderLabel) {
        placeHolderLabel                 = [UILabel new];
        placeHolderLabel.numberOfLines   = 0;
        placeHolderLabel.textColor       = [UIColor lightGrayColor];
        placeHolderLabel.backgroundColor = [UIColor clearColor];
        placeHolderLabel.font            = [UIFont systemFontOfSize:13];
        [placeHolderLabel sizeToFit];
        [self addSubview:placeHolderLabel];
        [self setValue:placeHolderLabel forKey:@"_placeholderLabel"];
        objc_setAssociatedObject(self, _cmd, placeHolderLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        self.text = self.text;

        // 为了处理当在添加 placeholder前已经设置内容 和 使用 frame 初始化时的布局问题
        if (self.text.length) {
            self.text = self.text;
        } else {
            self.text = @" ";
            self.text = nil;
        }
    }
    return placeHolderLabel;
}

@end

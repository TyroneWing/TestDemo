//
//  BMDeliveryFeedbackMarkView.m
//  ScrollViewEmptyData
//
//  Created by ___liangdahong on 2017/3/7.
//  Copyright © 2017年 http://idhong.com/. All rights reserved.
//

#import "BMDeliveryFeedbackMarkView.h"

@interface BMDeliveryFeedbackMarkView ()

@property (weak, nonatomic) IBOutlet UITextView *markTextView;
@property (copy, nonatomic) dispatch_block_t reloadBlock;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *markTextViewLayoutConstraintHeight;

@end

@implementation BMDeliveryFeedbackMarkView

- (void)awakeFromNib {
    [super awakeFromNib];

    self.markTextView.scrollEnabled = NO;
    
    UITableView;
    
    [self.markTextView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
}

- (void)dealloc {

    [self.markTextView removeObserver:self forKeyPath:@"contentSize"];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([change[NSKeyValueChangeNewKey] CGSizeValue].height == [change[NSKeyValueChangeOldKey] CGSizeValue].height || !self.markTextView.isFirstResponder) {
        return;
        
    }
    CGFloat height = [change[NSKeyValueChangeNewKey] CGSizeValue].height;

    self.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, height + 20);
    if (self.reloadBlock) {
        self.reloadBlock();
    }
}

+ (instancetype)deliveryFeedbackMarkViewReload:(dispatch_block_t)reloadBlock {

    BMDeliveryFeedbackMarkView *view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    view.autoresizingMask = 0;
    view.reloadBlock = reloadBlock;
    return view;
}

@end

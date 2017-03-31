//
//  BMViewController.m
//  BMBlueMoonAngel
//
//  Created by ___liangdahong on 2016/12/23.
//  Copyright © 2016年 Bluemoon. All rights reserved.
//

#import "BMSlideSelectChildView.h"

@interface BMSlideSelectChildView ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *selectButton;
@property (nonatomic, copy) BMSlideSelectChildViewSelectBlock selectBlock;
@end

@implementation BMSlideSelectChildView

#pragma mark -
#pragma mark - init
#pragma mark - getters setters

- (void)setSelect:(BOOL)select {
    _select = select;
    self.selectButton.selected = select;
}

#pragma mark - 系统delegate
#pragma mark - 自定义delegate
#pragma mark - 公有方法
#pragma mark - 私有方法
#pragma mark - 事件响应

+ (instancetype)slideSelectChildViewWithFrame:(CGRect)frame
                                     imageUrl:(NSString *)imageUrl
                                        title:(NSString *)title
                               tapSelectBlock:(BMSlideSelectChildViewSelectBlock)block {
    BMSlideSelectChildView *view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    view.autoresizingMask = UIViewAutoresizingNone;
    view.frame = frame;
    view.selectBlock = block;
    view.titleLabel.text = title;
    view.titleLabel.adjustsFontSizeToFitWidth = YES;
    return view;
}

- (IBAction)selectButtonClick {
    if (self.selectBlock) {
        self.selectBlock(self);
    }
}
@end

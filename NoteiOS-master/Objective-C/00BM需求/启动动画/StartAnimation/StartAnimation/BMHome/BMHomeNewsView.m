//
//  BMHomeNewsView.m
//  StartAnimation
//
//  Created by ___liangdahong on 2016/11/22.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "BMHomeNewsView.h"
#import "BMNewsView.h"
#import "Masonry.h"

@interface BMHomeNewsView ()
@property (nonatomic, strong) BMNewsView *newsView;
@property (nonatomic, assign) CGFloat maxWidth;

@end

@implementation BMHomeNewsView

#pragma mark -
#pragma mark - init
- (void)awakeFromNib {
    [super awakeFromNib];

    [self addSubview:self.newsView];
    [self.newsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}
#pragma mark - getters setters

- (BMNewsView *)newsView {
    if (!_newsView) {
        _newsView = [BMNewsView newsViewWithTapActionBlock:^{
            if (self.tapBlock) {
                self.tapBlock();
            }
        }];
    }
    return _newsView;
}

- (void)setNewsString:(NSString *)newsString {
    _newsString = newsString;

    if (!newsString || newsString.length == 0) {
        self.hidden = YES;
    }else {
        self.hidden = NO;
    }

    CGFloat w = [[UIScreen mainScreen] bounds].size.width;
    CGSize maxSize = [self getSizeWithMaxSize:CGSizeMake(MAXFLOAT, 10) font:[UIFont systemFontOfSize:13] string:newsString];
    [self.newsView.backgroundView.layer removeAllAnimations];
    if (maxSize.width <= w-90) {
        self.newsView.newsLabel1.text = newsString;
        self.newsView.newsLabel2.text = nil;
        self.newsView.newsLabel3.text = nil;
        return;
    }
    self.newsView.newsLabel1.text = newsString;
    self.newsView.newsLabel2.text = newsString;
    self.newsView.newsLabel3.text = newsString;
    self.maxWidth = maxSize.width +100;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.newsView.backgroundView.layer addAnimation:[self getAnimation] forKey:nil];
    });
}

#pragma mark - 系统delegate
#pragma mark - 自定义delegate
#pragma mark - 公有方法
#pragma mark - 私有方法
- (CGSize)getSizeWithMaxSize:(CGSize )maxSize
                        font:(UIFont *)font
                      string:(NSString *)string {
    CGRect frame = [string boundingRectWithSize:maxSize
                                        options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                     attributes:@{NSFontAttributeName :font}
                                        context:nil];
    return frame.size;
}
- (CABasicAnimation *)getAnimation {
    
    // 说明这个动画对象要对CALayer的position属性执行动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    // 动画持续1.5s
    animation.duration =self.maxWidth*3/120.0;

    // position属性值从(50, 80)渐变到(300, 350)
    animation.fromValue = @0;
    animation.toValue = @(-self.maxWidth);

    animation.repeatCount = INT_MAX;
    
    // 保持动画执行后的状态
    animation.removedOnCompletion = NO;
    
    animation.fillMode = kCAFillModeForwards;
    return animation;
}

#pragma mark - 事件响应

@end

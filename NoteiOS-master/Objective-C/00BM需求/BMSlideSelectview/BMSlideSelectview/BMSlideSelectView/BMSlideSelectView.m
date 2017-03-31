//
//  BMViewController.m
//  BMBlueMoonAngel
//
//  Created by ___liangdahong on 2016/12/23.
//  Copyright © 2016年 Bluemoon. All rights reserved.
//

#import "BMSlideSelectView.h"
#import "BMSlideSelectChildView.h"
#import "UIColor+BMExtension.h"

@implementation BMSlideSelectModel @end

@interface BMSlideSelectView ()

@property (strong, nonatomic) UIScrollView *backgroundView;

@end

@implementation BMSlideSelectView

#pragma mark -
#pragma mark - init
#pragma mark - getters setters

- (void)setDataSourceArray:(NSArray<BMSlideSelectModel *> *)dataSourceArray {
    _dataSourceArray = dataSourceArray;
    NSInteger selectInex = self.selectIndex;
    [self.backgroundView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [dataSourceArray enumerateObjectsUsingBlock:^(BMSlideSelectModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        BMSlideSelectChildView *subView = [BMSlideSelectChildView slideSelectChildViewWithFrame:CGRectMake((idx*77.0f), 0.0f, 77, 113) imageUrl:obj.imagePath title:obj.title tapSelectBlock:^(BMSlideSelectChildView *slideSelectChildView) {
            slideSelectChildView.select = YES;
            [self.backgroundView.subviews enumerateObjectsUsingBlock:^(__kindof BMSlideSelectChildView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([obj isKindOfClass:[BMSlideSelectChildView class]]) {
                    if (slideSelectChildView != obj) {
                        obj.select = NO;
                        obj.titleLabel.textColor = [UIColor colorWithHexString:@"666666"];
                    }else {
                        obj.select = YES;
                        obj.titleLabel.textColor = [UIColor colorWithHexString:@"1fb8ff"];
                        if (self.slideSelectViewSelectBlock) {
                            self.slideSelectViewSelectBlock(idx);
                        }
                    }
                }
            }];
        }];
        if (selectInex == idx) {
            subView.select = YES;
            subView.titleLabel.textColor = [UIColor redColor];
        }
        [self.backgroundView addSubview:subView];
    }];
    self.backgroundView.contentSize = CGSizeMake(dataSourceArray.count*77.0+10, 0);
}

- (void)setSelectIndex:(NSInteger)selectIndex {
    [self.backgroundView.subviews enumerateObjectsUsingBlock:^(__kindof BMSlideSelectChildView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[BMSlideSelectChildView class]]) {
            obj.select = NO;
            obj.titleLabel.textColor =[UIColor colorWithHexString:@"666666"];;
            if (idx == selectIndex) {
                obj.select = YES;
                obj.titleLabel.textColor = [UIColor colorWithHexString:@"1fb8ff"];
            }
        }
    }];
}

- (NSInteger)selectIndex {
    __block NSInteger index = -1;
    [self.backgroundView.subviews enumerateObjectsUsingBlock:^(__kindof BMSlideSelectChildView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[BMSlideSelectChildView class]] && obj.select) {
            index = idx;
            *stop = YES;
        }
    }];
    return index;
}


- (UIScrollView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[UIScrollView alloc] initWithFrame:self.bounds];
    }
    return _backgroundView;
}

+ (instancetype)slideSelectViewWithFrame:(CGRect)frame
                         dataSourceArray:(NSArray <BMSlideSelectModel *>*)dataSourceArray
                             selectIndex:(NSInteger)selectIndex
                             selectBlock:(BMSlideSelectViewSelectBlock)selectBlock {
    BMSlideSelectView *view = [[BMSlideSelectView alloc] initWithFrame:frame];
    // 业务高度为 113
    frame.size.height = 113.0f;
    view.frame = frame;
    [view addSubview:view.backgroundView];
    view.dataSourceArray = dataSourceArray;
    view.selectIndex = selectIndex;
    view.slideSelectViewSelectBlock = selectBlock;
    return view;
}
@end

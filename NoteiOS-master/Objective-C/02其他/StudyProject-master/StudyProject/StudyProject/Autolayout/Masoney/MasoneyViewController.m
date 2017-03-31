//
//  MasoneyViewController.m
//  StudyProject
//
//  Created by Daredos on 16/4/25.
//  Copyright © 2016年 LiangDaHong. All rights reserved.
//

#import "MasoneyViewController.h"
#import "Masonry.h"

#define SWITCH 5


@interface MasoneyViewController ()
@end

@implementation MasoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
#if SWITCH == 0
    [self mas_test1];
#endif

#if SWITCH == 1
    [self mas_test2];
#endif
    
#if SWITCH == 2
    [self mas_test3];
#endif
    
#if SWITCH == 3
    [self mas_test4];
#endif
    

#if SWITCH == 4
    [self mas_test5];
#endif

#if SWITCH == 5
    [self mas_test6];
#endif

}

- (void)mas_test1 {

    [[self addView] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view).with.insets(UIEdgeInsetsMake(10, 100, 10, 10));

        // make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (void)mas_test2 {

    [[self addView] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(100, 10, 10, 10));
    }];
}

- (void)mas_test3 {
    [[self addView] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.mas_equalTo(0);
        //宽度为 self.view.mas_width * 0.5 +0
        make.width.mas_equalTo(self.view.mas_width).multipliedBy(0.5).offset(10);
    }];
}

- (void)mas_test4 {

    UIView *lVuew = [self addView];
    UIView *rVuew = [self addView];

    // 2个view
    [lVuew mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(10);
        make.left.mas_equalTo(20);
        make.height.mas_equalTo(200);
        make.right.mas_equalTo(rVuew.mas_left).offset(-30);
        make.width.mas_equalTo(rVuew.mas_width);
    }];

    [rVuew mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(10);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(lVuew.mas_height).offset(-10);
    }];
}

- (void)mas_test5 {

    UILabel *lLabel = [self addLabel];
    lLabel.text = @"lLabellLabel";
    
    UILabel *rLabel = [self addLabel];
    rLabel.text = @"rLabelrLabel";

    // 优先级
    [lLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.and.left.mas_equalTo(-10);
        make.height.mas_equalTo(20);
        make.right.mas_equalTo(rLabel.mas_left).offset(-30);
    }];

    [rLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.and.right.mas_equalTo(-10);
        make.height.mas_equalTo(20);
    }];
}

- (void)mas_test6 {

    UIView *superVuew    = [self addView];

    UIView *topRedView   = [self creatView];
    [superVuew addSubview:topRedView];
    
    UIView *topYellView  = [self creatView];
    [superVuew addSubview:topYellView];

    UIView *bottBuleView = [self creatView];
    [superVuew addSubview:bottBuleView];

    //
    [superVuew mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.bottom.mas_equalTo(-30);
        make.right.mas_equalTo(-10);
        make.left.mas_equalTo(10);
    }];
    
//    [topRedView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.and.left.mas_equalTo(10);
//        make.right.mas_equalTo(topYellView.mas_left).offset(-10);
//        make.height.mas_equalTo(bottBuleView);
//        make.width.mas_equalTo(topYellView.mas_width).multipliedBy(2);
//    }];
    
    
//    [topYellView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(10);
//        make.right.mas_equalTo(-10);
//        make.height.mas_equalTo(topRedView.mas_height);
//    }];

    
//    [bottBuleView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.right.left.mas_equalTo(10);
//    }];
}


#pragma mark -
#pragma mark - 生命周期
#pragma mark - getters setters
#pragma mark - 系统delegate
#pragma mark - 自定义delegate
#pragma mark - 公有方法
#pragma mark - 私有方法

- (UIView *)addView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor colorWithRed:(arc4random()%100)/100.0 green:(arc4random()%100)/100.0 blue:(arc4random()%100)/100.0 alpha:1];
    [self.view addSubview:view];
    return view;
}

- (UILabel *)addLabel {
    UILabel *label = [UILabel new];
    label.backgroundColor = [UIColor colorWithRed:(arc4random()%100)/100.0 green:(arc4random()%100)/100.0 blue:(arc4random()%100)/100.0 alpha:1];
    [self.view addSubview:label];
    return label;
}

- (UIView *)creatView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor colorWithRed:(arc4random()%100)/100.0 green:(arc4random()%100)/100.0 blue:(arc4random()%100)/100.0 alpha:1];
    return view;
}
#pragma mark - 事件响应

@end
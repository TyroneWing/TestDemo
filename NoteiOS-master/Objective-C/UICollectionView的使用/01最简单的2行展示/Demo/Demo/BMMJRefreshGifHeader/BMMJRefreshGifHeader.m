//
//  BMMJRefreshGifHeader.m
//  MJRDemo
//
//  Created by ___liangdahong on 2016/11/3.
//  Copyright © 2016年 BM All rights reserved.
//

#import "BMMJRefreshGifHeader.h"

@implementation BMMJRefreshGifHeader

#pragma mark - 重写方法
#pragma mark 基本设置
- (void)prepare {
    [super prepare];
    // 设置正在刷新状态的动画图片
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=4; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"icon_refresh_image_an_%zd", i]];
        [refreshingImages addObject:image];
    }
    [self setImages:@[[UIImage imageNamed:@"icon_refresh_imag_pt_mj"]] duration:1000 forState:MJRefreshStateIdle];
    [self setImages:refreshingImages duration:0.2555 forState:MJRefreshStateRefreshing];
    self.lastUpdatedTimeLabel.hidden = YES;
    [self setTitle:@"努力加载中···" forState:MJRefreshStateRefreshing]; 
}

@end

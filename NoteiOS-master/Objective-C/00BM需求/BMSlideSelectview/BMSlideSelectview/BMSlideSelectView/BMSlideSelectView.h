//
//  BMViewController.m
//  BMBlueMoonAngel
//
//  Created by ___liangdahong on 2016/12/23.
//  Copyright © 2016年 Bluemoon. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 滑动选择器 Model
 */
@interface BMSlideSelectModel : NSObject

/**
 文字
 */
@property (copy, nonatomic) NSString *title;

/**
 图片地址
 */
@property (copy, nonatomic) NSString *imagePath;

@end

/**
 滑动选择器选择一个view时的回调

 @param selectIndex 当前选择的位置
 */
typedef void(^BMSlideSelectViewSelectBlock)(NSInteger selectIndex);

/**
 滑动选择器
 */
@interface BMSlideSelectView : UIView

/**
 数据源
 */
@property (nonatomic, strong) NSArray <BMSlideSelectModel *>* dataSourceArray;

/**
 selectIndex
 */
@property (nonatomic, assign) NSInteger selectIndex;

/**
 selectBlock
 */
@property (nonatomic, copy) BMSlideSelectViewSelectBlock slideSelectViewSelectBlock;

/**
 创建滑动选择器

 @param frame frame （内部自动会设置高为 113 业务需求）
 @param dataSourceArray 数据源
 @param selectIndex 默认选中位置
 @param selectBlock 点击回调 block
 @return 创建的view
 */
+ (instancetype)slideSelectViewWithFrame:(CGRect)frame
                         dataSourceArray:(NSArray <BMSlideSelectModel *>*)dataSourceArray
                             selectIndex:(NSInteger)selectIndex
                             selectBlock:(BMSlideSelectViewSelectBlock)selectBlock;
@end

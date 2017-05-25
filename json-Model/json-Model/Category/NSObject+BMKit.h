//
//  NSObject+BMKit.h
//  BMKitManager
//
//  Created by elvin on 2017/3/7.
//  Copyright © 2017年 蓝月亮（中国）有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (BMKit)

/**
 通过字典来创建一个模型
 
 @param keyValues 字典(可以是NSDictionary、NSData、NSString)
 @return 新建的对象
 */
+ (instancetype)bm_modelWithKeyValues:(id)keyValues;

/**
 通过字典数组来创建一个模型数组
 
 @param keyValuesArray 字典数组(可以是NSDictionary、NSData、NSString)
 @return 模型数组
 */
+ (NSMutableArray *)bm_modelArrayWithKeyValuesArray:(id)keyValuesArray;

/**
 将模型转成字典
 
 @return 字典
 */
- (NSDictionary *)bm_keyValuesAuto;

@end

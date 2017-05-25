//
//  NSObject+BMKit.m
//  BMKitManager
//
//  Created by elvin on 2017/3/7.
//  Copyright © 2017年 蓝月亮（中国）有限公司. All rights reserved.
//

#import "NSObject+BMKit.h"
#import "MJExtension.h"

@implementation NSObject (BMKit)

+ (NSMutableArray *)bm_modelArrayWithKeyValuesArray:(id)keyValuesArray {
    
    return [self mj_objectArrayWithKeyValuesArray:keyValuesArray];
}

+ (instancetype)bm_modelWithKeyValues:(id)keyValues {
    
    return [self mj_objectWithKeyValues:keyValues];
}

- (NSDictionary *)bm_keyValuesAuto {
    
    return [self mj_keyValues];
}
@end

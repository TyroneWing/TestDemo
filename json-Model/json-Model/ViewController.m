//
//  ViewController.m
//  json-Model
//
//  Created by ___liangdahong on 2017/5/17.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "ViewController.h"
#import "BMEFCSearchModel.h"
#import "NSObject+BMKit.h"

#define kBMDictionary(name) [NSJSONSerialization JSONObjectWithData:[[NSData alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:@"txt"]] options:0 error:nil]

@interface ViewController ()

@end

@implementation ViewController


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 模拟网络请求到的数据
    NSDictionary *dict = kBMDictionary(@"json");
    
    // dict -> 模型
    BMEFCSearchModel *model = [BMEFCSearchModel bm_modelWithKeyValues:dict];
    
    NSLog(@"%@", model);
}

@end

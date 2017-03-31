//
//  LDHObjProperty.m
//  LDHRuntimeDemo
//
//  Created by Daredos on 16/4/12.
//  Copyright © 2016年 LiangDaHong. All rights reserved.
//

#import "LDHObjProperty.h"
#import <objc/runtime.h>

@interface LDHObjProperty ()

@property (copy, nonatomic) NSString *name1;
@property (copy, nonatomic) NSString *name2;
@property (copy, nonatomic) NSString *name3;

@end

@implementation LDHObjProperty

- (void)viewDidLoad {
    [super viewDidLoad];

    self.name1 = @"1";
    self.name2 = @"2";
    self.name3 = @"3";

    unsigned int count = 0;
    // 获取 xx 类的属性列表 只可以获取到本类的属性获取到父类的属性)
    objc_property_t *properties = class_copyPropertyList([self class], &count);

    NSMutableArray *muarray = [@[] mutableCopy];

    // 遍历所有属性
    while (count--) {
        // 获取 count "位置" 的属性名
        const char* propertyName = property_getName(properties[count]);
        // 把属性名称C字符串转为 OC字符串
        NSString *propertyNameString = [NSString stringWithUTF8String:propertyName];
        [muarray addObject:propertyNameString];
    }
    NSLog(@"self 的属性列表: \n%@",muarray);
    
    // 既然获取到所有的属性名，那么结合 KVC KVO 就可以干一些其他的事了
}
@end

//
//  NSArray+Crash.m
//  RuntimeTest
//
//  Created by yi on 17/4/7.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "NSArray+Crash.h"
#import <objc/runtime.h>

@implementation NSArray (Crash)

+ (void)load
{
    Method fromMethod = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndex:));
    Method toMethod = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(my_objectAtIndex:));
    //method_exchangeImplementations(fromMethod, toMethod);
}

- (id)my_objectAtIndex:(NSUInteger)index {
    if (self.count-1 < index) {
        // 这里做一下异常处理，不然都不知道出错了。
        @try {
            return [self my_objectAtIndex:index];
        }
        @catch (NSException *exception) {
            // 在崩溃后会打印崩溃信息，方便我们调试。
            NSLog(@"---------- %s Crash Because Method %s  ----------\n", class_getName(self.class), __func__);
           // NSLog(@"%@", [exception callStackSymbols]);
            return nil;
        }
        @finally {
        
        }
    } else {
        return [self my_objectAtIndex:index];
    }
}
@end

//
//  main.m
//  StudyProject
//
//  Created by Daredos on 16/4/24.
//  Copyright © 2016年 LiangDaHong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <objc/runtime.h>

@protocol PersonDelegate <NSObject>
- (void)personDelegate_func;
@end

@interface Person : NSObject <PersonDelegate>
{
    NSString *_name;
}
@property (assign, nonatomic) NSInteger age;

- (void)objc_aa;
- (void)objc_bb;

+ (void)class_aa;
+ (void)class_bb;

//
- (void)test_func:(BOOL)sel s:(NSString *)str;
+ (void)test_class_func;

@end

@implementation Person
{
    BOOL _sel;
}
- (void)objc_aa{}
- (void)objc_bb{}
+ (void)class_aa{}
+ (void)class_bb{}

// 判断类方法有没有实现
+ (BOOL)resolveClassMethod:(SEL)sel {
    NSLog(@"判断类方法有没有实现");
    return  NO;
}


void studyEngilsh(id self, SEL _cmd, bool sel, NSString *string) {
    
    NSLog(@"动态添加了一个学习英语的方法");
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(test_func:s:)) {
        // 注意:这里需要强转成IMP类型
        class_addMethod(self, sel, (IMP)studyEngilsh, "v@:");
        return YES;
    }
    // 先恢复, 不然会覆盖系统的方法
    return [super resolveInstanceMethod:sel];
}

@end


int main(int argc, char * argv[]) {

    // ---------------对象绑定---------------
    Person *person = [Person new];
    objc_setAssociatedObject(person, "c", @YES, OBJC_ASSOCIATION_COPY_NONATOMIC);
    id num = objc_getAssociatedObject(person, "c");
    NSLog(@"%@",num);
    NSLog(@"--------------------------------------------\n\n");
    
    
    // ---------------获取属性---------------
    unsigned int count = 0;
    objc_property_t *propertys = class_copyPropertyList([person class], &count);
    while (count--) {
        const char *propertyName = property_getName(propertys[count]);
        NSString *propertyNameString = [NSString stringWithFormat:@"%s",propertyName];
        NSLog(@"person属性 ：%@",propertyNameString);
    }
    free(propertys);
    NSLog(@"--------------------------------------------\n\n");
    
    // ---------------获取成员变量---------------
    Ivar *ivar = class_copyIvarList([person class], &count);
    while (count--) {
        const char *ivarName = ivar_getName(ivar[count]);
        NSString *ivarNameString = [NSString stringWithFormat:@"%s",ivarName];
        NSLog(@"person成员变量 ：%@",ivarNameString);
    }
    free(ivar);
    NSLog(@"--------------------------------------------\n\n");
    
    // ---------------获取方法---------------
    Method *method = class_copyMethodList([person class], &count);
    while (count--) {
        SEL sel = method_getName(method[count]);
        NSString *funcNameString = NSStringFromSelector(sel);
        NSLog(@"person是方法 ：%@",funcNameString);
    }
    free(method);
    NSLog(@"--------------------------------------------\n\n");
    
    // ---------------获取Protocol---------------
    __unsafe_unretained Protocol **protocols = class_copyProtocolList([person class], &count);
    while (count--) {
        const char *protocolName = protocol_getName(protocols[count]);
        NSString *protocolNameString = [NSString stringWithFormat:@"%s",protocolName];
        NSLog(@"person 协议 ：%@",protocolNameString);
    }
    NSLog(@"--------------------------------------------\n\n");
    
    // ---------------交换2个方法的调用---------------
    Method objc_m1 = class_getInstanceMethod([person class], @selector(objc_aa));
    Method objc_m2 = class_getInstanceMethod([person class], @selector(objc_bb));
    BOOL sel =  class_addMethod([person class], @selector(objc_aa), method_getImplementation(objc_m2), method_getTypeEncoding(objc_m2));
    if (sel) {
        class_replaceMethod([person class], @selector(objc_bb), method_getImplementation(objc_m1), method_getTypeEncoding(objc_m1));
    }else{
        method_exchangeImplementations(objc_m1, objc_m2);
    }

    Method class_m1 = class_getClassMethod([person class], @selector(class_aa));;
    Method class_m2 = class_getClassMethod([person class], @selector(class_bb));;
    method_exchangeImplementations(class_m1, class_m2);
    [person objc_aa];
    [person test_func:NO s:@"ldh"];
    NSLog(@"--------------------------------------------\n\n");

    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

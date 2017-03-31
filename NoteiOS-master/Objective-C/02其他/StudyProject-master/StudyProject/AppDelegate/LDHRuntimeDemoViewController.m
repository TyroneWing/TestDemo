//
//  LDHRuntimeDemoViewController.m
//  LDHRuntimeDemo
//
//  Created by Daredos on 16/4/12.
//  Copyright © 2016年 LiangDaHong. All rights reserved.
//

#import "LDHRuntimeDemoViewController.h"
#import "RuntimeViewController.h"
#import "AutolayoutViewController.h"
#import "AnimationViewController.h"
#import "SystemViewController.h"


#define kTEST @[\
                \
    @{@"name":@"runtime学习",@"ViewController":@"RuntimeViewController"},\
    @{@"name":@"Autolayout",@"ViewController":@"AutolayoutViewController"},\
    @{@"name":@"Animation" ,@"ViewController":@"AnimationViewController"},\
    @{@"name":@"系统功能" ,@"ViewController":  @"SystemViewController"},\
];\

@interface LDHRuntimeDemoViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *array;
@property (weak, nonatomic) IBOutlet UITableView *tableView;



@end

@implementation LDHRuntimeDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"学习计划";
}

- (NSMutableArray *)array {

    if (!_array) {
        NSArray *array =  kTEST;
        _array = [NSMutableArray arrayWithArray:array];
    }
    return _array;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:ID];
        cell.accessoryType   = UITableViewCellAccessoryDisclosureIndicator;
    }
    NSDictionary *dict = self.array[indexPath.row];
    cell.textLabel.text = dict[@"name"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *dict = self.array[indexPath.row];
    UIViewController *c = [[NSClassFromString(dict[@"ViewController"]) alloc] init];
    c.title = dict[@"name"];
    [self.navigationController pushViewController:c animated:YES];
}
@end

/*!
 Objective-C运行时定义了几种重要的类型。
 
 Class：          定义Objective-C类
 Protocol：       定义正式协议。
 SEL：            定义选择器。选择器是方法名的唯一标识符。
 
 Ivar：           定义对象的实例变量，包括类型和名字。
 objc_property_t：定义属性。叫这个名字可能是为了防止和Objective-C 1.0中的用户类型冲突，那时候还没有属性。
 Method：         定义对象方法或类方法。这个类型提供了方法的名字（就是**选择器**）、参数数量和类型，以及返回值（这些信息合起来称为方法的**签名**），还有一个指向代码的函
 数指针（也就是方法的**实现**）。
 IMP：            定义方法实现。这只是一个指向某个函数的指针，该函数接受一个对象、一个选择器和一个可变长参数列表（varargs），返回一个对象
 */
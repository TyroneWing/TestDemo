//
//  RuntimeViewController.m
//  StudyProject
//
//  Created by Daredos on 16/4/24.
//  Copyright © 2016年 LiangDaHong. All rights reserved.
//

#import "RuntimeViewController.h"
#import "LDHBindingViewController.h"
#import "LDHObjProperty.h"
#import "SwizzlingViewController.h"
#import <objc/runtime.h>

#define kTEST @[\
\
@{@"name":@"对象绑定",@"ViewController":@"LDHBindingViewController"},\
@{@"name":@"对象属性",@"ViewController":@"LDHObjProperty"},\
@{@"name":@"替换方法的调用Swizzling",@"ViewController":@"SwizzlingViewController"}\
];\

@interface RuntimeViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *array;

@end

@implementation RuntimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"runtime";
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

/*!
 *  @brief 对象绑定
 */


@end

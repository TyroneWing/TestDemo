//
//  SystemViewController.m
//  StudyProject
//
//  Created by Daredos on 16/4/25.
//  Copyright © 2016年 LiangDaHong. All rights reserved.
//

#import "SystemViewController.h"
#import "BMIostCellScrollViewController.h"
#import "BMRefreshViewController.h"
#import "DefineViewController.h"
#import "IOSNotebookViewController.h"

#define kTEST @[\
\
    @{@"name":@"cell侧滑(多按钮兼容)",@"ViewController":@"BMIostCellScrollViewController"},\
    @{@"name":@"系统刷新控件",@"ViewController":@"BMRefreshViewController"},\
    @{@"name":@"IOS宏",@"ViewController":@"DefineViewController"},\
    @{@"name":@"IOSNotebook",@"ViewController":@"IOSNotebookViewController"},\
];\

@interface SystemViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *array;

@end

@implementation SystemViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Animation";
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

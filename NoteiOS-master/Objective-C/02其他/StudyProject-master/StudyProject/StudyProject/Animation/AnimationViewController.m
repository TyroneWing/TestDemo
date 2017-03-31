//
//  AnimationViewController.m
//  StudyProject
//
//  Created by Daredos on 16/4/25.
//  Copyright © 2016年 LiangDaHong. All rights reserved.
//

#import "AnimationViewController.h"
#import "BMCommonEffectViewController.h"
#import "CALayerViewController.h"
#import "Quartz2DViewController.h"

#define kTEST @[\
\
@{@"name":@"旋转动画",@"ViewController":@"BMCommonEffectViewController"},\
@{@"name":@"图层",@"ViewController":@"CALayerViewController"},\
@{@"name":@"Quartz2D",@"ViewController":@"Quartz2DViewController"},\
];\

@interface AnimationViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *array;

@end

@implementation AnimationViewController


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

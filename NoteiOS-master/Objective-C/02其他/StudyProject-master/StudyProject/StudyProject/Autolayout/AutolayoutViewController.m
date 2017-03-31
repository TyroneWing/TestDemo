//
//  AutolayoutViewController.m
//  StudyProject
//
//  Created by Daredos on 16/4/25.
//  Copyright © 2016年 LiangDaHong. All rights reserved.
//

#import "AutolayoutViewController.h"
#import "Autolayout_XIB_SBViewController.h"
#import "MasoneyViewController.h"
#import "SizeClassViewController.h"
#import "AutolayoutScrollViewVC.h"
#import "TestAlertViewController.h"


#define kTEST @[\
\
@{@"name":@"Autolayout_XIB_SB",@"ViewController":@"Autolayout_XIB_SBViewController"},\
@{@"name":@"Masoney",@"ViewController":@"MasoneyViewController"},\
@{@"name":@"SizeClass",@"ViewController":@"SizeClassViewController"},\
@{@"name":@"AutolayoutScrollViewVC",@"ViewController":@"AutolayoutScrollViewVC"},\
@{@"name":@"allert",@"ViewController":@"TestAlertViewController"}\
];\

@interface AutolayoutViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *array;

@end

@implementation AutolayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Autolayout";
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */



@end

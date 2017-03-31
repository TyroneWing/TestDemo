//
//  ViewController.m
//  ScrollViewEmptyData
//
//  Created by ___liangdahong on 2017/3/7.
//  Copyright © 2017年 http://idhong.com/. All rights reserved.
//

#import "ViewController.h"
#import "BMDeliveryFeedbackVC.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (assign, nonatomic) NSInteger count; ///< <#Description#>

@end

@implementation ViewController

#pragma mark -

#pragma mark - 生命周期

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.translucent = NO;

    [self setUI];
}

#pragma mark - getters setters

#pragma mark - 系统delegate

#pragma mark - UITableViewDataSource UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [UITableViewCell new];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 
    [self.navigationController pushViewController:[BMDeliveryFeedbackVC new] animated:YES];
}

#pragma mark - 自定义delegate

#pragma mark - 公有方法

#pragma mark - 私有方法

- (void)setUI {
    
}

#pragma mark - 事件响应

- (IBAction)reload:(id)sender {
    
    self.count = arc4random_uniform(10);
    [self.tableView reloadData];
}

@end

//
//  BMDeliveryFeedbackVC.m
//  ScrollViewEmptyData
//
//  Created by ___liangdahong on 2017/3/7.
//  Copyright © 2017年 http://idhong.com/. All rights reserved.
//

#import "BMDeliveryFeedbackVC.h"
#import "BMDeliveryFeedbackMarkView.h"
#import "YYCategories.h"

@interface BMDeliveryFeedbackVC () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *deliveryFeedbackTableView;

@property (strong, nonatomic) BMDeliveryFeedbackMarkView *deliveryFeedbackMarkView;

    
@end

@implementation BMDeliveryFeedbackVC
#pragma mark -

#pragma mark - 生命周期

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setUI];    
}

#pragma mark - getters setters

- (BMDeliveryFeedbackMarkView *)deliveryFeedbackMarkView {

    if (!_deliveryFeedbackMarkView) {
        _deliveryFeedbackMarkView = [BMDeliveryFeedbackMarkView deliveryFeedbackMarkViewReload:^{
            self.deliveryFeedbackTableView.tableFooterView = self.deliveryFeedbackMarkView;
        }];
    }
    return _deliveryFeedbackMarkView;
}

#pragma mark - 系统delegate

#pragma mark - UITableViewDataSource UITableViewDelegate

#pragma mark - UITableViewDataSource UITableViewDelegate

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectio
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [UITableViewCell new];
    cell.selectionStyle = 0;
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    

    if (self.deliveryFeedbackTableView.tableFooterView == self.deliveryFeedbackMarkView) {
        self.deliveryFeedbackTableView.tableFooterView = [UIView new];
    } else {
        self.deliveryFeedbackTableView.tableFooterView = self.deliveryFeedbackMarkView;
    }
}
#pragma mark - 自定义delegate

#pragma mark - 公有方法

#pragma mark - 私有方法

- (void)setUI {
    
    self.deliveryFeedbackTableView.tableFooterView = self.deliveryFeedbackMarkView;
}

#pragma mark - 事件响应
@end

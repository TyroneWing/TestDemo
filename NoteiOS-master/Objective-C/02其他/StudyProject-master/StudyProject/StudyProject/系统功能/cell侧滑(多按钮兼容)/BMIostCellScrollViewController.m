
//
//  BMIostCellScrollViewController.m
//  IOS常见效果
//
//  Created by 1 on 16/2/15.
//  Copyright © 2016年 Daredos. All rights reserved.
//

#import "BMIostCellScrollViewController.h"
#import "UITableViewRowAction+JZExtension.h"

@interface BMIostCellScrollViewController () <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *cellScrollTableView;
@end

@implementation BMIostCellScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:1 reuseIdentifier:NSStringFromClass([self class])];
        cell.backgroundColor = [UIColor blueColor];
    }
    return cell;
}

- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    void(^rowActionHandler)(UITableViewRowAction *, NSIndexPath *) = ^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {

        [self.cellScrollTableView setEditing:NO animated:YES];
        NSString *string = [NSString stringWithFormat:@"--侧滑出来的cell的点击 -- %ld",(long)indexPath.row];
        NSLog(@"%@",string);
        
    };
//
//    UITableViewRowAction *action3 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"订单退货" handler:rowActionHandler];
    
//    return @[action3];

//    void(^rowActionHandler)(UITableViewRowAction *, NSIndexPath *) = ^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
//
//        [self.cellScrollTableView setEditing:NO animated:true];
//    };
    
    // 自定义view
    UIButton *buttonForImage = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    UITableViewRowAction *action1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault image:[buttonForImage imageForState:UIControlStateNormal] handler:rowActionHandler];
    UITableViewRowAction *action2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"disenable" handler:rowActionHandler];
    // 是否可以点击
    action2.enabled = false;
    
    UITableViewRowAction *action3 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"emjoy👍" handler:rowActionHandler];

    return @[action1,action2,action3];
}

@end
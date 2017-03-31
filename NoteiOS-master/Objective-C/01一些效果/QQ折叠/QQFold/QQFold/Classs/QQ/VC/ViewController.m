//
//  ViewController.m
//  QQ
//
//  Created by __liangdahong on 16/9/1.
//  Copyright © 2016年 梁大红. All rights reserved.
//

#import "ViewController.h"
#import "BMHeaderFooterView.h"
#import "BMSectionModel.h"
#import "CAKeyframeAnimation+PrivateOpenCloseAnimation.h"
#import "BMAdaptationCell.h"
#import "UITableView+FDTemplateLayoutCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    [self.tableView registerNib:[UINib nibWithNibName:@"BMAdaptationCell" bundle:nil] forCellReuseIdentifier:@"BMAdaptationCell"];
    [self.tableView registerClass:[BMHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"BMHeaderFooterView"];
    self.tableView.sectionFooterHeight = 0.00001;
    self.tableView.sectionHeaderHeight = 40.0f;

    self.tableView.separatorInset = UIEdgeInsetsMake(0, -200, 0, 0);
}

- (NSMutableArray *)array {
    if (!_array) {
        _array = [@[] mutableCopy];
        
        int arc = arc4random_uniform(10)+4;
        int count = 0;
        while (count < arc) {
            BMSectionModel *model = [BMSectionModel new];
            model.scetionName = [NSString stringWithFormat:@"第%d组",count];
            int row = arc4random_uniform(30)+1;
            int rowCount = 0;
            NSMutableArray *mu = [@[] mutableCopy];
            while (rowCount < row) {
                BMUser *user = [BMUser new];
                user.name = [NSString stringWithFormat:@"%d %d" ,count ,rowCount];
                if (arc4random_uniform(2)) {
                    user.title = [NSString stringWithFormat:@"标题标题标题标题标题标题标题标题标题标题标题标题"];
                }else{
                    user.title = [NSString stringWithFormat:@"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题"];
                }

                if (arc4random_uniform(2)) {
                    user.desc = [NSString stringWithFormat:@"详情标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题"];
                }else{
                    user.desc = [NSString stringWithFormat:@"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题"];
                }
                [mu addObject:user];
                rowCount++;
            }
            count++;
            model.open = YES;
            if (arc4random_uniform(3)) {
                model.open = NO;
            }
            model.personArray = [mu copy];
            [_array addObject:model];
        }
    }
    return _array;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.array.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    BMSectionModel *model = self.array[section];
    if (!model.isOpen) {
        return 0;
    }
    return model.personArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UITableViewCell new];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    BMHeaderFooterView *head = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"BMHeaderFooterView"];
    __weak typeof(self) wself = self;
    __weak typeof(head) whead = head;
    head.selectBlock = ^{
        __strong typeof(whead) head = whead;
        __strong typeof(wself) self = wself;
        BMSectionModel *model = self.array[section];
        if (model.isOpen) {
            model.open = NO;
            [head.icon bm_addCloseAnimationWithDuration:0.3];
        }else {
            [head.icon bm_addOpenAnimationWithDuration:0.3];
            model.open = YES;
        }
        NSInteger count = model.personArray.count;
        NSMutableArray *mu = [@[] mutableCopy];
        while (count--) {
            [mu addObject:[NSIndexPath indexPathForRow:count inSection:section]];
        }

        if (model.isOpen) {
            [tableView insertRowsAtIndexPaths:mu withRowAnimation:UITableViewRowAnimationAutomatic];
        }else {
            [tableView deleteRowsAtIndexPaths:mu withRowAnimation:UITableViewRowAnimationAutomatic];
        }
    };
    BMSectionModel *model = self.array[section];
    if (!model.isOpen) {
        [head.icon bm_addCloseAnimationWithDuration:0];
    }else{
        [head.icon bm_addOpenAnimationWithDuration:0];
    }
    head.textLabel.text = [NSString stringWithFormat:@"%@(%lu)", model.scetionName, (unsigned long)model.personArray.count];
    return head;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    [cell setSelected:NO animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return @[@"1",@"2",@"3",@"2",@"3",@"2",@"3",@"2",@"3",@"2",@"3",@"2",@"3",@"2",@"3",@"2",@"3",@"2",@"3",@"2",@"3",@"2",@"3",@"2",@"3",@"2",@"3",@"2",@"3",@"2",@"3",@"2",@"3",@"2",@"3",@"2",@"3",@"2",@"3",@"2",@"3",@"2",@"3"];
}

- (IBAction)reloadTitles:(id)sender {
    [self.tableView scrollToNearestSelectedRowAtScrollPosition:0 animated:YES];
//    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:3] atScrollPosition:0 animated:YES];
//    [self.tableView reloadSectionIndexTitles];
//    [self.tableView setEditing:YES animated:YES];
    [self.tableView allowsSelection];
//    [self.tableView moveSection]
}

@end

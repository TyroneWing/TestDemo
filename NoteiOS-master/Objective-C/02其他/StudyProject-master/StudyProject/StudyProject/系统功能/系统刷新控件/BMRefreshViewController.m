

//
//  BMRefreshViewController.m
//  IOS常见效果
//
//  Created by 1 on 16/2/20.
//  Copyright © 2016年 Daredos. All rights reserved.
//

#import "BMRefreshViewController.h"

@interface BMRefreshViewController () <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UIRefreshControl *refreshControl;

@end

@implementation BMRefreshViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    _refreshControl = [[UIRefreshControl alloc] init];
    
    _refreshControl.tintColor = [UIColor redColor];
    
    [_refreshControl addTarget:self action:@selector(rrr) forControlEvents:7];
    _refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"继续下拉"];
    
    [self.tableView addSubview:_refreshControl];
   
}

- (void)rrr {
    
    if (self.tableView) {
        [_refreshControl beginRefreshing];
         _refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"努力加载中……"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [_refreshControl endRefreshing];
        });
    }

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}
// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    return [UITableViewCell new];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y > 30) {
        [_refreshControl beginRefreshing];
        _refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"努力加载中……"];

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [_refreshControl endRefreshing];
            _refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"继续下拉"];

        });
    }
}


@end

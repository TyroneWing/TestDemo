//
//  ViewController.m
//  Tableview
//
//  Created by yi on 17/4/8.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "ViewController.h"
#import "TextViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic)  UITableView *tableView;
@property (nonatomic, strong) NSArray *data;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.data = @[@"Cell 1 根据刚才在 storyboard 中创建的 cell，新建一个 UITableViewCell 类",
                  @"Cell 2",
                  @"Cell 3",
                  @"Cell 4",
                  @"Cell 5",
                  @"Cell 6",
                  @"Cell 7",
                  @"Cell 8",
                  @"Cell 9",
                  @"Cell 10",
                  @"Cell 11",
                  @"Cell 12",
                  @"Cell 13",
                  @"Cell 14",
                  @"Cell 15",
                  @"Cell 16",
                 ];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.bounces = YES;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.estimatedRowHeight = 44.0;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.data count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TextViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextViewCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([TextViewCell class]) owner:nil options:nil] firstObject];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textView.text = self.data[indexPath.row];
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  BMSimulationFileDownloadVC.m
//  SimulationFileDownload
//
//  Created by ___liangdahong on 2016/12/12.
//  Copyright © 2016年 idhong.com. All rights reserved.
//

#import "BMSimulationFileDownloadVC.h"
#import "BMSimulationFileDownloadModel.h"
#import "BMSimulationFileDownloadCell.h"

@interface BMSimulationFileDownloadVC () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *simulationFileDownloadTableView;
@property (nonatomic, strong) NSMutableArray <BMSimulationFileDownloadModel *> *dataSourceMutableArray;

@end

static NSString *kSimulationFileDownloadCell = @"kSimulationFileDownloadCell";

@implementation BMSimulationFileDownloadVC

#pragma mark -

#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUI];

    [self.simulationFileDownloadTableView registerNib:[UINib nibWithNibName:NSStringFromClass([BMSimulationFileDownloadCell class]) bundle:nil] forCellReuseIdentifier:kSimulationFileDownloadCell];
}

#pragma mark - getters setters
- (NSMutableArray<BMSimulationFileDownloadModel *> *)dataSourceMutableArray {
    if (!_dataSourceMutableArray) {
        _dataSourceMutableArray = [@[] mutableCopy];
        int arc = 2;
        while (arc--) {
            BMSimulationFileDownloadModel *obj = [BMSimulationFileDownloadModel new];
            obj.filePath = arc >9 ? [NSString stringWithFormat:@"http://120.25.226.186:32812/resources/videos/minion_%d.mp4", arc] : [NSString stringWithFormat:@"http://120.25.226.186:32812/resources/videos/minion_0%d.mp4", arc];
            obj.fileType = @"mp3";
            obj.fileName = @"test";
            obj.codeID = [NSString stringWithFormat:@"文件：%d", 10-arc];
            [_dataSourceMutableArray addObject:obj];
        }
    }
    return _dataSourceMutableArray;
}
#pragma mark - 系统delegate

#pragma mark - UITableViewDelegate UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSourceMutableArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BMSimulationFileDownloadCell *cell = [tableView dequeueReusableCellWithIdentifier:kSimulationFileDownloadCell forIndexPath:indexPath];
    BMSimulationFileDownloadModel *model = self.dataSourceMutableArray[indexPath.row];
    cell.model = model;
    return cell;
}
#pragma mark - 自定义delegate

#pragma mark - 公有方法

#pragma mark - 私有方法

- (void)setUI {
    
}

#pragma mark - 事件响应

@end

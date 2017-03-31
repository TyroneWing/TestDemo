//
//  BMSimulationFileDownloadCell.m
//  SimulationFileDownload
//
//  Created by ___liangdahong on 2016/12/12.
//  Copyright © 2016年 idhong.com. All rights reserved.
//

#import "BMSimulationFileDownloadCell.h"
#import "UIProgressView+BMFDownload.h"

@interface BMSimulationFileDownloadCell ()
@property (weak, nonatomic) IBOutlet UILabel *fileName;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UILabel *progressFloatView;
@property (weak, nonatomic) IBOutlet UIButton *downloadButton;
@end


@implementation BMSimulationFileDownloadCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setModel:(BMSimulationFileDownloadModel *)model {
    _model = model;
    self.fileName.text = model.codeID;
    [self.progressView bm_downloadFileWithPath:model.filePath];
}

@end

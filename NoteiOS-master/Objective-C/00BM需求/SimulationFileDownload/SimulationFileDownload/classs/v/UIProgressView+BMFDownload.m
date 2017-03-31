//
//  UIProgressView+BMFDownload.m
//  SimulationFileDownload
//
//  Created by ___liangdahong on 2016/12/12.
//  Copyright © 2016年 idhong.com. All rights reserved.
//

#import "UIProgressView+BMFDownload.h"
#import "BMFileDownloadManager.h"

@interface UIProgressView ()

@property (nonatomic, copy) NSString *filePath;

@end

@implementation UIProgressView (BMFDownload)

- (void)bm_downloadFileWithPath:(NSString *)path {

    [BMFileDownloadManager downloadFileWithURLString:path fileName:@"1" fileType:@"222" downloadProgress:^(NSProgress *downloadProgress) {
        NSLog(@"%@ : %@", path, downloadProgress);
        float down =  downloadProgress.completedUnitCount * 1.0 / downloadProgress.totalUnitCount * 1.0;
        self.progress = down;
    } successBlock:^(NSString *filePath, NSError *error) {
    }];
}

@end

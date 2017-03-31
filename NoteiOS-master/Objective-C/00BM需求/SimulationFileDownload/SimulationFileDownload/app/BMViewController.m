//
//  BMViewController.m
//  SimulationFileDownload
//
//  Created by ___liangdahong on 2016/12/12.
//  Copyright © 2016年 idhong.com. All rights reserved.
//

#import "BMViewController.h"
#import "BMSimulationFileDownloadVC.h"
#import "BMFileDownloadManager.h"

@interface BMViewController ()

@end

@implementation BMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"SimulationFileDownload";
}

- (IBAction)downloadButtonClick:(id)sender {
    [self.navigationController pushViewController:[BMSimulationFileDownloadVC new] animated:YES];
}

- (IBAction)clear:(id)sender {
    [BMFileDownloadManager clearAllCache];
}

@end

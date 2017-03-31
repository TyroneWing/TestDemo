//
//  Quartz2DViewController.m
//  StudyProject
//
//  Created by Daredos on 16/4/26.
//  Copyright © 2016年 LiangDaHong. All rights reserved.
//

#import "Quartz2DViewController.h"
#import "Quartz2DView.h"

@interface Quartz2DViewController ()

@end

@implementation Quartz2DViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)linTestClick:(id)sender {
    Quartz2DView *V = [Quartz2DView quartz2DView];
    [self.view addSubview:V];
}

@end

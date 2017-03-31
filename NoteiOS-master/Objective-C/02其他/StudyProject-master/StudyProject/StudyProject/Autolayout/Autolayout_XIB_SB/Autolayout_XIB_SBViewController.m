//
//  Autolayout_XIB_SBViewController.m
//  StudyProject
//
//  Created by Daredos on 16/4/25.
//  Copyright © 2016年 LiangDaHong. All rights reserved.
//

#import "Autolayout_XIB_SBViewController.h"
#import "AutolayoutScrollViewViewController.h"
#import "AutolayoutScrollViewController.h"

@interface Autolayout_XIB_SBViewController ()

@end

@implementation Autolayout_XIB_SBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)goClick:(id)sender {
    [self.navigationController pushViewController:[AutolayoutScrollViewViewController new] animated:YES];
}

- (IBAction)scrollAutolayoutClick:(id)sender {
        [self.navigationController pushViewController:[AutolayoutScrollViewController new] animated:YES];
}
@end

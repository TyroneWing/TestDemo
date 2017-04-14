//
//  ViewController.m
//  UITest
//
//  Created by yi on 17/4/14.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"First VC";

    NSLog(@"self.navigationItem.titleView %@",NSStringFromCGRect(self.navigationItem.titleView.frame));
    self.navigationController.navigationBar.backgroundColor = [UIColor grayColor];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 64)];
    view.backgroundColor = [UIColor greenColor];
    self.navigationItem.titleView = view;
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandle:)];
    [self.navigationItem.titleView addGestureRecognizer:tap];
}


- (void)tapHandle:(UITapGestureRecognizer *)tap
{
    NSLog(@"tapHandle");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

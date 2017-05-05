//
//  ViewController.m
//  GestureRecognizer
//
//  Created by yi on 17/5/4.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "ViewController.h"
#import "UIView+ExtendTouchRect.h"
#import "UIControl+BlocksKit.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIButton *view = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    view.backgroundColor = [UIColor grayColor];
    view.touchExtendInset = UIEdgeInsetsMake(-50, -50, -50, -50);
    [view addTarget:self action:@selector(viewClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:view];

    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(150, 50, 100, 100)];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.touchExtendInset = UIEdgeInsetsMake(-50, -50, -50, -50);
    btn.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:btn];
    
    
    
    UIButton *test = [[UIButton alloc] initWithFrame:CGRectMake(150, 250, 100, 100)];
    [test bk_addEventHandler:^(id  _Nonnull sender) {
        NSLog(@"sender = %@",sender);
    } forControlEvents:UIControlEventTouchUpInside];
    test.backgroundColor = [UIColor greenColor];
    [self.view addSubview:test];

}

- (void)viewClick:(UIButton *)btn
{
    NSLog(@"viewClick");
}


- (void)btnClick:(UIButton *)btn
{
    NSLog(@"btnClick");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

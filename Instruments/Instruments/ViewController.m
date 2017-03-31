//
//  ViewController.m
//  Instruments
//
//  Created by yi on 17/3/27.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    NSMutableArray *arr1 = @[@"1", @"2"].mutableCopy;
    NSMutableArray *arr2 = @[@"23", @4].mutableCopy;
    
    [arr1 addObject:arr2];
    //[arr2 addObject:arr1];
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 200)];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

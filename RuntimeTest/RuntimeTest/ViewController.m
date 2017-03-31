//
//  ViewController.m
//  RuntimeTest
//
//  Created by yi on 17/3/31.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+Rect.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //同时控制 ImageEdgeInsets 与 TitleEdgeInsets 会出现冲突，导致图片与文本不能按照需求显示在指定位置
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
    btn.backgroundColor = [UIColor orangeColor];
    btn.titleLabel.backgroundColor = [UIColor yellowColor];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 50, 150)];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(55, 0, 20, 100)];
    [btn setImage:[UIImage imageNamed:@"test.png"] forState:UIControlStateNormal];
    [btn setTitle:@"没有使用Rect" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    

    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 200, 100)];
    btn2.backgroundColor = [UIColor redColor];
    btn2.imageRect = CGRectMake(0, 0, 50, 50);
    btn2.titleRect = CGRectMake(0, 55, 100, 30);
    btn2.titleLabel.backgroundColor = [UIColor yellowColor];
    [btn2 setImage:[UIImage imageNamed:@"test.png"] forState:UIControlStateNormal];
    [btn2 setTitle:@"使用Rect" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btn2];
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  ViewController.m
//  DemoTest
//
//  Created by __liangdahong on 2017/3/24.
//  Copyright © 2017年 http://idhong.com/. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"
#import "man.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
//    TestView *view = [[TestView alloc] init];
//    view.frame = CGRectMake(100, 100, 100, 100);
//    [self.view addSubview:view];
    
//    man *m = [[man alloc] init];
//    [m run];
    
    
    UIButton *bgview = [[UIButton alloc] init];
    bgview.frame = CGRectMake(100, 100, 100, 100);
    bgview.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:bgview];
    
    
    
    
    UIButton *view = [[UIButton alloc] init];
    view.frame = CGRectMake(100, 100, 100, 100);
    view.backgroundColor = [UIColor redColor];
    [view addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:view];
    
    
    
    NSLog(@"修改transform之前 view.frame = %@",NSStringFromCGRect(view.frame));
    NSLog(@"修改transform之前 view.bounds = %@",NSStringFromCGRect(view.bounds));
    NSLog(@"修改transform之前 view.center = %@",NSStringFromCGPoint(view.center));

//    view.transform = CGAffineTransformMakeRotation(M_PI/3);
    view.transform = CGAffineTransformMakeTranslation(200, 200);
//    view.transform = CGAffineTransformMakeScale(0.5, 0.5);
    
//    view.frame  = CGRectMake(100, 100, 200, 200);
//    view.bounds  = CGRectMake(0, 0, 200, 50);
    NSLog(@"修改transform之后 view.frame = %@",NSStringFromCGRect(view.frame));
    NSLog(@"修改transform之后 view.bounds = %@",NSStringFromCGRect(view.bounds));
    NSLog(@"修改transform之后 view.center = %@",NSStringFromCGPoint(view.center));

    
    
//    UIView *bview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
//    bview.backgroundColor = [UIColor blueColor];
//    [view addSubview:bview];
    
}








- (void)btnClick:(UIButton *)btn
{
    NSLog(@"btn click    btn.frame=%@",NSStringFromCGRect(btn.frame));
    NSLog(@"btn click    btn.bounds=%@",NSStringFromCGRect(btn.bounds));

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

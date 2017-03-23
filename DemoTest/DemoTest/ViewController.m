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
    
    TestView *view = [[TestView alloc] init];
    view.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:view];
    
//    man *m = [[man alloc] init];
//    [m run];
    
    
    NSLog(@"view.frame = %@",NSStringFromCGRect(view.frame));
    NSLog(@"view.bounds = %@",NSStringFromCGRect(view.bounds));

    
    view.transform = CGAffineTransformMakeRotation(M_PI/3);
    
//    view.transform = CGAffineTransformMakeTranslation(200, 200);
    view.transform = CGAffineTransformMakeScale(0.5, 0.5);
    
    NSLog(@"view.frame = %@",NSStringFromCGRect(view.frame));
    NSLog(@"view.bounds = %@",NSStringFromCGRect(view.bounds));

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

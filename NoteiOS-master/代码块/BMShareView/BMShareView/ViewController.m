//
//  ViewController.m
//  BMShareView
//
//  Created by ___liangdahong on 2017/3/9.
//  Copyright © 2017年 http://idhong.com/. All rights reserved.
//

#import "ViewController.h"
#import "BMShareManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [BMShareManager showShareManager];
}

@end

//
//  ViewController.m
//  RunLoop
//
//  Created by yi on 17/3/29.
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
    
    
    NSString *NOTIFICATION_NAME = @"NOTIFICATION_NAME";
    
    NSLog(@"Current thread = %@", [NSThread currentThread]);
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:NOTIFICATION_NAME object:nil];
    
}

- (void)handleNotification:(NSNotification *)notification {
    NSLog(@"Receive notification，Current thread = %@", [NSThread currentThread]);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

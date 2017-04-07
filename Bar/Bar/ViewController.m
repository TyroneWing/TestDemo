//
//  ViewController.m
//  Bar
//
//  Created by yi on 17/4/7.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "ViewController.h"
#import "testLabel.h"
#import "UILabel+Ext.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *alabel;
@property (weak, nonatomic) IBOutlet testLabel *blabel;
@property (weak, nonatomic) IBOutlet UILabel *clabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _alabel.labelRect = CGSizeMake(30, 30);
    //_alabel.labelRect = CGSizeMake(30, 30);

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    _alabel.text = @"touchesBegantouchesBegan";
    _blabel.text = @"touchesBegantouchesBegan";
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

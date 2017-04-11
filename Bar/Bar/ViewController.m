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

@property (strong, nonatomic)  UILabel *dlabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _dlabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 300, 100, 30)];
    _dlabel.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_dlabel];
    _dlabel.text = @"123";
//    _dlabel.marginRect = CGSizeMake(10, 10);
    
    CGSize sizeThatFits = [_dlabel sizeThatFits:_dlabel.frame.size];
    NSLog(@"---- %f  %f ----", sizeThatFits.width, sizeThatFits.height);
    _dlabel.frame = CGRectMake(100, 300, sizeThatFits.width+10, sizeThatFits.height+10);
    
//    [_dlabel sizeToFit];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    _alabel.text = @"touchesBegantouchesBegan";
    _blabel.text = @"touchesBegantouchesBegan";
    
    
    NSLog(@"%@",NSStringFromCGRect(_dlabel.frame));
    _dlabel.text = @"77878888888";
    [_dlabel sizeToFit];
    NSLog(@"%@",NSStringFromCGRect(_dlabel.frame));

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  ViewController.m
//  LineDash
//
//  Created by yi on 17/4/22.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "ViewController.h"
#import "LineDashView.h"
@interface ViewController ()
{
    LineDashView *line;
    CGFloat ph;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    ph = 350;
    
    line = [[LineDashView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
//    line.dashLayer.phase = 0;
    [self.view addSubview:line];
    
    
    
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(function:) userInfo:nil repeats:YES];

}

- (IBAction)slideHandle:(UISlider *)sender {
    
    line.dashLayer.phase = - sender.value * 35 *10;
}

- (void)function:(NSTimer *)timer
{
    if (ph>0) {
        ph -- ;
    } else {
        ph = 700;
    }
    
    line.dashLayer.phase = ph;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

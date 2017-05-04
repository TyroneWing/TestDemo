//
//  ViewController.m
//  WaugeTest
//
//  Created by __liangdahong on 2017/4/21.
//  Copyright © 2017年 http://tyronewing.top/. All rights reserved.
//

#import "ViewController.h"
#import "WaugeView.h"

#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

@interface ViewController ()
@property (strong, nonatomic) WaugeView *gaugeView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _gaugeView = [[WaugeView alloc] initWithFrame:CGRectMake((self.view.bounds.size.width-200)/2, 50, 200, 200)];
    _gaugeView.backgroundColor = [UIColor whiteColor];
    
//    _gaugeView.scalePosition = 0.01;
    
    
    _gaugeView.scaleDivisions = 8;
    _gaugeView.scaleSubdivisions = 13;
    
    
    _gaugeView.minValue = 20;
    _gaugeView.maxValue = 150.0;
    _gaugeView.showRangeLabels = YES;
    _gaugeView.rangeValues = @[@40,@80,@150];
    _gaugeView.rangeColors = @[ RGB(34, 189, 190),  RGB(71, 158, 238),  RGB(207, 99, 108),RGB(255, 0, 0),RGB(147, 0, 0),RGB(0, 0, 0)];
    _gaugeView.rangeLabels = @[@"Lower",@"aaa",@"异常"];
    _gaugeView.unitOfMeasurement = @"浑浊度";
    _gaugeView.showUnitOfMeasurement = YES;
    
    
    [_gaugeView setValue:53 animated:YES duration:1 completion:^(BOOL finished) {
        
    }];
    
    [self.view addSubview:_gaugeView];
    
    
    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testBtn.frame = CGRectMake((self.view.bounds.size.width-120)/2, 300, 120, 45);
    testBtn.backgroundColor = RGB(95,177,237);
    [testBtn setTitle:@"change" forState:UIControlStateNormal];
    testBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [testBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [testBtn addTarget:self action:@selector(testBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];
    
}


- (void)changeValue
{
    [_gaugeView setValue:arc4random()%130+20 animated:YES duration:1 completion:^(BOOL finished) {
        
    }];
}

- (void)testBtnClick:(UIButton *)btn
{
    [self changeValue];
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

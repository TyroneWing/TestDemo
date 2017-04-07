//
//  ViewController.m
//  BMXib-01
//
//  Created by ___liangdahong on 2017/3/17.
//  Copyright © 2017年 ___liangdahong. All rights reserved.
//

#import "ViewController.h"
#import "BMView.h"
#import "Masonry.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet BMView *myView;
@property (weak, nonatomic) IBOutlet BMView *myView2;
@property (strong, nonatomic) BMView *myView3;

@end

@implementation ViewController

- (BMView *)myView3 {
    if (!_myView3) {
        _myView3 = [BMView new];
        _myView3.backgroundColor = [UIColor orangeColor];
    }
    return _myView3;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.myView3];
    [self.myView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(200);
        make.left.right.mas_equalTo(20);
    }];

    self.myView3.titleLabel.text = @"titleLabeltitleLabeltitleLabeltitleLabeltitleLabeltitleLabeltitleLabeltitleLabeltitleLabeltitleLabeltitleLabeltitleLabeltitleLabeltitleLabeltitleLabeltitleLabeltitleLabeltitleLabeltitleLabeltitleLabeltitleLabeltitleLabeltitleLabeltitleLabeltitleLabeltitleLabel";
    NSLog(@"self.myView3.contentView: %@ \n %@", self.myView3.contentView, self.myView3.contentView.subviews);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    self.myView.mySwitch.on = !self.myView.mySwitch.isOn;
    self.myView2.mySwitch.on = !self.myView2.mySwitch.isOn;    
}

@end

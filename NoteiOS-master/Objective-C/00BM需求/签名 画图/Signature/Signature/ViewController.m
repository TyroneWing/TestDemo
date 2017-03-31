//
//  ViewController.m
//  Signature
//
//  Created by ___liangdahong on 16/8/31.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

#import "ViewController.h"
#import "PJRSignatureView.h"
#import "BMAlertSignView.h"

@interface ViewController ()

@property (nonatomic, strong) PJRSignatureView *signatureView;

@end

@implementation ViewController

- (PJRSignatureView *)signatureView {
    if (!_signatureView) {
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        CGFloat h = [UIScreen mainScreen].bounds.size.height;
        _signatureView = [PJRSignatureView signatureViewWithFrame:CGRectMake(0, 0, w, h-40-64) promptView:nil];
        _signatureView.lineWidth = 10;
        _signatureView.lineColor = [UIColor orangeColor];
    }
    return _signatureView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.signatureView];

}

- (IBAction)clearClick:(id)sender {
    [self.signatureView clear];
}

- (IBAction)okClick:(id)sender {
    [BMAlertSignView showWithImage:self.signatureView.signatureImage];
}

- (IBAction)add:(id)sender {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.frame = CGRectMake(100, 100, 20, 20);
    self.signatureView.promptView = button;
}

@end

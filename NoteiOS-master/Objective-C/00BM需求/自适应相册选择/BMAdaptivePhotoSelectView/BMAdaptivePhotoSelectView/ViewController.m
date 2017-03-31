//
//  ViewController.m
//  BMAdaptivePhotoSelectView
//
//  Created by ___liangdahong on 16/9/26.
//  Copyright © 2016年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "ViewController.h"
#import "BMMyAdaptivePhotoSelectView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet BMMyAdaptivePhotoSelectView *myyyy;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)aa:(id)sender {
    NSLog(@"%@", self.myyyy.imageArray);
}

@end

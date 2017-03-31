//
//  ViewController.m
//  photoSelectDemo
//
//  Created by __liangdahong on 2016/10/31.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "ViewController.h"
#import "BMSignAdaptivePhotoSelectView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet BMSignAdaptivePhotoSelectView *aa;

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@", self.aa.imageArray);
}


@end

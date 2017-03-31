
//
//  BMCommonEffectViewController.m
//  IOS常见效果
//
//  Created by 1 on 16/2/14.
//  Copyright © 2016年 Daredos. All rights reserved.
//

#import "BMCommonEffectViewController.h"
#import "UIView+BMAnimation.h"

#define kKEY_ANIMA_PATH @"transform.rotation"

@interface BMCommonEffectViewController ()

@property (strong, nonatomic) UIView *anView;

@end

@implementation BMCommonEffectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self anView];
    
}

- (UIView *)anView
{
    if (_anView == nil) {
        _anView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        _anView.backgroundColor = [UIColor redColor];
        _anView.center = self.view.center;
        [self.view addSubview:_anView];
    }
    return _anView;
}

- (IBAction)alertBtnClick:(id)sender {

}

- (IBAction)imageBtnClick:(id)sender {
    UIButton *buton = (UIButton *)sender;
    if (buton.selected) {

        // 1.创建核心动画
        CAKeyframeAnimation  *keyAnima = [CAKeyframeAnimation animation];
        keyAnima.keyPath = kKEY_ANIMA_PATH;

        // 角度范围
        keyAnima.values = @[@(M_PI/2.0), @(0)];
        
        // 是否返回起点
        keyAnima.removedOnCompletion = NO;
        keyAnima.fillMode = kCAFillModeBoth;
        
        keyAnima.duration = 0.3;
        
        // 设置动画重复的次数
        keyAnima.repeatCount = 1;
        
        // 2.添加核心动画
        
        [buton.layer addAnimation:keyAnima forKey:nil];

        buton.selected = NO;
    }else{
//        [buton bm_addKeyAnimaClockwise_90_WithDuration:0.3];
        buton.selected = YES;
        
        
        // 1.创建核心动画
        CAKeyframeAnimation  *keyAnima = [CAKeyframeAnimation animation];
        keyAnima.keyPath = kKEY_ANIMA_PATH;
        
        keyAnima.values = @[@(0), @(M_PI/2.0)];
        
        // 是否返回起点
        keyAnima.removedOnCompletion = NO;
        keyAnima.fillMode = kCAFillModeBoth;
        
        keyAnima.duration = 0.3;
        
        // 设置动画重复的次数
        keyAnima.repeatCount = 1;
        
        // 2.添加核心动画
        
        [buton.layer addAnimation:keyAnima forKey:nil];
        

    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    // 1.创建核心动画
    CAKeyframeAnimation  *keyAnima = [CAKeyframeAnimation animation];
    keyAnima.keyPath = kKEY_ANIMA_PATH;
    
    keyAnima.values = @[@0, @(M_PI/5.0)];
    
    // 是否返回起点
    keyAnima.removedOnCompletion = NO;
        keyAnima.fillMode = kCAFillModeBoth;
    
    keyAnima.duration = 0.3;
    
    // 设置动画重复的次数
    keyAnima.repeatCount = 1;
    
    // 2.添加核心动画
    [self.anView.layer addAnimation:keyAnima forKey:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 1.创建核心动画
    CAKeyframeAnimation  *keyAnima = [CAKeyframeAnimation animation];
    keyAnima.keyPath = kKEY_ANIMA_PATH;
    
    keyAnima.values = @[@(-M_PI/5.0), @(M_PI/5.0)];
    
    // 是否返回起点
    keyAnima.removedOnCompletion = NO;
//    keyAnima.fillMode = kCAFillModeBoth;
    
    keyAnima.duration = 0.3;
    
    // 设置动画重复的次数
    keyAnima.repeatCount = 1;
    
    // 2.添加核心动画
    [self.anView.layer addAnimation:keyAnima forKey:nil];
}

- (IBAction)iosScrollCellClick:(id)sender {

//    [self.navigationController pushViewController:[BMIostCellScrollViewController new] animated:YES];
}
- (IBAction)pagingClick:(id)sender {
    
//    [self.navigationController pushViewController:[BMPagingViewController new] animated:YES];
}

- (IBAction)antiClockwiseClick:(id)sender {
    [self.anView bm_addkeyAnimaAntiClockwise_90_WithDuration:0.3];
}

- (IBAction)ClockwiseClick:(id)sender {
    
    [self.anView bm_addKeyAnimaClockwise_90_WithDuration:1];
}

- (IBAction)reClick:(id)sender {
    
//    [self.navigationController pushViewController:[BMRefreshViewController new] animated:YES];

}


@end

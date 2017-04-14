//
//  ViewController.m
//  mianshiTest
//
//  Created by __liangdahong on 2017/4/13.
//  Copyright © 2017年 http://idhong.com/. All rights reserved.
//

#import "ViewController.h"
#import "TestSubView.h"
#import "TestView+Ext.h"
#import "ZYScrollView.h"


@interface ViewController ()<UIScrollViewDelegate>
{
//    UIScrollView *scrollview;
    UIView *view;
    
    UIView *boundView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    TestSubView *test = [[TestSubView alloc] init];
//    [test test];
    
    
//    scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(50, 50, 200, 400)];
//    scrollview.contentSize = CGSizeMake(200, 500);
//    scrollview.backgroundColor = [UIColor redColor];
//    
//    view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    view.backgroundColor = [UIColor yellowColor];
//    scrollview.maximumZoomScale = 4;
//    [scrollview addSubview:view];
//    
//    scrollview.delegate = self;
////    scrollview.contentOffset = CGPointMake(100, 100);
////    scrollview.contentInset = UIEdgeInsetsMake(100, 100, 100, 100);
//    [self.view addSubview:scrollview];
    
//    boundView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    boundView.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:boundView];
    
    
    
//    ZYScrollView *scrollView = [[ZYScrollView alloc]initWithFrame:self.view.bounds];
//    [self.view addSubview:scrollView];
//    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width+100, self.view.bounds.size.height+100);
//    UIView *redView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
//    redView.backgroundColor = [UIColor redColor];
//    [scrollView addSubview:redView];

    
    UIView *xib = [[[NSBundle mainBundle] loadNibNamed:@"XibView" owner:nil options:nil] firstObject];
//    xib.frame = CGRectMake(100, 100, 200, 200);
    
    [self.view addSubview:xib];
    
    
//    UIAlertView *alert = [UIAlertView alloc] initWithTitle:<#(nullable NSString *)#> message:<#(nullable NSString *)#> delegate:<#(nullable id)#> cancelButtonTitle:<#(nullable NSString *)#> otherButtonTitles:<#(nullable NSString *), ...#>, nil;
    
    
    
}



- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    //scrollView上的缩放手势，让view缩放
    return view;
}


//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    boundView.bounds = CGRectMake(0, 0, 200, 200);
//    NSLog(@"boundView.bounds %@",NSStringFromCGRect(boundView.bounds));
//    NSLog(@"boundView.frame %@",NSStringFromCGRect(boundView.frame));
//
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

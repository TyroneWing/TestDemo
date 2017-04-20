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
    UIScrollView *scrollview;
    UIView *view;
    
    UIView *boundView;
}

@property (nonatomic,strong) UIAlertController *alertcontroller;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
//    TestSubView *test = [[TestSubView alloc] init];
//    [test test];
    
    
    scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(50, 50, 200, 400)];
    scrollview.contentSize = CGSizeMake(200, 500);
    scrollview.backgroundColor = [UIColor redColor];
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



//- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
//{
//    //scrollView上的缩放手势，让view缩放
//    return view;
//}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    boundView.bounds = CGRectMake(0, 0, 200, 200);
//    NSLog(@"boundView.bounds %@",NSStringFromCGRect(boundView.bounds));
//    NSLog(@"boundView.frame %@",NSStringFromCGRect(boundView.frame));
    
       NSLog(@"scrollview.bounds = %@",NSStringFromCGRect(scrollview.bounds));

    //[self alertvc];
    
    [self alertVC];
}



- (void)alertVC
{
    //包含输入框的模式：
    
    //创建提示窗口 Title：标题 message：提示内容 Style:风格
    self.alertcontroller = [UIAlertController alertControllerWithTitle:@"提示" message:@"请按提示操作！" preferredStyle:UIAlertControllerStyleAlert];
    
    __weak __typeof(&*self)weakSelf = self;//block 中防止循环引用
    [self.alertcontroller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        //通过通知监听textField的改变
        [[NSNotificationCenter defaultCenter] addObserver:weakSelf selector:@selector(alertTextFieldDidChange:) name:UITextFieldTextDidChangeNotification object:textField];
        
        textField.placeholder = @"请输入六位用户名";
        
    }];
    
    
    //实例化取消按钮
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
        NSLog(@"点击了取消...");
        
        
    }];
    
    //实例化确定按钮
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
        //可以在这里获取textFields的信息
        NSString *userName =   self.alertcontroller.textFields.lastObject.text;
        NSLog(@"该用户名：%@",userName);
        
    }];
    
    
    [_alertcontroller addAction:cancelAction];
    [_alertcontroller addAction:sureAction];
    //弹出提示框
    [self presentViewController:self.alertcontroller animated:YES completion:nil];
    
    
    

}


- (void)alertTextFieldDidChange:(NSNotification *)notification{
    
    NSString *userName =   self.alertcontroller.textFields.lastObject.text;
    NSLog(@"该用户名：%@",userName);
    
    
}

- (void)alertvc
{
    //创建提示窗口 Title：标题 message：提示内容 Style:风格
    self.alertcontroller = [UIAlertController alertControllerWithTitle:@"提示" message:@"请按提示操作！" preferredStyle:UIAlertControllerStyleActionSheet];
    
    //实例化取消按钮
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"点击了取消...");
        
        
    }];
    
    //实例化确定按钮
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
        
        //对按钮应用标准样式：  UIAlertActionStyleDefault
        //对按钮应用取消样式： UIAlertActionStyleCancel
        //对按钮应用警示性的样式：UIAlertActionStyleDestructive
        
        
        NSLog(@"点击了确定...");
        
    }];
    
    //实例化其他按钮
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"其他" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"点击了其他...");
        
    }];
    
    
    [_alertcontroller addAction:cancelAction];
    [_alertcontroller addAction:sureAction];
    [_alertcontroller addAction:otherAction];
    //弹出提示框
    [self presentViewController:self.alertcontroller animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

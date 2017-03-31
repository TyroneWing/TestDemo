//
//  ViewController.m
//  BMQRBarCode
//
//  Created by ___liangdahong on 16/8/30.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+BMQRBarCode.h"
#import "MyScanfVC.h"
#import "MyZXingVC.h"
#import "MyInputVCViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *codeImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *codeImageViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *codeImageViewWight;
@property (weak, nonatomic) IBOutlet UITextField *codeFiled;

@end

@implementation ViewController

- (IBAction)qrcodeClick:(id)sender {
    
    if (self.codeFiled.text.length == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请输入字符串" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:0 handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }

    UIImage *codeImage = [UIImage bm_imageWithQRCode:self.codeFiled.text centerImage:nil maxSize:CGSizeMake(300, 300)];
    self.codeImageView.image = codeImage;
    self.codeImageViewWight.constant = codeImage.size.width;
    self.codeImageViewHeight.constant = codeImage.size.height;
}
- (IBAction)input:(id)sender {
    [self.navigationController pushViewController:[MyInputVCViewController new] animated:YES];
}

- (IBAction)barCodeClick:(id)sender {

    if (self.codeFiled.text.length == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请输入字符串" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:0 handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    
    UIImage *codeImage = [UIImage bm_imageWithBarCode:self.codeFiled.text maxSize:CGSizeMake(300, 100)];
    self.codeImageView.image = codeImage;
    self.codeImageViewWight.constant = codeImage.size.width;
    self.codeImageViewHeight.constant = codeImage.size.height;
}

- (IBAction)scanfCodeClick:(id)sender {
    
    [self.navigationController pushViewController:[MyScanfVC new] animated:YES];
}



- (IBAction)zxingClick:(id)sender {
    [self.navigationController pushViewController:[MyZXingVC new] animated:YES];
}



@end

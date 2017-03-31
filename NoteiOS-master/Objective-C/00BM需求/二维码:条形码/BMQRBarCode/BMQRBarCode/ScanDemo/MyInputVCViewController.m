//
//  MyInputVCViewController.m
//  BMQRBarCode
//
//  Created by ___liangdahong on 16/9/1.
//  Copyright © 2016年 elvin. All rights reserved.
//

#import "MyInputVCViewController.h"

@interface MyInputVCViewController ()

@end

@implementation MyInputVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.inputTextField.placeholder = @"a";
}

- (void)confirmButtonClickWithCodeString:(NSString *)codeString {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:codeString message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)scanCodeButtonClick {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"扫描二维码" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
@end

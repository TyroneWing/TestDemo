//
//  BMLongPressGestureVC.m
//  BMQRBarCode
//
//  Created by ___liangdahong on 16/8/30.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

#import "BMLongPressGestureVC.h"
#import "UIImage+BMQRBarCode.h"

@interface BMLongPressGestureVC ()
@property (weak, nonatomic) IBOutlet UIImageView *panImageView;
@property (weak, nonatomic) IBOutlet UILabel *codeLabel;
@end

@implementation BMLongPressGestureVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.panImageView.userInteractionEnabled = YES;
    [self.panImageView addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(panClick)]];

    self.panImageView.image = [UIImage imageNamed:@"mywx"];;
}

- (void)panClick {

    [UIImage bm_readQRCodeFromImage:self.panImageView.image codeBlock:^(NSString *qrString, NSError *error) {
        if (error) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"识别失败" message:error.domain preferredStyle:UIAlertControllerStyleActionSheet];
            [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:0 handler:nil]];
            [alert presentViewController:self animated:YES completion:nil];
            NSLog(@"%@",error);
            return ;
        }
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"识别成功" message:qrString preferredStyle:UIAlertControllerStyleActionSheet];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:0 handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
        NSLog(@"qrString = %@",qrString);
        self.codeLabel.text = qrString;
    }];
}
@end

//
//  BMPhotoAlbumVC.m
//  BMQRBarCode
//
//  Created by ___liangdahong on 16/8/30.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

#import "BMPhotoAlbumVC.h"
#import "UIImage+BMQRBarCode.h"
#import <AVFoundation/AVFoundation.h>

#define alert(title)\
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];\
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:0 handler:nil]];\
    [self presentViewController:alert animated:YES completion:nil];\

@interface BMPhotoAlbumVC () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation BMPhotoAlbumVC

#pragma mark -
#pragma mark - 系统delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {

    [self dismissViewControllerAnimated:YES completion:nil];
    if (info[UIImagePickerControllerOriginalImage]) {
        UIImage *image = info[UIImagePickerControllerOriginalImage];
        [UIImage bm_readQRCodeFromImage:image codeBlock:^(NSString *qrString, NSError *error) {
            if (error) {
                alert(error.domain);
                return ;
            }
            alert(qrString);
        }];
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 私有方法

// 是否有相册权限
+ (BOOL)bm_haveCameraPower
{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) return NO;
    return YES;
}

#pragma mark - 事件响应
- (IBAction)photoAlbumClick:(id)sender {
    
    if (![BMPhotoAlbumVC bm_haveCameraPower]) {
        alert(@"无相机权限");
        return;
    }
    UIImagePickerController *vcPicker = [[UIImagePickerController alloc] init];
    vcPicker.delegate = self;
    vcPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:vcPicker animated:YES completion:nil];
}





@end

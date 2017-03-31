//
//  LibVC.m
//  File
//
//  Created by ___liangdahong on 2016/11/28.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "LibVC.h"

@interface LibVC () <UIDocumentInteractionControllerDelegate>

@end

@implementation LibVC

- (IBAction)word:(id)sender {
    [self openWithName:@"aa1" type:@"docx"];
}

- (IBAction)xlsx:(id)sender {
    [self openWithName:@"aa2" type:@"xlsx"];
}

- (IBAction)ppt:(id)sender {
    [self openWithName:@"aa3" type:@"ppt"];
    
}
- (IBAction)pdf:(id)sender {
    [self openWithName:@"aa4" type:@"pdf"];
}

- (IBAction)png:(id)sender {
    [self openWithName:@"aa5" type:@"png"];
}

- (IBAction)java:(id)sender {
    [self openWithName:@"aa6" type:@"java"];
}

- (void)openWithName:(NSString *)name type:(NSString *)type {
    
    // 文件完整路径
    NSString *path =  [[NSBundle mainBundle] pathForResource:name ofType:type];

    // 如果路径不存在
    if (!path || path.length == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"没有文件" message:nil preferredStyle:1];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:0 handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }

    // 获取文件的 URL
    NSURL *filePathURL = [NSURL fileURLWithPath:path];

    // 创建打开文件选择弹窗
    UIDocumentInteractionController *documentController = [UIDocumentInteractionController interactionControllerWithURL:filePathURL];

    // 设置尺寸
    BOOL result = [documentController presentOptionsMenuFromRect:CGRectMake(0, 0, 200, 200) inView:self.view animated:NO];

    // 是否打开成功
    if (!result) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"暂时无法打开此类型的文件" message:nil preferredStyle:1];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:0 handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (UIViewController *)documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController *)controller {
    return self;
}

- (UIView *)documentInteractionControllerViewForPreview:(UIDocumentInteractionController *)controller {
    return self.view;
}

- (CGRect)documentInteractionControllerRectForPreview:(UIDocumentInteractionController *)controller {
    return self.view.frame;
}
@end




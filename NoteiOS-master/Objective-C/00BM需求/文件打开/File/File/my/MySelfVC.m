//
//  MySelfVC.m
//  File
//
//  Created by ___liangdahong on 2016/11/28.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "MySelfVC.h"
#import "MYSelfDataVC.h"

@interface MySelfVC ()

@end

@implementation MySelfVC


- (IBAction)word:(id)sender {
    [self pushWithName:@"aa1" type:@"docx"];
}

- (IBAction)xlsx:(id)sender {
    [self pushWithName:@"aa2" type:@"xlsx"];
}

- (IBAction)ppt:(id)sender {
    [self pushWithName:@"aa3" type:@"ppt"];

}
- (IBAction)pdf:(id)sender {
    [self pushWithName:@"aa4" type:@"pdf"];
}

- (IBAction)png:(id)sender {
    [self pushWithName:@"aa5" type:@"png"];
}

- (IBAction)java:(id)sender {
    [self pushWithName:@"aa6" type:@"java"];
}

- (void)pushWithName:(NSString *)name type:(NSString *)type {
    // 创建
    MYSelfDataVC *vc = [MYSelfDataVC new];

    NSString *path =  [[NSBundle mainBundle] pathForResource:name ofType:type];
    
    if (!path || path.length == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"无法打开" message:nil preferredStyle:1];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:0 handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    vc.path =  path;
    [self.navigationController pushViewController:vc animated:YES];
}

#define url @"https://nj02all01.baidupcs.com/file/4e5d6b8cb698f61722af2a57716be853?bkt=p3-14004e5d6b8cb698f61722af2a57716be853f8e52836000000003043&fid=2001286221-250528-749694236100599&time=1480311709&sign=FDTAXGERLBH-DCb740ccc5511e5e8fedcff06b081203-2AjnmBZH0IWTaf6L%2FTv5kb%2Fhzbw%3D&to=nj2hb&fm=Yan,B,U,ny&sta_dx=12355&sta_cs=1&sta_ft=xlsx&sta_ct=0&sta_mt=0&fm2=Yangquan,B,U,ny&newver=1&newfm=1&secfm=1&flow_ver=3&pkey=14004e5d6b8cb698f61722af2a57716be853f8e52836000000003043&sl=72089678&expires=8h&rt=pr&r=563914741&mlogid=7713253893228193316&vuk=2001286221&vbdid=3913323236&fin=aa2.xlsx&fn=aa2.xlsx&slt=pm&uta=0&rtype=1&iv=0&isw=0&dp-logid=7713253893228193316&dp-callid=0.1.1&hps=1&csl=147&csign=%2BTxeG9c4dj2dFXxs1RCVJVOpsjw%3D"

- (void)downlaod {
    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSData *data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:url]];
//
//        NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//
//        // 创建一个存放NSData数据的路径
//        NSString *fileDataPath = [docPath stringByAppendingPathComponent:@"bdy.xlsx"];
//
//        // 将UIImage对象转换成NSData对象
//        [data writeToFile:fileDataPath atomically:YES];
//        NSLog(@"fileDataPath is %@", fileDataPath);
//
//        dispatch_async(dispatch_get_main_queue(), ^{
//            MYSelfDataVC *vc = [MYSelfDataVC new];
//            NSString *path =  fileDataPath;
//            if (!path || path.length == 0) {
//                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"无法打开" message:nil preferredStyle:1];
//                [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:0 handler:nil]];
//                [self presentViewController:alert animated:YES completion:nil];
//                return;
//            }
//            vc.path =  path;
//            [self.navigationController pushViewController:vc animated:YES];
//        });
//    });
//

    
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"name.ppt"];
    UIWebView *web = [UIWebView new];
    [web loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]]];

    
//    NSArray arry4= NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
//    NSString path=[arry4 lastObject];
//    path=[path stringByAppendingPathComponent:@"Preferences"];
//    NSLog(@"%@",path);    
}

@end

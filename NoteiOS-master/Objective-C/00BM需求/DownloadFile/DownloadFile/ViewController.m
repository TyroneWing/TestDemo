//
//  ViewController.m
//  DownloadFile
//
//  Created by __liangdahong on 2016/12/3.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "ViewController.h"
#import "BMFileDownloadManager.h"
#import "BMVC.h"
#import "AFNetworking.h"
#import "AFURLSessionManager.h"

#define url1 @"https://0ge51hcji8rzdnqbofaaugp3pcoa1haubpf18khddqczgg55p.ourdvsss.com/d1.baidupcs.com/file/8ba51cbd33ff2ac870951ca472e2e5c5?bkt=p3-0000b018da1d755af1f5c3fc812107f771b3&xcode=7f8351da081ddb98bb8350232c6f587bccad1d000c21651a0967cef3f0948c81&fid=2001286221-250528-756962907371374&time=1480919974&sign=FDTAXGERLBH-DCb740ccc5511e5e8fedcff06b081203-GxzGagWgrMmypBauda9YUFmCqTk%3D&to=sf&fm=Nin,B,T,t&sta_dx=16459958&sta_cs=6578&sta_ft=pdf&sta_ct=7&sta_mt=5&fm2=Ningbo,B,T,t&newver=1&newfm=1&secfm=1&flow_ver=3&pkey=000086cd3558915ddb52d98662f15f8efeed&sl=75104334&expires=8h&rt=pr&r=517434776&mlogid=7876533657871549756&vuk=2001286221&vbdid=3913323236&fin=17-AVR%E5%8D%95%E7%89%87%E6%9C%BAC%E8%AF%AD%E8%A8%80%E5%BC%80%E5%8F%91%E5%85%A5%E9%97%A8%E6%8C%87%E5%AF%BC.pdf&fn=17-AVR%E5%8D%95%E7%89%87%E6%9C%BAC%E8%AF%AD%E8%A8%80%E5%BC%80%E5%8F%91%E5%85%A5%E9%97%A8%E6%8C%87%E5%AF%BC.pdf&slt=pm&uta=0&rtype=1&iv=0&isw=0&dp-logid=7876533657871549756&dp-callid=0.1.1&hps=1&csl=165&csign=kn1%2B6J%2BBrn41f6kg%2BAts05XSYbM%3D&wshc_tag=0&wsts_tag=58450ba7&wsid_tag=3b296ff2&wsiphost=ipdbm"

#define url2 @"https://1gr3drmt1gehnhctwfa5dnmmrgrzgramjct4zya5uf3ts65e.ourdvsss.com/d1.baidupcs.com/file/fbc4a18c7df99ab9d1eb65c9188e6be0?bkt=p3-00002008d5d1a77f87ad74ebe85782f3ce4b&xcode=f212c2a6f068484fd5b197152665933e75c5a77c253d33211682cb8519c2059f&fid=2001286221-250528-110482330266146&time=1480920489&sign=FDTAXGERLBH-DCb740ccc5511e5e8fedcff06b081203-97X90YqqPpmIJuoHZJCW4NI35A8%3D&to=sf&fm=Yan,B,T,t&sta_dx=9521373&sta_cs=234&sta_ft=dmg&sta_ct=5&sta_mt=5&fm2=Yangquan,B,T,t&newver=1&newfm=1&secfm=1&flow_ver=3&pkey=00002008d5d1a77f87ad74ebe85782f3ce4b&sl=68026446&expires=8h&rt=pr&r=615649978&mlogid=7876672002516125603&vuk=2001286221&vbdid=3913323236&fin=betterzip.dmg&fn=betterzip.dmg&slt=pm&uta=0&rtype=1&iv=0&isw=0&dp-logid=7876672002516125603&dp-callid=0.1.1&hps=1&csl=209&csign=LmXQwPqN2jYiJDAWVRJzwW62O4U%3D&wshc_tag=0&wsts_tag=58450daa&wsid_tag=3b296ff2&wsiphost=ipdbm"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIProgressView *prog1;
@property (weak, nonatomic) IBOutlet UIProgressView *prog2;
@property (weak, nonatomic) IBOutlet UILabel *sizeLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.prog1.progress = 0.0;
    self.prog2.progress = 0.0;

   [self get:nil];
}

- (IBAction)dowmnload1:(id)sender {

    [BMFileDownloadManager downloadFileWithURLString:url1 fileName:@"文件1" fileType:@"xlsx" downloadProgress:^(NSProgress *downloadProgress) {
        self.prog1.progress = downloadProgress.completedUnitCount*1.0 / downloadProgress.totalUnitCount*1.0;
    } successBlock:^(NSString *filePath, NSError *error) {
        if (error) {
           UIAlertView *alertView =  [[UIAlertView alloc] initWithTitle:error.domain message:nil delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alertView show];
            return ;
        }
        UIAlertView *alertView =  [[UIAlertView alloc] initWithTitle:filePath message:nil delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alertView show];
        BMVC *c = [BMVC new];
        c.filePath = filePath;
        [self.navigationController pushViewController:c animated:YES];
    }];
}
- (IBAction)dowmnload2:(id)sender {
    [BMFileDownloadManager downloadFileWithURLString:url2 fileName:@"08-51单片机C语言创新教程" fileType:@"pdf" downloadProgress:^(NSProgress *downloadProgress) {
        self.prog2.progress = downloadProgress.completedUnitCount*1.0 / downloadProgress.totalUnitCount*1.0;
    } successBlock:^(NSString *filePath, NSError *error) {
        if (error) {
            UIAlertView *alertView =  [[UIAlertView alloc] initWithTitle:error.domain message:nil delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alertView show];
            return ;
        }
        UIAlertView *alertView =  [[UIAlertView alloc] initWithTitle:filePath message:nil delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alertView show];
        BMVC *c = [BMVC new];
        c.filePath = filePath;
        [self.navigationController pushViewController:c animated:YES];
    }];
}

- (IBAction)get:(id)sender {

    uint64_t siz = [BMFileDownloadManager totalCount];
    NSString *str = nil;
    if (siz < 1024) {
        str = [NSString stringWithFormat:@"%ld b", (long)[BMFileDownloadManager totalCount]];
    }
    else if (siz >= 1024 && siz < 1024*1024) {
        str = [NSString stringWithFormat:@"%.2f kb", [BMFileDownloadManager totalCount]/1024.0];
    }
    else {
        str = [NSString stringWithFormat:@"%.2f M", [BMFileDownloadManager totalCount]/(1024.0*1024.0)];
    }
    self.sizeLabel.text = str;
    
}

- (IBAction)clearall:(id)sender {
    
    [BMFileDownloadManager clearAllCache];
}
- (IBAction)clea2:(id)sender {
    [BMFileDownloadManager clearCacheWithURLString:url2];

}

@end

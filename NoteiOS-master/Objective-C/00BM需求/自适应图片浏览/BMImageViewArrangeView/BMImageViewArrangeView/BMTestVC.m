//
//  BMTestVC.m
//  BMImageViewArrangeView
//
//  Created by ___liangdahong on 16/9/26.
//  Copyright © 2016年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "BMTestVC.h"
#import "BMImageViewArrangeView.h"

@interface BMTestVC ()
@property (weak, nonatomic) IBOutlet BMImageViewArrangeView *myInageView;

@end

@implementation BMTestVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.myInageView.imageUrlArray = @[@"http://imgsrc.baidu.com/baike/pic/item/b7fd5266d0160924b7aa2a3fd10735fae6cd3402.jpg",
                                       @"http://imgsrc.baidu.com/baike/pic/item/b7fd5266d0160924b7aa2a3fd10735fae6cd3402.jpg",
                                       @"http://imgsrc.baidu.com/baike/pic/item/b7fd5266d0160924b7aa2a3fd10735fae6cd3402.jpg",
                                       @"http://imgsrc.baidu.com/baike/pic/item/b7fd5266d0160924b7aa2a3fd10735fae6cd3402.jpg",
                                       @"http://imgsrc.baidu.com/baike/pic/item/b7fd5266d0160924b7aa2a3fd10735fae6cd3402.jpg",
                                       @"http://imgsrc.baidu.com/baike/pic/item/b7fd5266d0160924b7aa2a3fd10735fae6cd3402.jpg",
                                       @"http://imgsrc.baidu.com/baike/pic/item/b7fd5266d0160924b7aa2a3fd10735fae6cd3402.jpg",
                                       @"http://imgsrc.baidu.com/baike/pic/item/b7fd5266d0160924b7aa2a3fd10735fae6cd3402.jpg",
                                       @"http://imgsrc.baidu.com/baike/pic/item/b7fd5266d0160924b7aa2a3fd10735fae6cd3402.jpg"];
}

- (IBAction)add:(id)sender {
    NSMutableArray *muarr = [self.myInageView.imageUrlArray mutableCopy];
    [muarr addObject:@"http://imgsrc.baidu.com/baike/pic/item/b7fd5266d0160924b7aa2a3fd10735fae6cd3402.jpg"];
    self.myInageView.imageUrlArray = [muarr copy];
}

- (IBAction)sub:(id)sender {
    NSMutableArray *muarr = [self.myInageView.imageUrlArray mutableCopy];
    [muarr removeLastObject];
    self.myInageView.imageUrlArray = [muarr copy];
}
@end

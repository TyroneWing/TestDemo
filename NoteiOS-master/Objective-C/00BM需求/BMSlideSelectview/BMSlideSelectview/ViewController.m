//
//  ViewController.m
//  BMSlideSelectview
//
//  Created by __liangdahong on 2016/12/22.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "ViewController.h"
#import "BMSlideSelectView.h"

@interface ViewController ()
@property (strong, nonatomic) BMSlideSelectView *slideSelectView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.slideSelectView];
}

- (BMSlideSelectView *)slideSelectView {

    if (!_slideSelectView) {
        
        NSMutableArray *muarray = [@[] mutableCopy];
        int  arc = arc4random_uniform(10)+2;
        while (arc--) {
            BMSlideSelectModel *model = [BMSlideSelectModel new];
            model.title = @"titletitletitle";
            [muarray addObject:model];
        }
        _slideSelectView = [BMSlideSelectView slideSelectViewWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 200) dataSourceArray:muarray selectIndex:2 selectBlock:^(NSInteger selectIndex) {
            NSLog(@"%@", @(selectIndex));
        }];
    }
    return _slideSelectView;
}


- (IBAction)reload:(id)sender {
    NSMutableArray *muarray = [@[] mutableCopy];
    int  arc = arc4random_uniform(10)+2;
    while (arc--) {
        BMSlideSelectModel *model = [BMSlideSelectModel new];
        model.title = @"titletitletitletitletitletitletitletitletitletitletitletitletitletitletitle";
        [muarray addObject:model];
    }
    self.slideSelectView.dataSourceArray = muarray;
}

- (IBAction)getselect:(id)sender {
    NSLog(@"%@", @(self.slideSelectView.selectIndex));
}

- (IBAction)select:(id)sender {
    self.slideSelectView.selectIndex = arc4random_uniform(5);
}

@end

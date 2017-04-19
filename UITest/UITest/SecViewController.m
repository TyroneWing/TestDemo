//
//  SecViewController.m
//  UITest
//
//  Created by yi on 17/4/14.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "SecViewController.h"
#import "AppDelegate.h"

@interface SecViewController ()

@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Status bar touch tracking
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesBegan");
     UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    
    [super touchesBegan:touches withEvent:event];
    CGPoint location = [[[event allTouches] anyObject] locationInView:window];
    CGRect statusBarFrame = [UIApplication sharedApplication].statusBarFrame;
    if (CGRectContainsPoint(statusBarFrame, location)) {
        [self statusBarTouchedAction];
    }
}

- (void)statusBarTouchedAction {
//    [[NSNotificationCenter defaultCenter] postNotificationName:kStatusBarTappedNotification
//                                                        object:nil];
    
    NSLog(@"statusBarTouchedAction");
    
}
//Observe notification in the needed controller (e.g. in viewWillAppear):
//
//[[NSNotificationCenter defaultCenter] addObserver:self
//                                         selector:@selector(statusBarTappedAction:)
//                                             name:kStatusBarTappedNotification
//                                           object:nil];
//Remove observer properly (e.g. in viewDidDisappear):
//
//[[NSNotificationCenter defaultCenter] removeObserver:self name:kStatusBarTappedNotification object:nil];
//Implement notification-handling callback:
//
//- (void)statusBarTappedAction:(NSNotification*)notification {
//    NSLog(@"StatusBar tapped");
//    //handle StatusBar tap here.
//}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

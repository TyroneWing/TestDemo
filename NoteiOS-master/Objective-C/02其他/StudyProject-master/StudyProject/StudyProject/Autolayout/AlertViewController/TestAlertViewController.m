//
//  TestAlertViewController.m
//  StudyProject
//
//  Created by Daredos on 16/4/29.
//  Copyright © 2016年 LiangDaHong. All rights reserved.
//

#import "TestAlertViewController.h"
#import "AlertViewController.h"

@interface TestAlertViewController ()

@end

@implementation TestAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [[AlertViewController new] showAlertViewControllerWithViewController:self];
}

@end

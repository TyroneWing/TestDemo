//
//  AlertViewController.m
//  StoryBoardDemo
//
//  Created by Daredos on 16/4/29.
//  Copyright © 2016年 Daredos. All rights reserved.
//

#import "AlertViewController.h"
#import "Masonry.h"

@interface AlertViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation AlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    
    
}

- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
}

- (void)showAlertViewControllerWithViewController:(UIViewController *)viewController {

    [viewController presentViewController:self animated:NO completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:nil];
    cell.textLabel.text = @"123432r";
    return cell;
}

- (IBAction)CONCLICK:(id)sender {

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view removeFromSuperview];

    
}

- (IBAction)CANCELCLICK:(id)sender {
    

    [self dismissViewControllerAnimated:NO completion:nil];
}

@end

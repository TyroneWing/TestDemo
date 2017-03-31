//
//  GetFuncListVC.m
//  StudyProject
//
//  Created by Daredos on 16/7/26.
//  Copyright © 2016年 LiangDaHong. All rights reserved.
//

#import "GetFuncListVC.h"
#import <objc/runtime.h>

@interface GetFuncListVC ()

@end

@implementation GetFuncListVC

- (void)viewDidLoad {
    [super viewDidLoad];

    unsigned int outCount = 0;
    Method *m = class_copyMethodList([self class], &outCount);
    Method * class_copyMethodList ( Class cls, unsigned int *outCount);
}

@end

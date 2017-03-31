//
//  IHUserManager.m
//  OC
//
//  Created by ___liangdahong on 16/9/9.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

#import "IHUserManager.h"

@interface IHUserManager : NSObject

+ (instancetype)sharedInstance;

@end

@implementation IHUserManager

+ (instancetype)sharedInstance {
    static IHUserManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
@end

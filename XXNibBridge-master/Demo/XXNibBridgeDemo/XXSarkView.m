//
//  XXSarkView.m
//  XXNibBridgeDemo
//
//  Created by sunnyxx on 14-7-2.
//  Copyright (c) 2014年 sunnyxx. All rights reserved.
//

#import "XXSarkView.h"
#import "XXNibBridge.h"
#import "XXDogeView.h"

@interface XXSarkView () <XXNibBridge>  // Enable nib bridge
@property (nonatomic, weak) IBOutlet XXDogeView *dogeView;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *heightConstraint;
@end

@implementation XXSarkView

- (void)awakeFromNib {
    [super awakeFromNib];
    // IBOutlets are fine
    self.dogeView.layer.cornerRadius = 5;
    self.heightConstraint.constant = 81;
}

+ (BOOL)xx_shouldApplyNibBridging
{
    return YES;
}


@end

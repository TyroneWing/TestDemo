//
//  BMStartAnimationView.h
//  StartAnimation
//
//  Created by ___liangdahong on 2016/11/18.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMStartAnimationView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *blueImageView;
@property (weak, nonatomic) IBOutlet UIImageView *lineImageView;
@property (weak, nonatomic) IBOutlet UIImageView *moonImageView;
@property (weak, nonatomic) IBOutlet UIImageView *blueLogeImageView;
@property (weak, nonatomic) IBOutlet UIImageView *whiteLogeImageView;
+ (instancetype)startAnimationView;
@end

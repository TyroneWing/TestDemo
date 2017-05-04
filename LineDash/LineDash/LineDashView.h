//
//  LineDashView.h
//  LineDash
//
//  Created by yi on 17/4/22.
//  Copyright © 2017年 yi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DashLayer.h"

@interface LineDashView : UIView

//@property (assign,nonatomic) CGFloat phase;
@property(nonatomic,strong)DashLayer *dashLayer;



@end

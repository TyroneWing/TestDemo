//
//  BMHeaderFooterView.h
//  QQ
//
//  Created by __liangdahong on 16/9/1.
//  Copyright © 2016年 梁大红. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMHeaderFooterView : UITableViewHeaderFooterView

@property (copy, nonatomic) dispatch_block_t selectBlock;
@property (strong, nonatomic) UIImageView *icon;

@end

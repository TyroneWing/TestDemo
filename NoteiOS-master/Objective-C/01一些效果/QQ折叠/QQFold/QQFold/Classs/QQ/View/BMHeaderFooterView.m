//
//  BMHeaderFooterView.m
//  QQ
//
//  Created by __liangdahong on 16/9/1.
//  Copyright © 2016年 梁大红. All rights reserved.
//

#import "BMHeaderFooterView.h"

@interface BMHeaderFooterView ()

@end

@implementation BMHeaderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        _icon = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-20, 15, 6, 10)];
        _icon.image = [UIImage imageNamed:@"icon_right_arrow"];
        [self.contentView addSubview:_icon];
        self.backgroundView.backgroundColor = [UIColor grayColor];
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(block)]];
    }
    return self;
}

- (void)block {
    if (self.selectBlock) {
        self.selectBlock();
    }
}

@end

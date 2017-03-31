//
//  BMScanInputSettingView.m
//  BMQRBarCode
//
//  Created by ___liangdahong on 16/9/1.
//  Copyright © 2016年 elvin. All rights reserved.
//

#import "BMScanInputSettingView.h"

@implementation BMScanInputSettingView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.determineButton.alpha = 0.3;
    self.determineButton.userInteractionEnabled = NO;
}

+ (instancetype)scanInputSettingViewWithFrame:(CGRect)frame
                         determineActionBlock:(DetermineActionBlock)determineActionBlock
                             scanfActionBlock:(dispatch_block_t)scanfActionBlock {
    BMScanInputSettingView *scanSettingView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    scanSettingView.autoresizingMask = UIViewAutoresizingNone;
    scanSettingView.frame = frame;
    scanSettingView.determineActionBlock = determineActionBlock;
    scanSettingView.scanfActionBlock = scanfActionBlock;

    return scanSettingView;
}

- (IBAction)textFieldChanged:(UITextField *)sender {
    if (sender.text.length == 0) {
        self.determineButton.alpha = 0.3;
        self.determineButton.userInteractionEnabled = NO;
    }else{
        self.determineButton.alpha = 1;
        self.determineButton.userInteractionEnabled = YES;
    }
}

- (IBAction)determineButtonClick {
    if (self.determineActionBlock) {
        self.determineActionBlock(self.inputTextField.text);
    }
}

- (IBAction)scanfButtonClick {
    if (self.scanfActionBlock) {
        self.scanfActionBlock();
    }
}
@end

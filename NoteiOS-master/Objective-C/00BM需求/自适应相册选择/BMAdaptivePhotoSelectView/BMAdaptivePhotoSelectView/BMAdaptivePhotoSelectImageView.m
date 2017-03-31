//
//  BMAdaptivePhotoSelectImageView.m
//  BMAdaptivePhotoSelectView
//
//  Created by ___liangdahong on 16/9/26.
//  Copyright © 2016年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "BMAdaptivePhotoSelectImageView.h"

@interface BMAdaptivePhotoSelectImageView ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *removeButton;

@property (nonatomic, copy) BMAdaptiveAddImageViewBlock addImageViewEndBlock;
@property (nonatomic, copy) BMAdaptiveAddImageViewBlock removeImageEndBlock;
@property (nonatomic, copy) BMAdaptiveAddImageViewBlock tapImageBlock;
@end

@implementation BMAdaptivePhotoSelectImageView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.imageView.userInteractionEnabled = YES;
    [self.imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView)]];
}

+ (instancetype)adaptivePhotoSelectImageViewWithFrame:(CGRect)frame
                                           boothImage:(UIImage *)boothImage
                                          selectImage:(UIImage *)selectImage
                                 addImageViewEndBlock:(BMAdaptiveAddImageViewBlock)addImageViewEndBlock
                                  removeImageEndBlock:(BMAdaptiveAddImageViewBlock)removeImageEndBlock
                                        tapImageBlock:(BMAdaptiveAddImageViewBlock)tapImageBlock {
    BMAdaptivePhotoSelectImageView *adaptivePhotoSelectImageView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    adaptivePhotoSelectImageView.autoresizingMask = 0;
    adaptivePhotoSelectImageView.frame = frame;

    // 有选择的图片时
    if (selectImage) {
        adaptivePhotoSelectImageView.imageView.image = selectImage;
        adaptivePhotoSelectImageView.selectImage = selectImage;
        adaptivePhotoSelectImageView.removeButton.hidden = NO;
    }else{
        adaptivePhotoSelectImageView.imageView.image = boothImage;
        adaptivePhotoSelectImageView.selectImage = nil;
        adaptivePhotoSelectImageView.removeButton.hidden = YES;
    }
    adaptivePhotoSelectImageView.addImageViewEndBlock = addImageViewEndBlock;
    adaptivePhotoSelectImageView.removeImageEndBlock = removeImageEndBlock;
    adaptivePhotoSelectImageView.tapImageBlock = tapImageBlock;
    // 有选择的图片
    if (selectImage) {
    }
    return adaptivePhotoSelectImageView;
}

- (IBAction)removeButtonClick {
    if (self.removeImageEndBlock) {
        self.removeImageEndBlock(self.selectImage);
    }
}

- (void)tapImageView {
    if (self.selectImage) {
        if (self.tapImageBlock) {
            self.tapImageBlock(self.selectImage);
        }
    }else {
        NSLog(@"打开相册 ADD IMAGE");
        if (self.addImageViewEndBlock) {
            self.addImageViewEndBlock([UIImage imageNamed:@"test"]);
        }
    }
}
@end

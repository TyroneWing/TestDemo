//
//  BMAdaptiveTopsPhotoSelectImageView.m
//  BMBlueMoonAngel
//
//  Created by ___liangdahong on 16/9/29.
//  Copyright © 2016年 elvin. All rights reserved.
//

#import "BMAdaptiveTopsPhotoSelectImageView.h"
#import <objc/runtime.h>

@interface BMAdaptiveTopsPhotoSelectImageView () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, copy) BMAdaptiveTopsPhotoSelectImageViewBlock block;
@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (nonatomic, strong) UIViewController *topVC;
@property (nonatomic, strong) NSMutableArray *assets;
@property (nonatomic, strong) NSArray<ZLPhotoAssets *> *status;

@end

@implementation BMAdaptiveTopsPhotoSelectImageView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundView.layer.borderWidth = 1;
    self.backgroundView.layer.cornerRadius = 4;
    self.backgroundView.clipsToBounds = YES;
}

+ (instancetype)adaptiveTopsPhotoSelectImageViewWithFrame:(CGRect)frame
                                              photoAssets:(NSArray <ZLPhotoAssets *> *)photoAssets
                                                    block:(BMAdaptiveTopsPhotoSelectImageViewBlock)block{
    BMAdaptiveTopsPhotoSelectImageView *adaptiveTopsPhotoSelectImageView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    adaptiveTopsPhotoSelectImageView.autoresizingMask = 0;
    adaptiveTopsPhotoSelectImageView.frame = frame;
    adaptiveTopsPhotoSelectImageView.block = block;
    adaptiveTopsPhotoSelectImageView.status = [photoAssets copy];
    return adaptiveTopsPhotoSelectImageView;
}

- (IBAction)photoSelectet {
    
    ZLPhotoPickerViewController *pickerVc = [[ZLPhotoPickerViewController alloc] init];
    // MaxCount, Default = 9
    pickerVc.maxCount = self.newMaxCount;
    // Jump AssetsVc
    pickerVc.status = PickerViewShowStatusCameraRoll;
    // Filter: PickerPhotoStatusAllVideoAndPhotos, PickerPhotoStatusVideos, PickerPhotoStatusPhotos.
    pickerVc.photoStatus = PickerPhotoStatusPhotos;
    // Recoder Select Assets
    pickerVc.selectPickers = self.status;
    // Desc Show Photos, And Suppor Camera
    pickerVc.topShowPhotoPicker = YES;
    pickerVc.isShowCamera = YES;
    // CallBack
    pickerVc.callBack = ^(NSArray<ZLPhotoAssets *> *status){
        self.assets = status.mutableCopy;
        NSMutableArray *muarray = [@[] mutableCopy];
        NSMutableArray *myphotoAssets = [@[] mutableCopy];
        NSMutableArray *zxjphotoAssets = [@[] mutableCopy];

        for (ZLPhotoAssets *photoAssets in status) {
            if ([photoAssets isKindOfClass:[ZLPhotoAssets class]]) {
                [muarray addObject:photoAssets.originImage];
                [myphotoAssets addObject:photoAssets];
            } else if ([photoAssets isKindOfClass:[UIImage class]]) {
                [muarray addObject:photoAssets];
                [zxjphotoAssets addObject:photoAssets];
            }
        }
        if (self.block) {
            self.block(muarray, myphotoAssets,zxjphotoAssets);
        }
    };
    [pickerVc showPickerVc:[self bm_topViewController]];
}

/**
 *  获取当前正显示的控制器
 */
- (UIViewController *)bm_topViewController {
    UIViewController *rootViewController = ((UIWindow *)[[[UIApplication sharedApplication] windows] objectAtIndex:0]).rootViewController;
    UIViewController *topViewController = rootViewController;
    while (topViewController.presentedViewController) {
        topViewController = rootViewController.presentedViewController;
    }
    return topViewController;
}
@end

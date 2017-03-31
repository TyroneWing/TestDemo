//
//  BMImageViewBrowseView.m
//  scroll
//
//  Created by __liangdahong on 16/9/29.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "BMImageViewBrowseView.h"
#define kBMImageViewBrowseViewWidth    [UIScreen mainScreen].bounds.size.width
#define kBMImageViewBrowseViewHeight     [UIScreen mainScreen].bounds.size.height

#if __has_include("UIImageView+WebCache.h")
#import "UIImageView+WebCache.h"
#else
#error - please import SDWebImage
#endif

@interface BMImageViewBrowseView () <UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIImageView *downloadImageView;
@property (nonatomic, assign) BOOL remove;

@end

@implementation BMImageViewBrowseView

#pragma mark -
#pragma mark - init
#pragma mark - getters setters
- (UIImageView *)downloadImageView {
    if (!_downloadImageView) {
        _downloadImageView = [UIImageView new];
    }
    return _downloadImageView;
}
#pragma mark - 系统delegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    CGSize imageViewSize = self.imageView.frame.size;
    CGSize scrollViewSize = scrollView.bounds.size;
    CGFloat verticalPadding = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2 : 0;
    CGFloat horizontalPadding = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2 : 0;
    scrollView.contentInset = UIEdgeInsetsMake(verticalPadding, horizontalPadding, verticalPadding, horizontalPadding);
}
#pragma mark - 自定义delegate
#pragma mark - 公有方法

+ (void)showImageViewBrowseViewWithImage:(UIImage *)image {
    for (UIView *subView in [[UIApplication sharedApplication] keyWindow].subviews) {
        if ([subView isKindOfClass:[self class]]) {
            return;
        }
    }
    BMImageViewBrowseView *imageViewBrowseView = [[BMImageViewBrowseView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [[[UIApplication sharedApplication] keyWindow] addSubview:imageViewBrowseView];
    [imageViewBrowseView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:imageViewBrowseView action:@selector(tapClick)]];
    imageViewBrowseView.imageView = [[UIImageView alloc] initWithImage:image];
    imageViewBrowseView.scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    imageViewBrowseView.scrollView.backgroundColor = [UIColor blackColor];
    imageViewBrowseView.scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [imageViewBrowseView.scrollView addSubview:imageViewBrowseView.imageView];
    [imageViewBrowseView addSubview:imageViewBrowseView.scrollView];
    imageViewBrowseView.scrollView.delegate = imageViewBrowseView;
    
    CGSize imageViewSize = imageViewBrowseView.imageView.bounds.size;
    CGSize scrollViewSize = imageViewBrowseView.scrollView.bounds.size;
    CGFloat widthScale = scrollViewSize.width / imageViewSize.width;
    CGFloat heightScale = scrollViewSize.height / imageViewSize.height;
    CGSize size = [self getBestSizeWithImage:imageViewBrowseView.imageView.image];
    imageViewBrowseView.imageView.frame = CGRectMake(0, 0, size.width, size.height);
    imageViewBrowseView.scrollView.contentSize = imageViewBrowseView.imageView.bounds.size;
    
    imageViewBrowseView.scrollView.zoomScale = 1.0;
    imageViewBrowseView.scrollView.maximumZoomScale = MAX(widthScale, heightScale) > 2.0 ? MAX(widthScale, heightScale): 2.0;
    imageViewBrowseView.scrollView.minimumZoomScale = 1.0;
    [imageViewBrowseView scrollViewDidZoom:imageViewBrowseView.scrollView];
}

+ (void)showImageViewBrowseViewWithImageUrlString:(NSString *)imageUrlString {
    
    BMImageViewBrowseView *imageViewBrowseView = [[BMImageViewBrowseView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [[[UIApplication sharedApplication] keyWindow] addSubview:imageViewBrowseView];
    imageViewBrowseView.backgroundColor = [UIColor blackColor];
    [imageViewBrowseView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:imageViewBrowseView action:@selector(tapClick)]];
    
#if __has_include("UIImageView+WebCache.h")
    UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    activityIndicatorView.center = imageViewBrowseView.center;
    [imageViewBrowseView addSubview:activityIndicatorView];
    [activityIndicatorView startAnimating];
    __weak typeof(imageViewBrowseView) wimageViewBrowseView = imageViewBrowseView;
    [imageViewBrowseView.downloadImageView sd_setImageWithURL:[NSURL URLWithString:imageUrlString] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image && !error) {
            __strong typeof(wimageViewBrowseView) imageViewBrowseView = wimageViewBrowseView;
            if (imageViewBrowseView ) {
                [imageViewBrowseView removeFromSuperview];
                if (!imageViewBrowseView.remove) {
                    [self showImageViewBrowseViewWithImage:image];
                }
            }
        }else{
            NSLog(@"error:%@", error);
        }
    }];
#endif
}
#pragma mark - 私有方法
+ (CGSize)getBestSizeWithImage:(UIImage *)image {
    CGSize size = CGSizeZero;
    if (image.size.width <= kBMImageViewBrowseViewWidth && image.size.height <= kBMImageViewBrowseViewHeight) {
        size = image.size;
    }
    else  if (image.size.width > kBMImageViewBrowseViewWidth && image.size.height > kBMImageViewBrowseViewHeight) {
        if (image.size.width/kBMImageViewBrowseViewWidth > image.size.height/kBMImageViewBrowseViewHeight) {
            size.width = kBMImageViewBrowseViewWidth;
            size.height = image.size.height*(kBMImageViewBrowseViewWidth/image.size.width);
        }else{
            size.height = kBMImageViewBrowseViewHeight;
            size.width = image.size.width*(kBMImageViewBrowseViewHeight/image.size.height);
        }
    }
    else if (image.size.width >= kBMImageViewBrowseViewWidth && image.size.height <= kBMImageViewBrowseViewHeight) {
        size.width = kBMImageViewBrowseViewWidth;
        size.height = image.size.height*(kBMImageViewBrowseViewWidth/image.size.width);
        
    }
    else if (image.size.width <= kBMImageViewBrowseViewWidth && image.size.height >= kBMImageViewBrowseViewHeight) {
        size.height = kBMImageViewBrowseViewHeight;
        size.width = image.size.width*(kBMImageViewBrowseViewHeight/image.size.height);
    }
    if (size.width == 0 && size.height == 0 ) {
        return CGSizeMake(1, 1);
    }
    return size;
}
#pragma mark - 事件响应
- (void)tapClick {
    self.remove = YES;
    [self removeFromSuperview];
}
@end

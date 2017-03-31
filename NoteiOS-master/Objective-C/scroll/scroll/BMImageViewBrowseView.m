//
//  BMImageViewBrowseView.m
//  scroll
//
//  Created by __liangdahong on 16/9/29.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "BMImageViewBrowseView.h"
#if __has_include("UIImageView+WebCache.h")
    #import "UIImageView+WebCache.h"
    #else
#endif

#define kw     [UIScreen mainScreen].bounds.size.width
#define kh     [UIScreen mainScreen].bounds.size.height

@interface BMImageViewBrowseView () <UIScrollViewDelegate>
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIImageView *downloadImageView;
@end

@implementation BMImageViewBrowseView

- (UIImageView *)downloadImageView {
    if (!_downloadImageView) {
        _downloadImageView = [UIImageView new];
    }
    return _downloadImageView;
}

+ (void)showImageViewBrowseViewWithImage:(UIImage *)image {

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
    
    CGSize size = CGSizeZero;
    if (imageViewBrowseView.imageView.image.size.width <= kw && imageViewBrowseView.imageView.image.size.height <= kh) {
        size = imageViewBrowseView.imageView.image.size;
    }
    else  if (imageViewBrowseView.imageView.image.size.width > kw && imageViewBrowseView.imageView.image.size.height > kh) {
        
        if (imageViewBrowseView.imageView.image.size.width/kw > imageViewBrowseView.imageView.image.size.height/kh) {
            size.width = kw;
            size.height = imageViewBrowseView.imageView.image.size.height*(kw/imageViewBrowseView.imageView.image.size.width);
        }else{
            size.height = kh;
            size.width = imageViewBrowseView.imageView.image.size.width*(kh/imageViewBrowseView.imageView.image.size.height);
        }
    }
    else if (imageViewBrowseView.imageView.image.size.width >= kw && imageViewBrowseView.imageView.image.size.height <= kh) {
        size.width = kw;
        size.height = imageViewBrowseView.imageView.image.size.height*(kw/imageViewBrowseView.imageView.image.size.width);
        
    }
    else if (imageViewBrowseView.imageView.image.size.width <= kw && imageViewBrowseView.imageView.image.size.height >= kh) {
        size.height = kh;
        size.width = imageViewBrowseView.imageView.image.size.width*(kh/imageViewBrowseView.imageView.image.size.height);
    }
    
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
    __weak typeof(imageViewBrowseView) wimageViewBrowseView = imageViewBrowseView;
#if __has_include("UIImageView+WebCache.h")
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSError *error = nil;
        NSData *imageDasta = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:imageUrlString] options:0 error:&error];
        if (error) {
            NSLog(@"%@", error);
            return;
        }
        NSLog(@"下载完成 sd");
        __strong typeof(wimageViewBrowseView) imageViewBrowseView = wimageViewBrowseView;
        if (imageViewBrowseView) {
            [self showImageViewBrowseViewWithImage:[[UIImage alloc] initWithData:imageDasta scale:1.0]];
        }
    });
#else
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSError *error = nil;
        NSData *imageDasta = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:imageUrlString] options:0 error:&error];
        if (error) {
            NSLog(@"%@", error);
            return;
        }
        NSLog(@"下载完成 gcd");
        __strong typeof(wimageViewBrowseView) imageViewBrowseView = wimageViewBrowseView;
        if (imageViewBrowseView) {
            dispatch_async(dispatch_get_main_queue(), ^{
                UIImage *imag =  [UIImage imageWithData:imageDasta];
                [imageViewBrowseView removeFromSuperview];
                [self showImageViewBrowseViewWithImage:imag];
            });
        }
    });
#endif
}

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

- (void)tapClick {
    [self removeFromSuperview];
}

@end

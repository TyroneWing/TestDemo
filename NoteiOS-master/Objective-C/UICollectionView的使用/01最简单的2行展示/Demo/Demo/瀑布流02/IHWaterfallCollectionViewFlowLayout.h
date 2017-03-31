//
//  IHWaterfallCollectionViewFlowLayout.h
//  Demo
//
//  Created by ___liangdahong on 16/10/14.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@class IHWaterfallCollectionViewFlowLayout;

@protocol WaterfallFlowLayoutDelegate <NSObject>

@required
- (CGSize)collectionView:(UICollectionView *)collectionView collectionViewLayout:(IHWaterfallCollectionViewFlowLayout *)collectionViewLayout sizeOfItemAtIndexPath:(NSIndexPath *)indexPath;
@end


@interface IHWaterfallCollectionViewFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, weak) id<WaterfallFlowLayoutDelegate> delegate;

@end

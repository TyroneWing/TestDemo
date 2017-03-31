//
//  ViewController.m
//  Demo
//
//  Created by ___liangdahong on 16/10/13.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

/*!
 
 1. 创建 UICollectionView （设置布局 UICollectionViewFlowLayout 对象 xib创建时会自动为其配置一个 UICollectionViewFlowLayout）
    如果用 代码创建时 必须用
 - (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout NS_DESIGNATED_INITIALIZER;
    创建，不然崩溃
  2. 实现 UICollectionViewDataSource 协议

 */
#import "ViewController.h"
#import "IHCollectionViewCell.h"
#import "IHCollectionReusableView.h"
#import "IHCollectionReusableViewFooter.h"
#import "MJRefresh.h"
#import "BMMJRefreshGifHeader.h"

#define kwidth  [UIScreen mainScreen].bounds.size.width
#define kheight [UIScreen mainScreen].bounds.size.height
@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;
@property (nonatomic, strong) NSMutableArray *dataSourceArray;

@end

@implementation ViewController

#pragma mark -

#pragma mark - 生命周期

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.collectionView.header beginRefreshing];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
    self.view.backgroundColor = kBit64Color(0xE5E5E5);

    self.collectionView.header = [BMMJRefreshGifHeader headerWithRefreshingBlock:^{
        [self.collectionView.header beginRefreshing];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.collectionView.header endRefreshing];
            [self reload];
        });
    }];
}

#pragma mark - getters setters

- (NSMutableArray *)dataSourceArray {
    if (!_dataSourceArray) {
        _dataSourceArray = [@[] mutableCopy];
    }
    return _dataSourceArray;
}

- (UICollectionViewFlowLayout *)layout {
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.minimumLineSpacing = 0.5;
        _layout.minimumInteritemSpacing = 0.5;
        _layout.itemSize = CGSizeMake((kwidth-1.5)/4.0, (kwidth-1.5)/4.0);
        _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _layout.headerReferenceSize = CGSizeMake(kwidth, 30);
        _layout.footerReferenceSize = CGSizeMake(kwidth, 30);
    }
    return _layout;
}

#pragma mark - 系统delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dataSourceArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSArray *array = self.dataSourceArray[section];
    return array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    IHCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"IHCollectionViewCell" forIndexPath:indexPath];
    NSArray *array  = self.dataSourceArray[indexPath.section];
    id obj = array[indexPath.row];
    cell.topImage.hidden = [obj isKindOfClass:[@YES class]];
    cell.titleLabel.hidden = [obj isKindOfClass:[@YES class]];
    if ([obj isKindOfClass:[NSString class]]) {
        cell.titleLabel.text = obj;
    }
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        IHCollectionReusableView *collectionReusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"IHCollectionReusableView__Identifier" forIndexPath:indexPath];
        return collectionReusableView;
    }else {
        IHCollectionReusableViewFooter *collectionReusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"IHCollectionReusableViewFooter__Identifier" forIndexPath:indexPath];
        return collectionReusableView;
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    if (section+1 == self.dataSourceArray.count) {
        return CGSizeMake(kwidth, 30);
    }
    return CGSizeZero;
}

#pragma mark - 自定义delegate
#pragma mark - 公有方法
#pragma mark - 私有方法
- (void)setUI {
    
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.collectionViewLayout = self.layout;
    [self.collectionView registerNib:[UINib nibWithNibName:@"IHCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"IHCollectionViewCell"];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"IHCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"IHCollectionReusableView__Identifier"];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"IHCollectionReusableViewFooter" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"IHCollectionReusableViewFooter__Identifier"];
}

#pragma mark - 事件响应

- (IBAction)reload:(id)sender {
    [self.collectionView.header beginRefreshing];
}

- (void)reload {
    [self.dataSourceArray removeAllObjects];
    int arc = arc4random_uniform(5)+2;
    int temp = 0;
    while (temp < arc) {
        int arcj = arc4random_uniform(14)+1;
        int tempj = 0;
        NSMutableArray *muarray = [@[] mutableCopy];
        while (tempj < arcj) {
            [muarray addObject:[NSString stringWithFormat:@"第%d组 功能 %d",temp,tempj++]];
        }
        temp++;
        [self.dataSourceArray addObject:muarray];
    }
    
    [self.dataSourceArray enumerateObjectsUsingBlock:^(NSArray * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.count % 4 != 0) {
            int temp = 4-obj.count%4;
            NSMutableArray *muarray = [obj mutableCopy];
            while (temp--) {
                [muarray addObject:@YES];
            }
            [self.dataSourceArray replaceObjectAtIndex:idx withObject:muarray];
        }
    }];
    [self.collectionView reloadData];
}


@end

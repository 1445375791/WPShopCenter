//
//  GoodsTopView.m
//  WPShopCenter
//
//  Created by 吴朋 on 2017/12/25.
//  Copyright © 2017年 吴朋. All rights reserved.
//

#import "GoodsTopView.h"
#import "GoodsMenusCell.h"

@interface GoodsTopView()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

/**
 展示类别的视图
 */
@property (nonatomic, strong) UICollectionView *menuCollectionView;

/**
 视图的frame
 */
@property (nonatomic, assign) CGRect viewFrame;

@end

@implementation GoodsTopView

- (instancetype)initTheTopGoodsViewWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _viewFrame = frame;
        _goodsMenus = @[].mutableCopy;
        [self creatMenusCollectionView];
    }
    return self;
}

/**
 创建CollectionView
 */
- (void)creatMenusCollectionView {
    UICollectionViewFlowLayout *viewLayOut = [[UICollectionViewFlowLayout alloc] init];
    viewLayOut.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    viewLayOut.itemSize = CGSizeMake(40, 20);
    _menuCollectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:viewLayOut];
    _menuCollectionView.backgroundColor = [UIColor cyanColor];
    _menuCollectionView.dataSource = self;
    _menuCollectionView.delegate = self;
    [_menuCollectionView registerClass:[GoodsMenusCell class] forCellWithReuseIdentifier:NSStringFromClass([GoodsMenusCell class])];
    [self addSubview:_menuCollectionView];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _goodsMenus.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GoodsMenusCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([GoodsMenusCell class]) forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    cell.title = _goodsMenus[indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(40, 20);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}


#pragma mark - Setter 

- (void)setGoodsMenus:(NSMutableArray<NSString *> *)goodsMenus {
    _goodsMenus = goodsMenus;
    [_menuCollectionView reloadData];
}

@end

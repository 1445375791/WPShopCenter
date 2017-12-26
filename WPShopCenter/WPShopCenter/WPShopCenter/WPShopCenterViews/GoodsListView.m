//
//  GoodsListView.m
//  WPShopCenter
//
//  Created by 吴朋 on 2017/12/25.
//  Copyright © 2017年 吴朋. All rights reserved.
//

#import "GoodsListView.h"
#import "WPGoodsModel.h"

@interface GoodsListView () <UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

/**
 tableView展示
 */
@property (nonatomic, strong) UITableView *goodsTableView;

/**
 collectionView展示
 */
@property (nonatomic, strong) UICollectionView *goodsCollectionView;

/**
 视图的frame
 */
@property (nonatomic, assign) CGRect viewFrame;

@end

@implementation GoodsListView

/**
 初始化数据
 
 @param frame frame
 @return 对象
 */
- (instancetype)initListViewWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _viewFrame = frame;
        _goodsShowType = WPGoodsShowTypeCollectionView;
        [self createShowGoodsView];
    }
    return self;
}

/**
 创建展示视图
 */
- (void)createShowGoodsView {
    if (_goodsShowType == WPGoodsShowTypeTableView) {
        [self addSubview:self.goodsTableView];
    } else {
        [self addSubview:self.goodsCollectionView];
    }
}

#pragma mark - Getter 
- (UITableView *)goodsTableView {
    if (!_goodsTableView) {
        _goodsTableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _goodsTableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _goodsTableView.dataSource = self;
        _goodsTableView.delegate = self;
        _goodsTableView.tableFooterView = [[UIView alloc] init];
        _goodsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _goodsTableView;
}

- (UICollectionView *)goodsCollectionView {
    if (!_goodsCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _goodsCollectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
        _goodsCollectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _goodsCollectionView.dataSource = self;
        _goodsCollectionView.delegate = self;
    }
    return _goodsCollectionView;
}

#pragma mark - Setter
- (void)setGoods:(NSMutableArray<WPGoodsModel *> *)goods {
    _goods = goods;
    if (self.goodsShowType == WPGoodsShowTypeTableView) {
        [_goodsTableView reloadData];
    } else {
        [_goodsCollectionView reloadData];
    }
}

- (void)setGoodsShowType:(WPGoodsShowType)goodsShowType {
    if (_goodsShowType != goodsShowType) {
        _goodsShowType = goodsShowType;
        if (goodsShowType == WPGoodsShowTypeTableView) {
            [_goodsCollectionView removeFromSuperview];
            _goodsCollectionView.dataSource = nil;
            _goodsCollectionView.delegate = nil;
            _goodsCollectionView = nil;
            [self addSubview:self.goodsTableView];
        } else {
            [_goodsTableView removeFromSuperview];
            _goodsTableView.delegate = nil;
            _goodsTableView.dataSource = nil;
            _goodsTableView = nil;
            [self addSubview:self.goodsCollectionView];
        }
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _goods.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"CELL";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _goods.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"COCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(100, 100);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}



@end

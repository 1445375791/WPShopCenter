//
//  GoodsCollectionCell.m
//  WPShopCenter
//
//  Created by 吴朋 on 2017/12/26.
//  Copyright © 2017年 吴朋. All rights reserved.
//

#import "GoodsCollectionCell.h"
#import "WPGoodsModel.h"

@interface GoodsCollectionCell ()

/**
 商品标题
 */
@property (nonatomic, strong) UILabel *titleLabel;

/**
 商品图片
 */
@property (nonatomic, strong) UIImageView *goodsImageView;

/**
 价格
 */
@property (nonatomic, strong) UILabel *priceLabel;

/**
 库存
 */
@property (nonatomic, strong) UILabel *invenLabel;

/**
 视图的Frame
 */
@property (nonatomic, assign) CGRect viewFrame;

@end

@implementation GoodsCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _viewFrame = frame;
        // 图片
        _goodsImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _goodsImageView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:_goodsImageView];
        // 标题
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 2;
        _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [self addSubview:_titleLabel];
        // 价格
        _priceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _priceLabel.font = [UIFont systemFontOfSize:10];
        _priceLabel.textColor = [UIColor redColor];
        [self addSubview:_priceLabel];
        // 库存
        _invenLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _invenLabel.font = [UIFont systemFontOfSize:10];
        _invenLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:_invenLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _goodsImageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetWidth(self.bounds));
    _titleLabel.frame = CGRectMake(0, CGRectGetMaxY(_goodsImageView.frame), CGRectGetWidth(_goodsImageView.frame), 30);
    _priceLabel.frame = CGRectMake(0, CGRectGetMaxY(_titleLabel.frame), CGRectGetWidth(_titleLabel.frame) / 2.0, 20);
    _invenLabel.frame = CGRectMake(CGRectGetMaxX(_priceLabel.frame), CGRectGetMinY(_priceLabel.frame), CGRectGetWidth(_priceLabel.frame), CGRectGetHeight(_priceLabel.frame));
}

/**
 给视图赋值
 
 @param model 对象
 */
- (void)buildTheViewCellWithModel:(WPGoodsModel *)model {
//    _goodsImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:model.goodPic]]];
     _goodsImageView.image = [UIImage imageNamed:model.goodPic];
    _titleLabel.text = model.title;
    _priceLabel.text = [NSString stringWithFormat:@"￥%@/件", model.price];
    _invenLabel.text = [NSString stringWithFormat:@"%@件", model.inventory];
}

@end

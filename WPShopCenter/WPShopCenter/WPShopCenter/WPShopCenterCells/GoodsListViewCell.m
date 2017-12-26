//
//  GoodsListViewCell.m
//  WPShopCenter
//
//  Created by 吴朋 on 2017/12/26.
//  Copyright © 2017年 吴朋. All rights reserved.
//

#import "GoodsListViewCell.h"

@interface GoodsListViewCell () 

/**
 视图的bounds
 */
@property (nonatomic, assign) CGRect viewBounds;

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

@end

@implementation GoodsListViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 图片
        _goodsImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _goodsImageView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_goodsImageView];
        // 标题
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 2;
        _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [self.contentView addSubview:_titleLabel];
        // 价格
        _priceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _priceLabel.font = [UIFont systemFontOfSize:10];
        _priceLabel.textColor = [UIColor redColor];
        [self.contentView addSubview:_priceLabel];
        // 库存
        _invenLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _invenLabel.font = [UIFont systemFontOfSize:10];
        _invenLabel.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_invenLabel];
    }
    return self;
}

/**
 创建cell
 
 @param tableView 所属的tableView
 @return cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"GoodsListViewCell";
    GoodsListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[GoodsListViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.viewBounds = tableView.bounds;
    }
    return cell;
}

/**
 给视图赋值
 
 @param model 对象
 */
- (void)buildTheViewCellWithModel:(WPGoodsModel *)model {
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end


    //
//  SecondMenusCell.m
//  WPShopCenter
//
//  Created by 吴朋 on 2017/12/26.
//  Copyright © 2017年 吴朋. All rights reserved.
//

#import "SecondMenusCell.h"

@interface SecondMenusCell () 

/**
 显示信息的label
 */
@property (nonatomic, strong) UILabel *menuLabel;

/**
 选中cell的颜色
 */
@property (nonatomic, strong, readonly) UIColor *selectItemTempColor;

/**
 未选中时的颜色
 */
@property (nonatomic, strong, readonly) UIColor *normalItemTempColor;

/**
 未选中时的背景色
 */
@property (nonatomic, strong) UIColor *normalItemBackColor;

/**
 选中时的背景色
 */
@property (nonatomic, strong) UIColor *selectItemBackColor;

/**
 视图的宽度
 */
@property (nonatomic, assign) CGFloat viewWidth;

/**
 分割线
 */
@property (nonatomic, strong) UIView *splitView;

@end

@implementation SecondMenusCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _cellSelected = NO;
        _menuLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _menuLabel.font = [UIFont systemFontOfSize:13];
        _menuLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_menuLabel];
        
        _splitView = [[UIView alloc] initWithFrame:CGRectZero];
        _splitView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_splitView];
        [self setViewStyleFromCellStatus];
    }
    return self;
}


/**
 创建cell
 
 @param tableView 所属的tableView
 @return cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"SecondMenusCell";
    SecondMenusCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[SecondMenusCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.viewWidth = tableView.bounds.size.width;
    }
    return cell;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect viewFrame = self.contentView.bounds;
    viewFrame.size.width = _viewWidth;
    self.contentView.bounds = viewFrame;
    _menuLabel.frame = CGRectMake(5, 10, _viewWidth - 10, CGRectGetHeight(self.bounds) - 20);
    _splitView.frame = CGRectMake(0, CGRectGetHeight(self.contentView.bounds) - 1, _viewWidth, 1);
}


#pragma mark - Setter and Getter

- (void)setMenusTitle:(NSString *)menusTitle {
    _menusTitle = menusTitle;
    _menuLabel.text = menusTitle;
}

- (void)setNormalItemColor:(UIColor *)normalItemColor {
    _normalItemColor = normalItemColor;
}

- (void)setSelectItemColor:(UIColor *)selectItemColor {
    _selectItemColor = selectItemColor;
}

- (UIColor *)normalItemTempColor {
    if (!_normalItemColor) {
        _normalItemColor = [UIColor lightGrayColor];
    }
    return _normalItemColor;
}

- (UIColor *)selectItemTempColor {
    if (!_selectItemColor) {
        _selectItemColor = [UIColor redColor];
    }
    return _selectItemColor;
}

- (UIColor *)normalItemBackColor {
    if (!_normalItemBackColor) {
        _normalItemBackColor = [UIColor groupTableViewBackgroundColor];
    }
    return _normalItemBackColor;
}

- (UIColor *)selectItemBackColor {
    if (!_selectItemBackColor) {
        _selectItemBackColor = [UIColor whiteColor];
    }
    return _selectItemBackColor;
}

- (void)setCellSelected:(BOOL)cellSelected {
    _cellSelected = cellSelected;
    [self setViewStyleFromCellStatus];
}

/**
 根据cell的选中状态改变样式
 */
- (void)setViewStyleFromCellStatus {
    _menuLabel.textColor = _cellSelected ? self.selectItemTempColor : self.normalItemTempColor;
    self.contentView.backgroundColor = _cellSelected ? self.selectItemBackColor : self.normalItemBackColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end

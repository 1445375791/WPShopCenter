//
//  GoodsMenusCell.m
//  WPShopCenter
//
//  Created by 吴朋 on 2017/12/25.
//  Copyright © 2017年 吴朋. All rights reserved.
//

#import "GoodsMenusCell.h"

@interface GoodsMenusCell ()

/**
 显示信息的label
 */
@property (nonatomic, strong) UILabel *infoLabel;

/**
 未选中颜色
 */
@property (nonatomic, strong, readonly) UIColor *normalTempColor;

/**
 选中颜色
 */
@property (nonatomic, strong, readonly) UIColor *selectTempColor;
@end

@implementation GoodsMenusCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _cellSelected = NO;
        _infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(frame) / 2.0 - 10, frame.size.width, 20)];
        _infoLabel.font = [UIFont systemFontOfSize:14];
        _infoLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_infoLabel];
        self.layer.borderWidth = 1;
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 10;
        [self setViewBorderInfoColor];
        
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    _infoLabel.text = title;
}

- (void)setCellSelected:(BOOL)cellSelected {
    _cellSelected = cellSelected;
    [self setViewBorderInfoColor];
}

- (UIColor *)normalTempColor {
    if (!_normalColor) {
        _normalColor = [UIColor grayColor];
    }
    return _normalColor;
}

- (UIColor *)selectTempColor {
    if (!_selectedColor) {
        _selectedColor = [UIColor redColor];
    }
    return _selectedColor;
}

- (void)setNormalColor:(UIColor *)normalColor {
    _normalColor = normalColor;
    [self setViewBorderInfoColor];
}

- (void)setSelectedColor:(UIColor *)selectedColor {
    _selectedColor = selectedColor;
    [self setViewBorderInfoColor];
}

/**
 设置边框和字体颜色
 */
- (void)setViewBorderInfoColor {
    UIColor *showColor = _cellSelected ? self.selectTempColor : self.normalTempColor;
    self.layer.borderColor = showColor.CGColor;
    _infoLabel.textColor = showColor;
}


@end

//
//  GoodsMenusCell.m
//  WPShopCenter
//
//  Created by 吴朋 on 2017/12/25.
//  Copyright © 2017年 吴朋. All rights reserved.
//

#import "GoodsMenusCell.h"

@interface GoodsMenusCell ()

@property (nonatomic, strong) UILabel *infoLabel;

@end

@implementation GoodsMenusCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(frame) / 2.0 - 10, frame.size.width, 20)];
        _infoLabel.font = [UIFont systemFontOfSize:14];
        _infoLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_infoLabel];
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    _infoLabel.text = title;
}

@end

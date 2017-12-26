//
//  WPGoodsModel.h
//  WPShopCenter
//
//  Created by 吴朋 on 2017/12/26.
//  Copyright © 2017年 吴朋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WPGoodsModel : NSObject

/**
 商品ID
 */
@property (nonatomic, copy) NSString *goodId;

/**
 商品图片地址
 */
@property (nonatomic, copy) NSString *goodPic;

/**
 商品标题
 */
@property (nonatomic, copy) NSString *title;

/**
 商品价格
 */
@property (nonatomic, copy) NSString *price;

/**
 商品库存
 */
@property (nonatomic, copy) NSString *inventory;



@end

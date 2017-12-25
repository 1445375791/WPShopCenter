//
//  ViewController.m
//  WPShopCenter
//
//  Created by 吴朋 on 2017/12/25.
//  Copyright © 2017年 吴朋. All rights reserved.
//

#import "ViewController.h"
#import "GoodsTopView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableArray<NSString *> *menus = @[@"类目一", @"类目二", @"类目三", @"类目四", @"类目五", @"类目六"].mutableCopy;
    GoodsTopView *topView = [[GoodsTopView alloc] initTheTopGoodsViewWithFrame:CGRectMake(0, 64, 375, 44)];
    topView.goodsMenus = menus;
    [self.view addSubview:topView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

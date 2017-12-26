//
//  ViewController.m
//  WPShopCenter
//
//  Created by 吴朋 on 2017/12/25.
//  Copyright © 2017年 吴朋. All rights reserved.
//

#import "ViewController.h"
#import "GoodsTopView.h"
#import "GoodsLeftView.h"

@interface ViewController ()

@property (nonatomic, strong) GoodsTopView *topView;

@property (nonatomic, strong) GoodsLeftView *leftView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    NSMutableArray<NSString *> *menus = @[@"类目一", @"类目二", @"类目三", @"类目四", @"类目五", @"类目六", @"类目七", @"类目八", @"类目九"].mutableCopy;
    _topView = [[GoodsTopView alloc] initTheTopGoodsViewWithFrame:CGRectMake(0, 64, 375, 44)];
    _topView.goodsMenus = menus;
    __weak typeof(self) weakSelf = self;
    [_topView didSelectGoodsMenusWithBlock:^(NSString *menuTitle) {
        NSLog(@"%@", menuTitle);
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf changeTheFirstMenu:menuTitle];
        
    }];
    [self.view addSubview:_topView];
    
    _leftView = [[GoodsLeftView alloc] initTheLeftSecondDirectoryViewWithFrame:CGRectMake(0, CGRectGetMaxY(_topView.frame), 100, CGRectGetHeight(self.view.bounds) - CGRectGetMaxY(_topView.frame))];
    _leftView.secondDirectoryMenus = menus;
    [_leftView didSelectedTheItemWithBlock:^(NSString *menuTitle) {
        NSLog(@"二级目录 %@", menuTitle);
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf selectSecondMenu:menuTitle];
    }];
    [self.view addSubview:_leftView];
}

/**
 改变一级目录之后

 @param firstMenu 选中的一级类目
 */
- (void)changeTheFirstMenu:(NSString *)firstMenu {
    [_leftView resetSelectedMenus];
}

/**
 选中二级目录

 @param secondMenu 二级目录
 */
- (void)selectSecondMenu:(NSString *)secondMenu {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

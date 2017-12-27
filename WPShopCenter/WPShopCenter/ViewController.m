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
#import "GoodsListView.h"
#import "WPGoodsModel.h"

@interface ViewController ()

@property (nonatomic, strong) GoodsTopView *topView;

@property (nonatomic, strong) GoodsLeftView *leftView;

@property (nonatomic, strong) GoodsListView *listView;

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
    
    _listView = [[GoodsListView alloc] initListViewWithFrame:CGRectMake(CGRectGetMaxX(_leftView.frame), CGRectGetMinY(_leftView.frame), CGRectGetWidth(self.view.frame) - CGRectGetMaxX(_leftView.frame), CGRectGetHeight(_leftView.frame))];
    
    _listView.goods = [self loadTestData];
    [_listView didSelectModelItemWithBlock:^(WPGoodsModel *selectedModel) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf showPormptViewWithModel:selectedModel];
    }];
    [self.view addSubview:_listView];
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

- (IBAction)changShowType:(id)sender {
    WPGoodsShowType currentType = _listView.goodsShowType;
    _listView.goodsShowType = currentType == WPGoodsShowTypeTableView ? WPGoodsShowTypeCollectionView : WPGoodsShowTypeTableView;
}

/**
 测试数据
 */
- (NSMutableArray<WPGoodsModel *> *)loadTestData {
    NSMutableArray<WPGoodsModel *> *models = @[].mutableCopy;
    for (int i = 0; i < 10; i++) {
        WPGoodsModel *model = [[WPGoodsModel alloc] init];
        model.goodId = [NSString stringWithFormat:@"%d", i];
        model.goodPic = @"pic1";
        model.title = [NSString stringWithFormat:@"%@ %d", @"美丽风景画限时出售", i];
        model.price = [NSString stringWithFormat:@"%@", [NSNumber numberWithInt:(100 + i)]];
        model.inventory = [NSString stringWithFormat:@"%@", [NSNumber numberWithInt:(20 + 10 * i)]];
        [models addObject:model];
    }
    return models;
}

/**
 测试时 提示信息

 @param model 对象
 */
- (void)showPormptViewWithModel:(WPGoodsModel *)model {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"" message:[NSString stringWithFormat:@"商品ID:%@  商品标题:%@  商品价格:￥%@  商品库存:%@件", model.goodId, model.title, model.price, model.inventory] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
    [alertVC addAction:cancel];
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

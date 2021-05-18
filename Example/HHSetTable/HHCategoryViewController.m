//
//  HHCategoryViewController.m
//  HHSetTable_Example
//
//  Created by Henry on 2021/5/18.
//  Copyright © 2021 1325049637@qq.com. All rights reserved.
//

#import "HHCategoryViewController.h"
#import <HHSetTable/HHSetTable.h>

@interface HHCategoryViewController ()

@property (nonatomic, assign) BOOL mode;

@end

@implementation HHCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];

    [self initSetTableViewConfigureStyle:UITableViewStyleGrouped];
    
    HHTitleCellModel *cell1 = [[HHTitleCellModel alloc] initWithTitle:@"我的" actionBlock:^(HHBaseCellModel * _Nonnull model) {
        HHTextCellModel *textModel = (HHTextCellModel *)model;
        textModel.title = @"奔跑吧,兄弟";
        [self updateCellModel:textModel];
    }];
    HHTitleCellModel *cell2 = [[HHTitleCellModel alloc] initWithTitle:@"相册" actionBlock:nil];
    cell2.icon = [UIImage imageNamed:@"nav_setup"];
    cell2.cellHeight = 60;

    HHTitleCellModel *cell3 = [[HHTitleCellModel alloc] initWithTitle:@"收藏" actionBlock:nil];
    cell3.cellHeight = 60;
    cell3.titleColor = [UIColor redColor];
    cell3.titleFont = [UIFont systemFontOfSize:12];

    HHTextCellModel *cell4 = [[HHTextCellModel alloc] initWithTitle:@"钱包" detailText:@"100000" actionBlock:nil];
    cell4.showArrow = NO;
    cell4.selectionStyle = UITableViewCellSelectionStyleNone;
    cell4.cellHeight = 60;

    HHTextCellModel *cell5 = [[HHTextCellModel alloc] initWithTitle:@"介绍" detailText:@"气质如虹气质如虹气质如虹气质如虹" actionBlock:nil];
    cell5.titleColor = [UIColor redColor];
    cell5.detailColor = [UIColor blueColor];
    cell5.cellHeight = 60;
    cell5.detailFont = [UIFont systemFontOfSize:17];

    HHSwitchCellModel *cell6 = [[HHSwitchCellModel alloc] initWithTitle:@"选择" switchType:YES switchBlock:^(HHBaseCellModel * _Nonnull model, BOOL on) {
        
    }];
    
    NSMutableArray *section = @[cell1, cell2].mutableCopy;
    NSMutableArray *section1 = @[cell3].mutableCopy;
    NSMutableArray *section2 = @[cell4, cell5].mutableCopy;
    NSMutableArray *section3 = @[cell6].mutableCopy;

    [self.dataArray addObject:section];
    [self.dataArray addObject:section1];
    [self.dataArray addObject:section2];
    [self.dataArray addObject:section3];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"暗黑模式" style:UIBarButtonItemStylePlain target:self action:@selector(onClickMode)];

}

- (void)onClickMode {
    _mode = !_mode;
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;

    if (@available(iOS 13.0, *)) {
        if (_mode) {
            keyWindow.overrideUserInterfaceStyle = UIUserInterfaceStyleDark;
        } else {
            keyWindow.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
        }
    } else {
        // Fallback on earlier versions
    }
}

@end

//
//  HHCategoryViewController.m
//  HHSetTable_Example
//
//  Created by Henry on 2021/5/18.
//  Copyright © 2021 1325049637@qq.com. All rights reserved.
//

#import "HHCategoryViewController.h"
#import <HHSetTable/HHSetTable.h>
#import "HHMyCustomCellModel.h"
#import "HHUtils.h"
#import <HHTool/UIFont+HHSize.h>

@interface HHCategoryViewController ()

@property (nonatomic, assign) BOOL mode;

@property (nonatomic, assign) NSInteger coefficient;

@end

@implementation HHCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];

    [self initSetTableViewConfigureStyle:UITableViewStyleGrouped];
    
    UIBarButtonItem *mode = [[UIBarButtonItem alloc] initWithTitle:@"暗黑模式" style:UIBarButtonItemStylePlain target:self action:@selector(onClickMode)];
    UIBarButtonItem *fontSize = [[UIBarButtonItem alloc] initWithTitle:@"字体大小" style:UIBarButtonItemStylePlain target:self action:@selector(onClicksize)];
    self.navigationItem.rightBarButtonItems = @[mode, fontSize];
    
    [self setupData];

}

- (void)setupData {
    HHMyCustomCellModel *header = [[HHMyCustomCellModel alloc] initWithCellIdentifier:@"HHMyCustomTableViewCell" actionBlock:nil];
    header.didSelectIconBlock = ^(UIImageView * _Nonnull imageView) {
        imageView.backgroundColor = [HHUtils randomColor];
    };
    header.name = @"姓名";
    header.detail = @"简介";
    header.cellHeight = 80;
    
    HHTitleCellModel *section1Cell1 = [[HHTitleCellModel alloc] initWithTitle:@"相册" actionBlock:nil];
    section1Cell1.icon = [UIImage imageNamed:@"nav_setup"];
    section1Cell1.cellHeight = 50;
    section1Cell1.titleFont = [UIFont fontOfSize:17];
    
    HHTitleCellModel *section1Cell2 = [[HHTitleCellModel alloc] initWithTitle:@"收藏" actionBlock:nil];
    section1Cell2.cellHeight = 50;
    section1Cell2.titleFont = [UIFont fontOfSize:17];
    
    HHTitleCellModel *section1Cell3 = [[HHTitleCellModel alloc] initWithTitle:@"我的" actionBlock:^(HHBaseCellModel * _Nonnull model) {
        HHTitleCellModel *titleModel = (HHTitleCellModel *)model;
        titleModel.title = @"奔跑吧,兄弟";
        [self updateCellModel:titleModel];
    }];
    section1Cell3.cellHeight = 50;
    section1Cell3.titleFont = [UIFont fontOfSize:17];

    HHTextCellModel *section2Cell1 = [[HHTextCellModel alloc] initWithTitle:@"相册" detailText:@"开始表演" actionBlock:nil];
    section2Cell1.icon = [UIImage imageNamed:@"nav_setup"];
    section2Cell1.cellHeight = 60;
    section2Cell1.titleFont = [UIFont fontOfSize:17];
    section2Cell1.detailFont = [UIFont fontOfSize:17];

    HHTextCellModel *section2Cell2 = [[HHTextCellModel alloc] initWithTitle:@"相册" detailText:@"开始表演" actionBlock:nil];
    section2Cell2.cellHeight = 60;
    section2Cell2.titleFont = [UIFont fontOfSize:17];
    section2Cell2.detailFont = [UIFont fontOfSize:17];

    HHTextCellModel *section2Cell3 = [[HHTextCellModel alloc] initWithTitle:@"相册" detailText:@"" actionBlock:nil];
    section2Cell3.cellHeight = 60;
    section2Cell3.titleFont = [UIFont fontOfSize:17];
    section2Cell3.detailFont = [UIFont fontOfSize:17];
    
    HHTextCellModel *section2Cell4 = [[HHTextCellModel alloc] initWithTitle:@"钱包" detailText:@"100000" actionBlock:nil];
    section2Cell4.cellHeight = 60;
    section2Cell4.showArrow = NO;
    section2Cell4.selectionStyle = UITableViewCellSelectionStyleNone;
    section2Cell4.titleFont = [UIFont fontOfSize:17];
    section2Cell4.detailFont = [UIFont fontOfSize:17];

    HHTextCellModel *section2Cell5 = [[HHTextCellModel alloc] initWithTitle:@"介绍" detailText:@"气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹" actionBlock:nil];
    section2Cell5.titleFont = [UIFont fontOfSize:17];
    section2Cell5.detailFont = [UIFont fontOfSize:17];
    
    HHSwitchCellModel *section3Cell1 = [[HHSwitchCellModel alloc] initWithTitle:@"选择" switchType:YES switchBlock:^(HHBaseCellModel * _Nonnull model, BOOL on) {
        
    }];
    section3Cell1.titleFont = [UIFont fontOfSize:17];

    
    NSMutableArray *section = @[header].mutableCopy;

    NSMutableArray *section1 = @[section1Cell1, section1Cell2, section1Cell3].mutableCopy;
    NSMutableArray *section2 = @[section2Cell1, section2Cell2, section2Cell3, section2Cell4, section2Cell5].mutableCopy;
    NSMutableArray *section3 = @[section3Cell1].mutableCopy;

    [self.dataArray addObject:section];
    [self.dataArray addObject:section1];
    [self.dataArray addObject:section2];
    [self.dataArray addObject:section3];
}

- (void)onClicksize {
    
    if (self.coefficient == 6) {
        self.coefficient = 2;
    } else {
        self.coefficient = 6;
    }
    
    [UIFont setFontSizeCoefficient:self.coefficient];
    
    [self.dataArray removeAllObjects];
    [self setupData];
    [self.tableView reloadData];
        
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

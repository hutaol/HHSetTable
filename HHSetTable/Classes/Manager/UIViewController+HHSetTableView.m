//
//  UIViewController+HHSetTableView.m
//  Pods
//
//  Created by Henry on 2021/5/18.
//

#import "UIViewController+HHSetTableView.h"
#import <objc/runtime.h>
#import "HHSetTableViewManager.h"
#import "HHSectionModel.h"
#import "HHBaseCellModel.h"
#import "NSArray+HHSafeAccess.h"

@interface UIViewController ()

@property (nonatomic, strong) HHSetTableViewManager *manager;  /// 表视图代理类

@end

@implementation UIViewController (HHSetTableView)

- (void)initSetTableViewConfigureStyle:(UITableViewStyle)style {
    if (self.dataArray == nil) {
        self.dataArray = [NSMutableArray array];
    }
    if (self.manager == nil) {
        self.manager = [[HHSetTableViewManager alloc] initSetTableViewManager:self.dataArray];
    }
    if (self.tableView == nil) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:style];
        self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
        self.tableView.backgroundColor = [UIColor clearColor];
        self.tableView.delegate = self.manager;
        self.tableView.dataSource = self.manager;
        self.tableView.showsVerticalScrollIndicator = NO;
        
        if(floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_8_x_Max){
            self.tableView.cellLayoutMarginsFollowReadableWidth = NO;
        }
        [self.view addSubview:self.tableView];
        
        // 设置tableView约束
        [self setupTableViewConstrint];

    }
}

// 设置tableView约束
- (void)setupTableViewConstrint {
    if (@available(iOS 11.0, *)) {
        NSLayoutConstraint *tableViewTopConstraint = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide  attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
        [self.view addConstraint:tableViewTopConstraint];
        
        NSLayoutConstraint *tableViewLeftConstraint = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
        [self.view addConstraint:tableViewLeftConstraint];
        
        NSLayoutConstraint *tableViewRightConstraint = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
        [self.view addConstraint:tableViewRightConstraint];
        
        NSLayoutConstraint *tableViewBottomConstraint = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
        [self.view addConstraint:tableViewBottomConstraint];
        
        
    } else {
        NSLayoutConstraint *tableViewTopConstraint = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view  attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
        [self.view addConstraint:tableViewTopConstraint];
        
        NSLayoutConstraint *tableViewLeftConstraint = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
        [self.view addConstraint:tableViewLeftConstraint];
        
        NSLayoutConstraint *tableViewRightConstraint = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
        [self.view addConstraint:tableViewRightConstraint];
        
        NSLayoutConstraint *tableViewBottomConstraint = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
        [self.view addConstraint:tableViewBottomConstraint];
    }
}

- (void)setupTableViewConstrint:(CGFloat)top left:(CGFloat)left right:(CGFloat)right bottom:(CGFloat)bottom {
    NSAssert(self.manager != nil, @"此对象方法请在initSetTableViewConfigure后设置");
    for (NSLayoutConstraint *layout in self.view.constraints) {
        if ([layout.firstItem isEqual:self.tableView]) {
            if (layout.firstAttribute == NSLayoutAttributeLeft) {
                //这是遍历到tableView的高度约束
                layout.constant = left;
            } else if (layout.firstAttribute == NSLayoutAttributeTop) {
                layout.constant = top;
                
            } else if (layout.firstAttribute == NSLayoutAttributeRight) {
                layout.constant = right;
            } else {
                layout.constant = bottom;
            }
        }
       [self.view needsUpdateConstraints];
       [self.view updateConstraints];
    }
}

- (void)setupTableViewHeaderArray:(NSMutableArray <HHSectionModel *> *)headerArray {
    NSAssert(self.manager != nil, @"请确保方法先调用初始化initSetTableViewConfigureStyle");
    if (self.manager) {
        self.manager.headerArray = headerArray;
        [self.tableView reloadData];
    }
}

- (void)setupTableViewFooterArray:(NSMutableArray<HHSectionModel *> *)footerArray {
    NSAssert(self.manager != nil, @"请确保方法先调用初始化initSetTableViewConfigureStyle");
    if (self.manager) {
        self.manager.footerArray = footerArray;
        [self.tableView reloadData];
    }
}

- (void)updateCellModel:(HHBaseCellModel *)cellModel {
    [self updateCellModel:cellModel animation:UITableViewRowAnimationFade];
}

- (void)updateCellModel:(HHBaseCellModel *)cellModel animation:(UITableViewRowAnimation)animation {
    // 这里根据模型标题是否一样，是更新的哪个model
    NSMutableArray *tempData = [NSMutableArray arrayWithArray:self.dataArray];
    [tempData enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx1, BOOL * _Nonnull stop) {
        NSMutableArray *sections = (NSMutableArray *)obj;
        NSAssert([sections isKindOfClass:[NSMutableArray class]], @"此对象必须为一个可变数组,请检查数据源组装方式是否正确!");
        [sections enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx2, BOOL * _Nonnull stop) {
            HHBaseCellModel *model  = (HHBaseCellModel *)obj;
            if ([model.identifier isEqualToString:cellModel.identifier]) {
                //找到section中的数组
                NSMutableArray *rows = [self.dataArray hh_objectWithIndex:idx1];
                //找到某个具体哪一行，进行数据替换
                [rows replaceObjectAtIndex:idx2 withObject:cellModel];
                //更新cell
                NSIndexPath *path = [NSIndexPath indexPathForRow:idx2 inSection:idx1];
                [self.tableView beginUpdates];
                [self.tableView reloadRowsAtIndexPaths:@[path] withRowAnimation:animation];
                [self.tableView endUpdates];
                *stop = YES;
                return;
            }
        }];
    }];
}

- (void)setTableView:(UITableView *)tableView {
    objc_setAssociatedObject(self, @selector(tableView), tableView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UITableView *)tableView {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setDataArray:(NSMutableArray *)dataArray {
    objc_setAssociatedObject(self, @selector(dataArray), dataArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableArray *)dataArray {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setManager:(HHSetTableViewManager *)manager {
    objc_setAssociatedObject(self, @selector(manager), manager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (HHSetTableViewManager *)manager {
    return objc_getAssociatedObject(self, _cmd);
}

@end

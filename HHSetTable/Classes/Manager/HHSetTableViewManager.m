//
//  HHSetTableViewManager.m
//  Pods
//
//  Created by Henry on 2021/5/18.
//

#import "HHSetTableViewManager.h"
#import "HHBaseTableViewCell.h"
#import "HHBaseCellModel.h"
#import "HHSectionModel.h"
#import "HHSetTableConst.h"
#import "NSArray+HHSafeAccess.h"

@interface HHSetTableViewManager ()

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation HHSetTableViewManager

- (instancetype)initSetTableViewManager:(NSMutableArray *)dataSource {
    self = [super init];
    if (self) {
        self.dataSource = dataSource;
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSMutableArray *rows = [self.dataSource hh_objectWithIndex:section];
    NSAssert([rows isKindOfClass:[NSMutableArray class]], @"此对象必须为一个可变数组,请检查数据源组装方式是否正确!");
    return rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSMutableArray *sections = [self.dataSource hh_objectWithIndex:indexPath.section];
    NSAssert([sections isKindOfClass:[NSMutableArray class]], @"此对象必须为一个可变数组,请检查数据源组装方式是否正确!");
    HHBaseCellModel *cellModel = (HHBaseCellModel *)[sections hh_objectWithIndex:indexPath.row];
    Class class = NSClassFromString(cellModel.cellClass);
    NSAssert([class isSubclassOfClass:[HHBaseTableViewCell class]], @"此cellclass类别必须存在,并且继承HHBaseTableViewCell");
    HHBaseTableViewCell *cell = [class cellWithIdentifier:cellModel.cellClass tableView:tableView];
    [cell setupDataModel:cellModel];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSMutableArray *sections = [self.dataSource hh_objectWithIndex:indexPath.section];
    NSAssert([sections isKindOfClass:[NSMutableArray class]], @"此对象必须为一个可变数组,请检查数据源组装方式是否正确!");
    HHBaseCellModel *cellModel = (HHBaseCellModel *)[sections hh_objectWithIndex:indexPath.row];
    [tableView deselectRowAtIndexPath:indexPath animated:cellModel.actionBlock == nil];
    if (cellModel.actionBlock) {
        cellModel.actionBlock(cellModel);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSMutableArray *sections = [self.dataSource hh_objectWithIndex:indexPath.section];
    NSAssert([sections isKindOfClass:[NSMutableArray class]], @"此对象必须为一个可变数组,请检查数据源组装方式是否正确!");
    HHBaseCellModel *cellModel = (HHBaseCellModel *)[sections hh_objectWithIndex:indexPath.row];
    Class class =  NSClassFromString(cellModel.cellClass);
    return [class getCellHeight:cellModel];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (!self.headerArray || self.headerArray.count == 0) {
        if (section == 0) {
            return 0;
        }
        return HH_SectionHeight;
    }
    HHSectionModel *header = (HHSectionModel *)[self.headerArray hh_objectWithIndex:section];
    return header ? header.viewHeight : HH_SectionHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (!self.headerArray || self.headerArray.count == 0) {
        return nil;
    }
    HHSectionModel *header = (HHSectionModel *)[self.headerArray hh_objectWithIndex:section];
    return header.view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    HHSectionModel *footer = (HHSectionModel *)[self.footerArray hh_objectWithIndex:section];
    return footer.viewHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    HHSectionModel *footer = (HHSectionModel *)[self.footerArray hh_objectWithIndex:section];
    return footer.view;
}

@end

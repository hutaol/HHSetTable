//
//  HHCustomCellModel.m
//  Pods
//
//  Created by Henry on 2021/5/18.
//

#import "HHCustomCellModel.h"
#import "HHSetTableConst.h"

@interface HHCustomCellModel () {
    NSString *privateCellClass; /// 私有变量
}

@end

@implementation HHCustomCellModel

- (instancetype)initWithCellIdentifier:(NSString *)cellIdentifier actionBlock:(ClickActionBlock)block {
    self = [super init];
    if (self) {
        self.actionBlock = block;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;

        // cellClass 为与cell类名绑定的自定义cell类名必须一致，类名作为identifier的重用标示符号,如果不一致将报错。
        privateCellClass = cellIdentifier;

    }
    return self;
}

- (NSString *)cellClass {
    return privateCellClass;
}

@end

//
//  HHSwitchCellModel.m
//  Pods
//
//  Created by Henry on 2021/5/18.
//

#import "HHSwitchCellModel.h"
#import "HHSetTableConst.h"

@implementation HHSwitchCellModel

- (instancetype)initWithTitle:(NSString *)title switchType:(BOOL)on switchBlock:(SwitchBlock)block {
    self = [super initWithTitle:title actionBlock:nil];
    if (self) {
        self.switchBlock = block;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.showArrow = NO;
        self.on = on;
    }
    return self;
}

- (NSString *)cellClass {
    return HHSwitchCellModelCellClass;
}

@end

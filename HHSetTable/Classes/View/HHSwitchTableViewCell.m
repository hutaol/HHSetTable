//
//  HHSwitchTableViewCell.m
//  Pods
//
//  Created by Henry on 2021/5/18.
//

#import "HHSwitchTableViewCell.h"
#import "HHSwitchCellModel.h"

@interface HHSwitchTableViewCell ()

@property (nonatomic, strong) UISwitch *switchItem;

@end

@implementation HHSwitchTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (HHBaseTableViewCell *)cellWithIdentifier:(NSString *)cellIdentifier tableView:(UITableView *)tableView {
    HHSwitchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[HHSwitchTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    return cell;
}

- (void)setupUI {
    [super setupUI];
}

- (void)setupDataModel:(HHBaseCellModel *)model {
    [super setupDataModel:model];
    HHSwitchCellModel *switchModel = (HHSwitchCellModel *)model;
    self.switchItem.on = switchModel.on;
    if (switchModel.onTintColor) {
        self.switchItem.onTintColor = switchModel.onTintColor;
    }
    self.accessoryView = self.switchItem;
}

- (void)switchChang:(UISwitch *)switchItem {
    HHSwitchCellModel *model = (HHSwitchCellModel *)self.cellModel;
    model.on = switchItem.on;
    if (model.switchBlock) {
        model.switchBlock(self.cellModel, switchItem.on);
    }
}

- (UISwitch *)switchItem {
    if (!_switchItem) {
        _switchItem = [[UISwitch alloc] initWithFrame:CGRectZero];
        [_switchItem addTarget:self action:@selector(switchChang:) forControlEvents:UIControlEventValueChanged];
    }
    return _switchItem;
}

@end

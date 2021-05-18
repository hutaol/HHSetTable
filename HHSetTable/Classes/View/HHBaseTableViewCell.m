//
//  HHBaseTableViewCell.m
//  Pods
//
//  Created by Henry on 2021/5/17.
//

#import "HHBaseTableViewCell.h"
#import "HHBaseCellModel.h"

@implementation HHBaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (HHBaseTableViewCell *)cellWithIdentifier:(NSString *)cellIdentifier tableView:(UITableView *)tableView {
    HHBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[HHBaseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
}

- (void)setupDataModel:(HHBaseCellModel *)model {
    self.cellModel = model;
    self.selectionStyle = model.selectionStyle;
    self.backgroundColor = model.backgroundColor;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

+ (CGFloat)getCellHeight:(HHBaseCellModel *)model {
    return model.cellHeight;
}

@end

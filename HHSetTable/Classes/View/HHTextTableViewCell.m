//
//  HHTextTableViewCell.m
//  Pods
//
//  Created by Henry on 2021/5/18.
//

#import "HHTextTableViewCell.h"
#import "HHTextCellModel.h"

@implementation HHTextTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (HHBaseTableViewCell *)cellWithIdentifier:(NSString *)cellIdentifier tableView:(UITableView *)tableView {
    HHTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[HHTextTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (void)setupUI {
    [super setupUI];
    
}

- (void)setupDataModel:(HHBaseCellModel *)model {
    [super setupDataModel:model];
    
    HHTextCellModel *rightModel = (HHTextCellModel *)model;

    if (rightModel.attributeTitle) {
        self.detailTextLabel.numberOfLines = 1;
        self.detailTextLabel.attributedText = rightModel.attributeDetailText;
    } else {
        self.detailTextLabel.numberOfLines = 0;
        self.detailTextLabel.text = rightModel.detailText;
        self.detailTextLabel.textColor = rightModel.detailColor;
        self.detailTextLabel.font = rightModel.detailFont;
    }
    
}

@end

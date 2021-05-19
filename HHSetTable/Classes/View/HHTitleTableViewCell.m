//
//  HHTitleTableViewCell.m
//  Pods
//
//  Created by Henry on 2021/5/17.
//

#import "HHTitleTableViewCell.h"
#import "HHTitleCellModel.h"

@interface HHTitleTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation HHTitleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (HHBaseTableViewCell *)cellWithIdentifier:(NSString *)cellIdentifier tableView:(UITableView *)tableView {
    HHTitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[HHTitleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (void)setupUI {
    [super setupUI];

}

- (void)setupDataModel:(HHBaseCellModel *)model {
    [super setupDataModel:model];
    
    HHTitleCellModel *cellModel = (HHTitleCellModel *)model;
    if (cellModel.attributeTitle) {
        self.textLabel.attributedText = cellModel.attributeTitle;
    } else {
        self.textLabel.text = cellModel.title;
        self.textLabel.textColor = cellModel.titleColor;
        self.textLabel.font = cellModel.titleFont;
    }
    self.textLabel.textAlignment = cellModel.titleTextAlignment;
    self.imageView.image = cellModel.icon;
       
    if (cellModel.showArrow) {
        self.arrowImageView.image = cellModel.arrowImage;
        self.arrowImageView.frame = CGRectMake(0, 0, cellModel.arrowWidth, cellModel.arrowHeight);
        self.accessoryView = self.arrowImageView;
    } else {
        self.accessoryView = nil;
    }
       
}

- (UIImageView *)arrowImageView {
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc] init];
    }
    return _arrowImageView;
}

@end

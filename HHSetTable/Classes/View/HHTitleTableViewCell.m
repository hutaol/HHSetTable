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
    
    HHTitleCellModel *cellMoldel = (HHTitleCellModel *)model;
    if (cellMoldel.attributeTitle) {
        self.textLabel.attributedText = cellMoldel.attributeTitle;
    } else {
        self.textLabel.text = cellMoldel.title;
        self.textLabel.textColor = cellMoldel.titleColor;
        self.textLabel.font = cellMoldel.titleFont;
    }
    self.textLabel.textAlignment = cellMoldel.titleTextAlignment;
    self.imageView.image = cellMoldel.icon;
       
    if (cellMoldel.showArrow) {
        self.arrowImageView.image = cellMoldel.arrowImage;
        self.arrowImageView.frame = CGRectMake(0, 0, cellMoldel.arrowWidth, cellMoldel.arrowHeight);
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

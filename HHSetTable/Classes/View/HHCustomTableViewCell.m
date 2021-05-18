//
//  HHCustomTableViewCell.m
//  Pods
//
//  Created by Henry on 2021/5/18.
//

#import "HHCustomTableViewCell.h"

@implementation HHCustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (HHBaseTableViewCell *)cellWithIdentifier:(NSString *)cellIdentifier tableView:(UITableView *)tableView {
    HHCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        Class cellClass = NSClassFromString(cellIdentifier);
        NSAssert([cellClass isSubclassOfClass:[HHCustomTableViewCell class]], @"此cellclass类必须存在,并且继承HSCustomTableViewCell");
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

@end

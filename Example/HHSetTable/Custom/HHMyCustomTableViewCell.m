//
//  HHMyCustomTableViewCell.m
//  HHSetTable_Example
//
//  Created by Henry on 2021/5/19.
//  Copyright © 2021 1325049637@qq.com. All rights reserved.
//

#import "HHMyCustomTableViewCell.h"
#import "HHMyCustomCellModel.h"
#import <HHTool/UIFont+HHSize.h>

@interface HHMyCustomTableViewCell ()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *detailLabel;

@property (nonatomic, strong) HHMyCustomCellModel *myModel;

@end

@implementation HHMyCustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.iconView.frame = CGRectMake(10, 10, 60, 60);
    self.nameLabel.frame = CGRectMake(80, 10, 200, 30);
    self.detailLabel.frame = CGRectMake(80, 40, 200, 30);
}

- (void)onClick:(UITapGestureRecognizer *)sender {
    if (self.myModel.didSelectIconBlock) {
        UIImageView *imageView = (UIImageView *)sender.view;
        self.myModel.didSelectIconBlock(imageView);
    }
}

- (void)setupUI {
    [super setupUI];
    
    _iconView = [[UIImageView alloc] init];
    _nameLabel = [[UILabel alloc] init];
    _detailLabel = [[UILabel alloc] init];
    
    _iconView.layer.cornerRadius = 30;
    _iconView.backgroundColor = [UIColor redColor];
    _iconView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClick:)];
    [_iconView addGestureRecognizer:tap];
    
    [self.contentView addSubview:_iconView];
    [self.contentView addSubview:_nameLabel];
    [self.contentView addSubview:_detailLabel];
    
}

- (void)setupDataModel:(HHBaseCellModel *)model {
    [super setupDataModel:model];
    
    self.myModel = (HHMyCustomCellModel *)model;
    
    _nameLabel.text = self.myModel.name;
    _detailLabel.text = self.myModel.detail;

    [self changeFont];
}

- (void)changeFont {
    _nameLabel.font = [UIFont fontOfSize:17];
    _detailLabel.font = [UIFont fontOfSize:17];
}

@end

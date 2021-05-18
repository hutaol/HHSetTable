//
//  HHSectionModel.m
//  Pods
//
//  Created by Henry on 2021/5/18.
//

#import "HHSectionModel.h"

@implementation HHSectionModel

- (instancetype)initWithView:(UIView *)view viewHeight:(CGFloat)viewHeight {
    self = [super init];
    if (self) {
        _view = view;
        _viewHeight = viewHeight;
    }
    return self;
}

@end

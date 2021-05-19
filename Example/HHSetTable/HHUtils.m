//
//  HHUtils.m
//  HHSetTable_Example
//
//  Created by Henry on 2021/5/19.
//  Copyright © 2021 1325049637@qq.com. All rights reserved.
//

#import "HHUtils.h"

@implementation HHUtils

+ (UIColor *)randomColor {
    NSInteger aRedValue = arc4random() % 255;
    NSInteger aGreenValue = arc4random() % 255;
    NSInteger aBlueValue = arc4random() % 255;
    UIColor *randColor = [UIColor colorWithRed:aRedValue / 255.0f green:aGreenValue / 255.0f blue:aBlueValue / 255.0f alpha:1.0f];
    return randColor;
}

@end

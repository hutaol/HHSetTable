//
//  UIColor+HHSetTheme.h
//  Pods
//
//  Created by Henry on 2021/5/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (HHSetTheme)

+ (instancetype)hh_colorWithHexString:(NSString *)hexString;
+ (instancetype)hh_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

+ (UIColor *)hh_colorWithLightColor:(UIColor *)lightColor darkColor:(UIColor *)darkColor;

+ (UIColor *)titleColor;
+ (UIColor *)detailColor;

+ (UIColor *)cellColor;

@end

NS_ASSUME_NONNULL_END

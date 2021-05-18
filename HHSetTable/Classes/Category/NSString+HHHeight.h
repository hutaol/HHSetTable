//
//  NSString+HHHeight.h
//  Pods
//
//  Created by Henry on 2021/5/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (HHHeight)

- (CGFloat)hh_heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;

- (CGFloat)hh_widthWithFont:(UIFont *)font constrainedToheight:(CGFloat)height;

@end

NS_ASSUME_NONNULL_END

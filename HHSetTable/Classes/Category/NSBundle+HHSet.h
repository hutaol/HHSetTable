//
//  NSBundle+HHSet.h
//  Pods
//
//  Created by Henry on 2021/5/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (HHSet)

+ (UIImage *)getImageForHHSet:(NSString *)name;
+ (NSString *)getSetFilePath:(NSString *)name type:(NSString *)type;

@end

NS_ASSUME_NONNULL_END

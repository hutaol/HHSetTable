//
//  HHSectionModel.h
//  Pods
//
//  Created by Henry on 2021/5/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHSectionModel : NSObject

@property (nonatomic, strong) UIView *view;
@property (nonatomic, assign) CGFloat viewHeight;

- (instancetype)initWithView:(nullable UIView *)view viewHeight:(CGFloat)viewHeight;

@end

NS_ASSUME_NONNULL_END

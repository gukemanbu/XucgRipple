//
//  XucgRipple.h
//  XucgRipple
//
//  Created by xucg on 8/31/16.
//  Copyright © 2016 xucg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XucgRipple : UIView

@property (nonatomic, strong) UIImage   *image;          // 图像
@property (nonatomic, assign) NSInteger rippleCount;     // 脉冲数量
@property (nonatomic, assign) CGFloat   rippleDuration;  // 脉冲时间

- (instancetype) initMinRadius:(CGFloat)minRadius maxRadius:(CGFloat)maxRadius;
- (void)startAnimation;

@end

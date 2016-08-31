//
//  XucgRipple.m
//  XucgRipple
//
//  Created by xucg on 8/31/16.
//  Copyright © 2016 xucg. All rights reserved.
//

#import "XucgRipple.h"

@interface XucgRipple ()

@property (nonatomic, assign) CGFloat minRadius;
@property (nonatomic, assign) CGFloat maxRadius;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation XucgRipple

-(instancetype) initMinRadius:(CGFloat)minRadius maxRadius:(CGFloat)maxRadius {
    self = [super init];
    if (self) {
        
        _minRadius = minRadius;
        _maxRadius = maxRadius;
        
        _rippleCount = 5;
        _rippleDuration = 3;
        
        self.layer.cornerRadius = minRadius;
    }
    
    return self;
}

- (void)startAnimation {
    CALayer * animationLayer = [CALayer layer];
    for (int i = 0; i<_rippleCount; i++) {
        CALayer * pulsingLayer = [CALayer layer];
        pulsingLayer.frame = CGRectMake(0, 0, _maxRadius*2, _maxRadius*2);
        pulsingLayer.position = CGPointMake(_minRadius, _minRadius);
        pulsingLayer.backgroundColor = [UIColor colorWithWhite:1 alpha:0.7].CGColor;
        pulsingLayer.cornerRadius = _maxRadius;
        
        CAMediaTimingFunction * defaultCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
        
        CAAnimationGroup * animationGroup = [CAAnimationGroup animation];
        animationGroup.fillMode = kCAFillModeBackwards;
        animationGroup.beginTime = CACurrentMediaTime() + i * _rippleDuration / _rippleCount;
        animationGroup.duration = _rippleDuration;
        animationGroup.repeatCount = HUGE;
        animationGroup.timingFunction = defaultCurve;
        
        CABasicAnimation * scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.fromValue = @(_minRadius*2 / 414);
        scaleAnimation.toValue = @1.0;
        
        CAKeyframeAnimation * opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
        opacityAnimation.values = @[@1, @0.9, @0.8, @0.7, @0.6, @0.5, @0.4, @0.3, @0.2, @0.1, @0];
        opacityAnimation.keyTimes = @[@0, @0.1, @0.2, @0.3, @0.4, @0.5, @0.6, @0.7, @0.8, @0.9, @1];
        
        animationGroup.animations = @[scaleAnimation, opacityAnimation];
        [pulsingLayer addAnimation:animationGroup forKey:@"plulsing"];
        [animationLayer addSublayer:pulsingLayer];
    }
    
    [self.layer  addSublayer:animationLayer];
    
    [self addSubview:[self imageView]];
}

- (UIImageView*)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.frame = CGRectMake(0, 0, _minRadius*2, _minRadius*2);
        _imageView.backgroundColor = self.backgroundColor;
        _imageView.layer.cornerRadius = _minRadius;
        _imageView.layer.masksToBounds = YES;
    }
    
    return _imageView;
}

- (void)setImage:(UIImage *)image {
    [[self imageView] setImage:image];
}

@end

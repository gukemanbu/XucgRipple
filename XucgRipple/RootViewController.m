//
//  RootViewController.m
//  XucgRipple
//
//  Created by xucg on 8/31/16.
//  Copyright © 2016 xucg. All rights reserved.
//

#import "RootViewController.h"
#import "XucgRipple/XucgRipple.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat maxRadius = [UIScreen mainScreen].bounds.size.width / 2;
    
    XucgRipple *rippleView = [[XucgRipple alloc] initMinRadius:30 maxRadius:maxRadius];
    rippleView.rippleCount = 5;
    rippleView.rippleDuration = 4;
    rippleView.backgroundColor = [UIColor redColor];
    rippleView.image = [UIImage imageNamed:@"mzd.jpg"];
    rippleView.imageSize = CGSizeMake(130, 130);
    rippleView.rippleColor = [UIColor redColor];
    rippleView.borderWidth = 2;
    rippleView.borderColor = [UIColor greenColor];
    CGFloat x = ([UIScreen mainScreen].bounds.size.width - 130) / 2;
    rippleView.frame = CGRectMake(x, 200, 130, 130);
    [self.view addSubview:rippleView];
    [rippleView startAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

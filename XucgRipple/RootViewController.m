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

@property (weak, nonatomic) IBOutlet UIView *greenView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    XucgRipple *redView = [[XucgRipple alloc] initMinRadius:65 maxRadius:207];
    redView.rippleCount = 5;
    redView.rippleDuration = 3;
    redView.backgroundColor = [UIColor redColor];
    redView.image = [UIImage imageNamed:@"mzd.jpg"];
    CGFloat x = ([UIScreen mainScreen].bounds.size.width - 130) / 2;
    redView.frame = CGRectMake(x, 200, 130, 130);
    [self.view addSubview:redView];
    [redView startAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

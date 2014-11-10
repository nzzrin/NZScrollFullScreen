//
//  HideNavViewController.m
//  Doa Harian
//
//  Created by Anonymous on 11/8/14.
//  Copyright (c) 2014 Wired In. All rights reserved.
//

#import "HideNavViewController.h"

@interface HideNavViewController ()

@end

@implementation HideNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    
    
}

- (UIStatusBarStyle)preferredStatusBarStyle{return UIStatusBarStyleLightContent;}


@end

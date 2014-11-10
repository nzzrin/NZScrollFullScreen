//
//  DetailViewController.m
//  NZScrollFullScreen
//
//  Created by Anonymous on 11/10/14.
//  Copyright (c) 2014 Nazrin Almi. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize countLabel;

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController navigationBar].tintColor = [UIColor whiteColor];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger setInt = [[NSUserDefaults standardUserDefaults]
                          integerForKey:@"setInt"];
    NSString *inStr = [NSString stringWithFormat: @"%ld", (long)setInt];
    
    countLabel.text = inStr;
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

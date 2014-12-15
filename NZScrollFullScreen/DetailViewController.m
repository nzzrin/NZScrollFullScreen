//
//  DetailViewController.m
//  NZScrollFullScreen
//
//  Created by Anonymous on 11/10/14.
//  Copyright (c) 2014 Nazrin Almi. All rights reserved.
//

#import "DetailViewController.h"

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

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
    
    if(IS_IPHONE_6){
        
        countLabel.frame = CGRectMake(43, 209, 288, 249);
        
    }else if(IS_IPHONE_6P){
        
        countLabel.frame = CGRectMake(63, 243, 288, 249);
        
    }else{
        
        countLabel.frame = CGRectMake(16, 159, 288, 249);
        
    }
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
